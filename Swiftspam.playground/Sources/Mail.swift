import Foundation

// The Anatomical structure of Email
class Mail: MailDelegate {
    var subject: String = ""
    var from: String = ""
    var to: String = ""
    var body: String = ""
    var isSpam: Bool = false

//    public convenience init() {
//        self.init(subject: String = "👋🏻 Hello, This is Swiftspam", from: String = "Naman Bishnoi", to: String = "WWDC 2020 Judges", body: String = "Swiftspam swiftly sweeps spam emails from your cluttered inbox", isSpam: Bool = false)
//    }

//    init(subject: String, from: String, to: String, body: String, isSpam: Bool) {
        init(subject: String = "👋🏻 Hello, This is Swiftspam", from: String = "Naman Bishnoi", to: String = "WWDC 2020 Judges", body: String = "Swiftspam swiftly sweeps spam emails from your cluttered inbox", isSpam: Bool = false) {
        self.subject = subject
        self.from = from
        self.to = to
        self.body = body
        self.isSpam = isSpam
    }
}
