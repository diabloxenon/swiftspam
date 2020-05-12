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
        let allowed = Set("abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLKMNOPQRSTUVWXYZ1234567890")
        return self.filter {allowed.contains($0) }
    }
}

extension Color {
    public static let swiftspamBG1: Color = Color(.sRGB, red: (132/255.0), green: (123/255.0), blue: (223/255.0), opacity: 1.0)
    public static let swiftspamBG2: Color = Color(.sRGB, red: (168/255.0), green: (243/255.0), blue: (195/255.0), opacity: 1.0)
    // public static let swiftspamBG2: Color = Color(.sRGB, red: (66/255.0), green: (247/255.0), blue: (129/255.0), opacity: 1.0)
    // public static let swiftspamBG1: Color = Color(.sRGB, red: (25/255.0), green: (140/255.0), blue: (255/255.0), opacity: 1.0)
    // public static let swiftspamBG2: Color = Color(.sRGB, red: (69/255.0), green: (235/255.0), blue: (170/255.0), opacity: 1.0)
    // public static let swiftspamBG1: Color = Color(.sRGB, red: (99/255.0), green: (160/255.0), blue: (202/255.0), opacity: 1.0)
    // public static let swiftspamBG1: Color = Color(.sRGB, red: (203/255.0), green: (203/255.0), blue: (160/255.0), opacity: 1.0)
    // public static let swiftspamBG2: Color = Color(.sRGB, red: (181/255.0), green: (181/255.0), blue: (73/255.0), opacity: 1.0)
    public static let swiftspamCardBG2: Color = Color(.sRGB, red: (252/255.0), green: (250/255.0), blue: (250/255.0), opacity: 1.0)
    public static let swiftspamCardBG1: Color = Color(.sRGB, red: (230/255.0), green: (233/255.0), blue: (234/255.0), opacity: 1.0)
    public static let swiftspamInfoBG2: Color = Color(.sRGB, red: (51/255.0), green: (51/255.0), blue: (51/255.0), opacity: 1.0)
    public static let swiftspamInfoBG1: Color = Color(.sRGB, red: (14/255.0), green: (14/255.0), blue: (14/255.0), opacity: 1.0)
}
