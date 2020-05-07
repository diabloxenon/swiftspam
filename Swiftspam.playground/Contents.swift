//: A Cocoa based Playground to present user interface

import AppKit
//import PlaygroundSupport

//let nibFile = NSNib.Name("Swiftspam")
//var topLevelObjects: NSArray?
//
//Bundle.main.loadNibNamed(nibFile, owner: nil, topLevelObjects: &topLevelObjects)
//let views = (topLevelObjects as! [Any]).filter { $0 is NSView }
//
//// Present the view in Playground
//PlaygroundPage.current.liveView = views[0] as! NSView

let Fam: Label = "fam"
let Spam: Label = "spam"

var FamToke: [String] = ["good", "better", "best"]
var SpamToke: [String] = ["bad", "evil", "worst"]

var yoo = Classifier(newModel: MultinomialTf)

yoo.learn(docs: [
    Document(label: Fam, toke: FamToke),
    Document(label: Spam, toke: SpamToke)
])

var (allScores, cls, cert) = yoo.classify(tokens: ["iam", "good", "now"])

print(allScores, cls, cert)
