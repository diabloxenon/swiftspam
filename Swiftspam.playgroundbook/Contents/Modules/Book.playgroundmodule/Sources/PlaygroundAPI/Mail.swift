// 📧 Mail
//  Copyright © 2020 Naman Bishnoi. Licensed under MIT.
import Foundation

// The Anatomical structure of Email 📧
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
        from: String = "🦸🏻‍♂️ Naman Bishnoi", 
        to: String = "👨‍⚖️ WWDC 2020 Judges 👩‍⚖️", 
        body: String = "📨 Swiftspam swiftly sweeps spam emails from your cluttered inbox.\nSwipe 👈Left for 👻 Spam, 👉Right for 👍🏻 Fam\n\nYou can always click on Learn More ℹ️ button for hints about current email and identify them in your daily life.", 
        isSpam: Bool = false,
        description: String = "Get hint about current email whether they are spam or not 😄\n\n▫️ SPAM: Also known as junk email, designed to trick you into thinking their message is worth reading.\n▫️ SCAMS: Intentional deceptions made for gain, or to cause damage through email.\n▫️ PHISHING: Phishing emails try to entice you into disclosing personal information, such as your username, password or bank account details.\n▫️ HOAX: Warnings about a non-existent threat, or an offer that sounds good to be true.\n▫️ SPOOFING: When the sender address of an email has been altered to hide its true origin, used by virus and spam authors to make their emails look legitimate and lure people into clicking on links or downloading attachments.") {
        self.id = id
        self.subject = subject
        self.from = from
        self.to = to
        self.body = body
        self.isSpam = isSpam
        self.description = description
    }
}
