//  👨‍🔬 Bayesian
//  Copyright © 2020 Naman Bishnoi. Licensed under MIT.
import Foundation

// This code is heavily inspired from https://en.wikipedia.org/wiki/Naive_Bayes_classifier#Multinomial_naïve_Bayes

// Constants.
// Term frequency calculates the frequency of term of the largest. It defines the importance of word for the document.
// term frequency–inverse document frequency (tf-idf) has its model accuracy on par with support vector machines (SVM).
public let MultinomialTf: Model = 1
// Only difference between boolean and tf is term is counted only once in it.
public let MultinomialBoolean: Model = 2

// Model defines the Naive-Bayes model that is used in classification.
public typealias Model = Int

// Label is alias of string, representing class of a document
public typealias Label = String

// Document is a structure to contain the label and its tokens.
public class Document {
    var label: Label
    var tokens: [String]
    public init(label: Label, toke: [String]) {
        self.label = label
        self.tokens = toke
    }
}

// The classifying class.
public class Classifier: BayesianClassifierDelegate {
    var model: Model
    var learningResults: [String: [Label: Int]]
    var priorProbablities: [Label: Double]
    var numberOfDocumentByLabel: [Label: Int]
    var numberOfFrequencyByLabel: [Label: Int]
    var numberOfAllDocuments: Int

    public init(newModel: Model) {
        self.learningResults = [:]
        self.priorProbablities = [:]
        self.numberOfDocumentByLabel = [:]
        self.numberOfFrequencyByLabel = [:]
        self.numberOfAllDocuments = 0
        self.model = newModel
    }

    public func learn(docs: [Document]) {
        self.numberOfAllDocuments += docs.count

        for doc in docs {
            // Contains the number of documents present by label in it.
            self.numberOfDocumentByLabel[doc.label] = (self.numberOfDocumentByLabel[doc.label] ?? 0) + 1

            if self.model == MultinomialBoolean {
                doc.tokens = removeDuplicates(tokens: doc.tokens)
            }

            for token in doc.tokens {
                // Total number of tokens per label. i.e. Which class are they assigned to by user.
                self.numberOfFrequencyByLabel[doc.label] = (self.numberOfFrequencyByLabel[doc.label] ?? 0) + 1
                
                // Tokenize and counts the frequency of each token by label and store it to learningResults dictionary.
                // This uses concepts of n-gram count vectorizer that counts token frequency.
                self.learningResults[token] = (self.learningResults[token] ?? [doc.label: 0])
                self.learningResults[token]![doc.label] = (self.learningResults[token]![doc.label] ?? 0)
                self.learningResults[token]![doc.label]!+=1
            }
        }
        for (label, documentCount) in self.numberOfDocumentByLabel {
            // Sets default probablity from which it will deviate according to number of classified tokens.
            self.priorProbablities[label] = log(Double(documentCount)/Double(self.numberOfAllDocuments))
        }
    }

    public func classify(tokens: [String]) -> ([Label: Double], Label, Bool) {
        let vocabularyCount = self.learningResults.count
        var posteriorProbablities: [Label: Double] = [:]

        for (label, priorProbablity) in self.priorProbablities {
            // Assigns the log( p(prior) ) to log( p(posterior) ) for initialization.
            posteriorProbablities[label] = priorProbablity
        }

        if self.model == MultinomialBoolean {
            var tokens = removeDuplicates(tokens: tokens)
        }

        for (label, frequencyByLabel) in self.numberOfFrequencyByLabel {
            // For each token, calculate the probablity of the token in the selected label and adds them to the default average.
            // This results in deviated probablities which will decide whether the email is considered to be spam or not.
            for token in tokens {
                // The Term Frequency of that token per label.
                let numberOfToken = (self.learningResults[token]?[label] ?? 0)
                
                // log ( p(posterior) ) = log( p(prior) ) + log( p(likelihood) / p(evidence) )
                // log ( p(posterior) ) = log( p(prior) ) + ∑log( (frequencyOfToken / frequencyByLabel + vocabularyCount) )
                posteriorProbablities[label]! += log(Double(numberOfToken+1)/Double(frequencyByLabel+vocabularyCount))
                // 0. The above example uses logarithmically scaled frequency for weighing scheme.
                // 1. numberOfToken+1 is done to support log normalization
                // 2. This helps in providing 'smooth' document term frequency.
            }
        }

        var certain: Bool = false
        var bestLabel: Label = Label()
        var highestProbablity: Double = 0
        
        // There is no need to inverse log the posterior probability as log( p(posterior) ) is directly proportional to p(posterior).
        // We only need to know which probability is greater than other to determine its class.
        
        // Check which probablity is larger, returns the label of the largest.
        for (label, probablity) in posteriorProbablities {
            if (highestProbablity == 0) || (probablity > highestProbablity) {
                certain = true
                bestLabel = label
                highestProbablity = probablity
            } else if probablity == highestProbablity {
                certain = false
            }
        }

        return (posteriorProbablities, bestLabel, certain)
    }
}
