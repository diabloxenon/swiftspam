import Foundation

// Constants.
let MultinomialTf: Model = 1
let MultinomialBoolean: Model = 2

// Model defines the Naive-Bayes model that is used in classification.
typealias Model = Int

// Label is alias of string, representing class of a document
typealias Label = String

// Document is a structure to contain the label and its tokens.
struct Document {
    var label: Label
    var tokens: [String]

}

// BayesianClassifierDelegate ensures the conformation of object for classifying document.
protocol BayesianClassifierDelegate {
    var model: Model {get set}
//    var learningResults: [String: [Label: Int]] {get set}
//    var priorProbablities: [Label: Double] {get}
//    var numberOfDocumentByLabel: [Label: Int] {get}
//    // numberOfFrequencyByLabel for track-keeping of labels
//    var numberOfFrequencyByLabel: [Label: Int] {get}
//    // numberOfAllDocuments feeded into classifier
    var numberOfAllDocuments: Int {get}

    func learn(docs: [Document])
    func classify(tokens: [String]) -> ([Label: Double], Label, Bool)
}

// The classifying class.
class Classifier: BayesianClassifierDelegate {
    var model: Model {
        get {
            return self.model
        }
        set{
            self.model = newValue
        }
    }

    var learningResults: [String: [Label: Int]]
    
    var priorProbablities: [Label: Double]

    var numberOfDocumentByLabel: [Label: Int]

    var numberOfFrequencyByLabel: [Label: Int]

    var numberOfAllDocuments: Int

    init(newModel: Model) {
        self.model = newModel
        self.learningResults = [:[:]]
        self.priorProbablities = [:]
        self.numberOfDocumentByLabel = [:]
        self.numberOfFrequencyByLabel = [:]
        self.numberOfAllDocuments = 0
    }

    func learn(docs: [Document]) {
        self.numberOfAllDocuments += docs.count

        for doc in docs {
            self.numberOfDocumentByLabel[doc.label]?+=1

            if self.model == MultinomialBoolean {
                // TODO: Add a duplicate removal function.
                doc.tokens = removeDuplicate(doc.tokens)
            }

            for token in doc.tokens {
                self.numberOfFrequencyByLabel[doc.label]?+=1

                if self.learningResults[token] == nil {
                    self.learningResults[token] = [doc.label: 0]
                }
                self.learningResults[token][doc.label]+=1
            }

        }
        for (label, documentCount) in self.numberOfDocumentByLabel {
            self.priorProbablities[label] = log(Double(documentCount)/Double(self.numberOfAllDocuments))
        }

    }

    func classify(tokens: [String]) -> ([Label: Double], Label, Bool) {
        let vocabularyCount = self.learningResults.count
        var posteriorProbablities:[Label:Double] = [:]

        for (label, priorProbablity) in self.priorProbablities {
            posteriorProbablities[label] = priorProbablity
        }

        if self.Model == MultinomialBoolean{
            // TODO: Add a duplicate removal function.
            var tokens = removeDuplicate(tokens)
        }

        for (label, frequencyByLabel) in self.numberOfFrequencyByLabel {
            for token in tokens{
                let numberOfToken = self.learningResults[token][label]
                posteriorProbablities[label] += log(Double(numberOfToken+1)/Double(frequencyByLabel+vocabularyCount))
            }
        }

        var certain:Bool
        var bestLabel:Label
        var highestProbablity:Double
        for (label, probablity) in posteriorProbablities{
            if highestProbablity == 0 || probablity > highestProbablity{
                certain=true
                bestLabel=label
                highestProbablity=probablity
            } else if probablity == highestProbablity{
                certain=false
            }
        }

        return posteriorProbablities, bestLabel, certain
    }

}
