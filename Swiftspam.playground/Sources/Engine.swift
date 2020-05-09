// Engine

public struct Fam {
    let labelClass: Label = "fam"
    var token: [String] = []
}

public struct Spam {
    let labelClass: Label = "spam"
    var token: [String] = []
}

// Remove duplicates occuring in dataset
func removeDuplicates(tokens: [String.SubSequence]) -> [String] {
        var mapTokens: [String: Bool] = [:]
        var newTokens: [String] = []

        for token in tokens {
            mapTokens[String(token)] = true
        }

        for (key, _) in mapTokens {
            newTokens.append(key)
        }
        return newTokens
}

// Preprocesses the data to plain tokenize words
func preprocess(data: String) -> [String] {
    // Splits into words
    // Remove duplicates
    return removeDuplicates(tokens: data.split(separator: " "))
}

// Adds Fam email to tokens (good list)
public func addFam( fam: inout Fam, mail: Mail) {
    fam.token.append(contentsOf: preprocess(data: mail.body))
}

// Add Spam email to tokens (bad list)
public func addSpam( spam: inout Spam, mail: Mail) {
    spam.token.append(contentsOf: preprocess(data: mail.body))
}

// Trains the MLModel with Bayesian
public func train(fam: Fam, spam: Spam) -> Classifier {
    let classifier = Classifier(newModel: MultinomialTf)
    classifier.learn(docs: [
        Document(label: fam.labelClass, toke: fam.token),
        Document(label: spam.labelClass, toke: spam.token)
    ])
    return classifier
}

// Tests the model on Test Mail sample.
public func test(mail: Mail, classifier: Classifier) -> Bool {
    var (allScores, label, certain) = classifier.classify(tokens: preprocess(data: mail.body))
    return label == "spam" ? true : false
}
