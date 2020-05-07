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

// BayesianClassifierDelegate ensures the conformation of object for classifying document.
protocol BayesianClassifierDelegate {
    var model: Model {get set}
    var learningResults: [String: [Label: Int]] {get set}
    var priorProbablities: [Label: Double] {get}
    var numberOfDocumentByLabel: [Label: Int] {get}
    // numberOfFrequencyByLabel for track-keeping of labels
    var numberOfFrequencyByLabel: [Label: Int] {get}
    // numberOfAllDocuments feeded into classifier
    var numberOfAllDocuments: Int {get}

    func learn(docs: [Document])
    func classify(tokens: [String]) -> ([Label: Double], Label, Bool)
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
            if self.numberOfDocumentByLabel[doc.label] == nil {
                self.numberOfDocumentByLabel[doc.label] = 0
            }
            self.numberOfDocumentByLabel[doc.label]!+=1

            if self.model == MultinomialBoolean {
                // TODO: Add a duplicate removal function.
                doc.tokens = removeDuplicates(tokens: doc.tokens)
            }

            for token in doc.tokens {
                if self.numberOfFrequencyByLabel[doc.label] == nil {
                    self.numberOfFrequencyByLabel[doc.label] = 0
                }
                self.numberOfFrequencyByLabel[doc.label]!+=1

                if self.learningResults[token] == nil {
                    self.learningResults[token] = [doc.label: 0]
                }
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
            // TODO: Add a duplicate removal function.
            var tokens = removeDuplicates(tokens: tokens)
        }

        for (label, frequencyByLabel) in self.numberOfFrequencyByLabel {
            for token in tokens {
                var numberOfToken: Int
                if self.learningResults[token]?[label] == nil {
                    numberOfToken = 0
                } else {
                    numberOfToken = self.learningResults[token]![label]!
                }
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
