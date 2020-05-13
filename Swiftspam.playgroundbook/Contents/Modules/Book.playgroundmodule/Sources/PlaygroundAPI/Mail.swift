import Foundation

// The Anatomical structure of Email
public struct Mail: MailDelegate, Hashable {
    public var id: Int = 0
    public var subject: String = ""
    public var from: String = ""
    public var to: String = ""
    public var body: String = ""
    public var isSpam: Bool = false
    public var description: String = ""

    public init(
        id: Int = 0, 
        subject: String = "👋🏻 Hello, This is Swiftspam", 
        from: String = "Naman Bishnoi", 
        to: String = "WWDC 2020 Judges", 
        body: String = "Swiftspam swiftly sweeps spam emails from your cluttered inbox.\n\n    PHISHING: Phishing emails try to entice you into disclosing personal information, such as your username, password or bank account details.\n    SPAM: Also known as junk email, designed to trick you into thinking their message is worth reading.\n    SCAMS: Intentional deceptions made for gain, or to cause damage through email.", 
        isSpam: Bool = false, 
        description: String = "This is a helpful message 😄, you can always click on info ℹ️ button to get hints about current email and how can you identify them in your organization.") {
        self.id = id
        self.subject = subject
        self.from = from
        self.to = to
        self.body = body
        self.isSpam = isSpam
        self.description = description
    }
}
