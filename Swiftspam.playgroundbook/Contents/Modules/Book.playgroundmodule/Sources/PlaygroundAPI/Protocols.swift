//  🚸 Protocols
//  Copyright © 2020 Naman Bishnoi. Licensed under MIT.
import Foundation

// BayesianClassifierDelegate ensures the conformation of object for classifying document.
protocol BayesianClassifierDelegate {
    // Stores the trained model.
    var model: Model {get set}
    // Learning results contains the tokens with their term frequencies.
    var learningResults: [String: [Label: Int]] {get set}
    // Probablities set during learning process
    var priorProbablities: [Label: Double] {get}
    // Total number of documents contained in a label
    var numberOfDocumentByLabel: [Label: Int] {get}
    // numberOfFrequencyByLabel for track-keeping of labels
    var numberOfFrequencyByLabel: [Label: Int] {get}
    // numberOfAllDocuments feeded into classifier
    var numberOfAllDocuments: Int {get}

    // For training phase
    func learn(docs: [Document])
    // For testing phase
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
