import Foundation

// Constants.
public let MultinomialTf: Model = 1
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
            self.numberOfDocumentByLabel[doc.label] = (self.numberOfDocumentByLabel[doc.label] ?? 0) + 1

            if self.model == MultinomialBoolean {
                doc.tokens = removeDuplicates(tokens: doc.tokens)
            }

            for token in doc.tokens {
                self.numberOfFrequencyByLabel[doc.label] = (self.numberOfFrequencyByLabel[doc.label] ?? 0) + 1

                self.learningResults[token] = (self.learningResults[token] ?? [doc.label: 0])
                self.learningResults[token]![doc.label]!+=1
            }
        }
        for (label, documentCount) in self.numberOfDocumentByLabel {
            self.priorProbablities[label] = log(Double(documentCount)/Double(self.numberOfAllDocuments))
        }
    }

    public func classify(tokens: [String]) -> ([Label: Double], Label, Bool) {
        let vocabularyCount = self.learningResults.count
        var posteriorProbablities: [Label: Double] = [:]

        for (label, priorProbablity) in self.priorProbablities {
            posteriorProbablities[label] = priorProbablity
        }

        if self.model == MultinomialBoolean {
            var tokens = removeDuplicates(tokens: tokens)
        }

        for (label, frequencyByLabel) in self.numberOfFrequencyByLabel {
            for token in tokens {
                let numberOfToken = (self.learningResults[token]?[label] ?? 0)
                posteriorProbablities[label]! += log(Double(numberOfToken+1)/Double(frequencyByLabel+vocabularyCount))
            }
        }

        var certain: Bool = false
        var bestLabel: Label = Label()
        var highestProbablity: Double = 0

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
