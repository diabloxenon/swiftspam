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

extension String {
    
    var filterAlphanum: String {
        let allowed = Set("abcdefghijklmnopqrstuvwxyz ABCDEFGHIJKLKMNOPQRSTUVWXYZ1234567890")
        return self.filter {allowed.contains($0) }
    }
}
