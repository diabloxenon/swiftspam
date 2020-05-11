import Foundation
import SwiftUI

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

extension Color {
    public static let swiftspamBG1: Color = Color(.sRGB, red: (203/255.0), green: (203/255.0), blue: (160/255.0), opacity: 1.0)
    public static let swiftspamBG2: Color = Color(.sRGB, red: (181/255.0), green: (181/255.0), blue: (73/255.0), opacity: 1.0)
    public static let swiftspamCardBG2: Color = Color(.sRGB, red: (252/255.0), green: (250/255.0), blue: (250/255.0), opacity: 1.0)
    public static let swiftspamCardBG1: Color = Color(.sRGB, red: (230/255.0), green: (233/255.0), blue: (234/255.0), opacity: 1.0)
    public static let swiftspamInfoBG2: Color = Color(.sRGB, red: (51/255.0), green: (51/255.0), blue: (51/255.0), opacity: 1.0)
    public static let swiftspamInfoBG1: Color = Color(.sRGB, white: 0, opacity: 1.0)
}
