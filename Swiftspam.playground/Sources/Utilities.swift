import Foundation

extension Classifier {
    func removeDuplicates(tokens: [String]) -> [String] {
        var mapTokens: [String: Bool] = [:]
        var newTokens: [String] = []

        for token in tokens {
            mapTokens[token] = true
        }

        for (key, _) in mapTokens {
            newTokens.append(key)
        }
        return newTokens
    }
}
