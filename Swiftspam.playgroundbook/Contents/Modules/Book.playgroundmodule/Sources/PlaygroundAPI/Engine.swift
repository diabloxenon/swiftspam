// 🚂 Engine
//  Copyright © 2020 Naman Bishnoi. Licensed under MIT.

// Types

// Familiar email goes here.
public struct Fam {
    public let labelClass: Label
    public var token: [String]
    public init(labelClass: Label = Label("fam"), token: [String] = []){
        self.labelClass = labelClass
        self.token = token
    }
}

// Suspicious emails goes here.
public struct Spam {
    public let labelClass: Label
    public var token: [String]
    public init(labelClass: Label = Label("spam"), token: [String] = []){
        self.labelClass = labelClass
        self.token = token
    }
}

// Possible outcomes.
// 1. SpamSpam (True Negative)  ->  👻 Spam
// 2. FamFam   (True Positive)  ->  👍🏻 Fam
// 3. FamSpam  (False Positive) ->  ⚠️ False ➕
// 4. SpamFam  (False Negative) ->  ⚠️ False ➖
public enum Results:Int {
    case SpamSpam, SpamFam, FamSpam, FamFam, None
}

// Functions

// 🤖 Preprocesses the data to vectorize tokens
func preprocess(data: String) -> [String] {
    // Filters symbols; lowercases the words; replaces newline characters with spaces; tokenize string
    return data.filterAlphanum.lowercased().replacingOccurrences(of: "\n", with: " ").split(separator: " ").map { String($0) }
}

// Adds 👍🏻 Fam email to tokens (good list)
public func addFam( fam: inout Fam, mail: Mail) {
    fam.token.append(contentsOf: preprocess(data: mail.body))
}

// Add 👻 Spam email to tokens (bad list)
public func addSpam( spam: inout Spam, mail: Mail) {
    spam.token.append(contentsOf: preprocess(data: mail.body))
}

// 🏋️ Trains the MLModel with Bayesian
// NOTE: We have used two documents for two labels i.e. Spam and Fam
//       to ensure that there is no bias to model. Defining multiple
//      documents for different mails will result in larger false positives
//      hence decreasing effectiveness of the tf-idf bayesian model.
public func train(fam: Fam, spam: Spam) -> Classifier {
    let classifier = Classifier(newModel: MultinomialTf)
    classifier.learn(docs: [
        Document(label: fam.labelClass, toke: fam.token),
        Document(label: spam.labelClass, toke: spam.token)
    ])
    print(Document(label: fam.labelClass, toke: fam.token))
    print(Document(label: spam.labelClass, toke: spam.token))
    return classifier
}

// 🏃 Tests the model on Test Mail sample.
public func test(mail: Mail, classifier: Classifier) -> Results {
    var (_, label, _) = classifier.classify(tokens: preprocess(data: mail.body))
    // print(allScores, label, certain, mail.isSpam)
    if label=="spam" && mail.isSpam {
        return Results.SpamSpam
    } else if label=="fam" && !mail.isSpam {
        return Results.FamFam
    } else if label=="spam" && !mail.isSpam {
        return Results.SpamFam
    } else if label=="fam" && mail.isSpam {
        return Results.FamSpam
    } else {
        return Results.None
    }
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
