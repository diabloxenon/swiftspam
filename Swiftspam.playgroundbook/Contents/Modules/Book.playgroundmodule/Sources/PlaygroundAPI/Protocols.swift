import Foundation

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

// Mail Anatomy Protocol
protocol MailDelegate {
    var id: Int {get set}
    var subject: String {get set}
    var from: String {get set}
    var to: String {get set}
    var body: String {get set}
    var isSpam: Bool {get set}
}
