// Engine
public struct Fam {
    public let labelClass: Label
    public var token: [String]
    public init(labelClass: Label = Label("fam"), token: [String] = []){
        self.labelClass = labelClass
        self.token = token
    }
}

public struct Spam {
    public let labelClass: Label
    public var token: [String]
    public init(labelClass: Label = Label("spam"), token: [String] = []){
        self.labelClass = labelClass
        self.token = token
    }
}

public enum Results:Int {
    case SpamSpam, SpamFam, FamSpam, FamFam, None
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
    // Filters symbols
    // var temp = data.filterAlphanum
    //Lowercase the words to maximise ranking
    // temp = temp.lowercased()
    // Splits the sentences into words.
    // temp = temp.split(separator: " ")
    // Remove duplicates
    // return removeDuplicates(tokens: data.filterAlphanum.lowercased().split(separator: " "))
    // Using Term Frequency - IDF to classify emaisl with keyword freq.
    return data.filterAlphanum.lowercased().replacingOccurrences(of: "\n", with: " ").split(separator: " ").map { String($0) }
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
    print(Document(label: fam.labelClass, toke: fam.token))
    print(Document(label: spam.labelClass, toke: spam.token))
    return classifier
}

// Tests the model on Test Mail sample.
public func test(mail: Mail, classifier: Classifier) -> Results {
    var (allScores, label, certain) = classifier.classify(tokens: preprocess(data: mail.body))
    // return label == "spam" ? true : false
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
