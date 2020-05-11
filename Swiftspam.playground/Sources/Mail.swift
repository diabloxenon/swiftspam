import Foundation

// The Anatomical structure of Email
public struct Mail: MailDelegate, Hashable {
    var 
        id: Int = 0
    var 
        subject: String = ""
    var 
        from: String = ""
    var 
        to: String = ""
    var 
        body: String = ""
    var 
        isSpam: Bool = false
    var 
        description: String = ""

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


public var trainingData = [
    Mail(
        id: 0, 
        subject: "Not Anymore", 
        from: "Naman Bishnoi", 
        to: "XLD", 
        body: "No", 
        isSpam: true,
        description: ""),
    
   Mail(
        id: 1, 
        subject: "RE: Verification Required #27556566", 
        from: "idiotspammer@hax0r.com", 
        to: "Naman Bishnoi", 
        body: "INFO : Required-095-85579783-00 More Information please check attachment file [PDF] \n\n Your Apple ID was used to sign in to ICLoud via a Web Browser\nAAPL_TRPB_1_6075253244.pdf", 
        isSpam: true, 
        description: "false"),
    
    Mail(
        id: 2, 
        subject: "Not Anymore", 
        from: "Naman Bishnoi", 
        to: "XLD", 
        body: "No", 
        isSpam: true, 
        description: "false"),
    
    Mail(
        id: 3, 
        subject: "RE:", 
        from: "Sinister Six", 
        to: "Naman Bishnoi", 
        body: "You have emerged as one of the lucky winners in the Guinness Brewery Promo, to receive €650,000.00. Kindly contact guinness004@outlook.de with your name age phone number occupation and address", 
        isSpam: true, 
        description: "false"),
    
    Mail(
        id: 4, 
        subject: "Ready. Set. Code.", 
        from: "Apple Developer", 
        to: "Naman Bishnoi", 
        body: "👨🏻‍💻 On June 22, WWDC20 takes off. Get ready for the first global, all-online WWDC by downloading the Apple Developer app to stay notified on all the latest news, with updates for events and sessions. And there’s a lot more to come — starting with the first-ever Swift Student Challenge. <Learn More>", 
        isSpam: false, 
        description: "false"),
    
    Mail(
        id: 5, 
        subject: "[ILUG] What HOWTOs for SOHO system", 
        from: "Dermot Daly", 
        to: "Linus Torvalds", 
        body: "Hi All, I'm trying to set up the following:\n 1. A Linux server running with a modem for internet connectivity and an ethernet card for LAN connectivity\n 2. Other LAN pcs with ethernet cards, using the Linux server for DNS/DHCP etc.\n\n Basically, I want to route any non LAN traffic through the ppp0. I've got some of the way, but like a similar post earlier about modem problems, when I am connected to the internet with eht0 up, the routing is all incorrect and noting goes out through ppp0 (eh0 must be the default route or something).\n Is there standard out of the box Linux tools that will carry out portmapping on behalf of the LAN PCs ?  (I'm planning on non routable addresses 192.168.x.x for the LAN, routed outwards via the ppp0 interface). Can someone point me at the right HOWTOs or routing documentation I need to follow? Thanks,Dermot.", 
        isSpam: false, 
        description: "false"),

    Mail(
        id: 6, 
        subject: "Not Anymore", 
        from: "Naman Bishnoi", 
        to: "XLD", 
        body: "No", 
        isSpam: true, 
        description: "false"),
    
    Mail(
        id: 7, 
        subject: "SAVE YOUR STUFF! Sign in to your Nokia account before it disappears forever!",
        from: "Nokia <info@nok1a.com>", 
        to: "Naman Bishnoi", 
        body: "SAVE YOUR STUFF!\nWe noticed you haven't used Nokia account to access Nokia services in quite a while. To protect your privacy, this account will be deleted in 14 days, so sign in now.\n If you haven't experienced Nokia services recently, they're worth another look. And you may want to keep any maps, locations, email, music, reviews, or other stuff that is associated with your account.\n\nIt just takes few seconds to sign in to your Nokia account.\n\nWe hope to see you soon.\n\n Sincerely,\n The Nokia account team", 
        isSpam: true, 
        description: "Although very convincing, the real Nokia wouldn't be sending you a 'Save your stuff' email from info@nok1a.com and moreover you can see how the email name <nok1a.com> differs from the real domain <nokia.com>"),
    
    Mail(
        id: 8, 
        subject: "Information",
        from: "Manager Sam Porter Bridges", 
        to: "Naman Bishnoi", 
        body: "<html><body><a href='http://gogogo.world'>Notification\nOur courier couldnt make the delivery of parcel to you at 20th August.\n Print label and show it in the nearest post office.</a></body></html>", 
        isSpam: true, 
        description: "This whole email was a gigantic hyperlink, so if you clicked anywhere in the email, you would initiate the malicious attack."),
    
    Mail(
        id: 9, 
        subject: "Not Anymore", 
        from: "Naman Bishnoi", 
        to: "XLD", 
        body: "No", 
        isSpam: true, 
        description: "false"),

    Mail(
        id: 10, 
        subject: "Special Order Delivery Problem", 
        from: "Naman Bishnoi", 
        to: "XLD", 
        body: "Sir/Madam,\n\nYour order BBY-4983814314 has not been delivered because the specified address was not correct.\nPlease fill this form and send it back with your reply to this message.\n\n\nIf we do not receive your reply within a week we will pay your money back less 17 because your order was reserved for the time of Christmas holidays.", 
        isSpam: true, 
        description: "Legit companies know how to spell, In addition to the generic salutation, grammar gaffes are usually a good clue that something is wrong. 'Please fill this form…' And notice the ‘17’ reference in the middle of the sentence."),
    
    Mail(
        id: 11, 
        subject: "Hiya", 
        from: "Naman Bishnoi", 
        to: "Steve Jobs", 
        body: "No", 
        isSpam: true, 
        description: "false"),
    
    Mail(
        id: 12, 
        subject: "iCloud Bug Bounty", 
        from: "Red Hat", 
        to: "Apple", 
        body: "Find out more!", 
        isSpam: true, 
        description: "false"),
    
    Mail(
        id: 13, 
        subject: "Scheduled Home Delivery Problem", 
        from: "Costco Shipping Agent <manager@cbcbuilding.com", 
        to: "Naman Bishnoi", 
        body: "Costco®\nUnfortunately the delivery of your order COS-0077945599 was cancelled since the specified address of the recepient was not correct. You are recommended to complete this form and send it back with your reply to us.\nPlease do this within the period of one week - if we don't get your timely reply you will be paid your money back less 21% since your order was booked from Chrismas. ", 
        isSpam: true, 
        description: "Legit companies have domain emails, "),
    
    Mail(
        id: 14, 
        subject: "Not Anymore", 
        from: "Naman Bishnoi", 
        to: "XLD", 
        body: "No", 
        isSpam: true, 
        description: "false"),
    
    Mail(
        id: 15, 
        subject: "Not Anymore", 
        from: "Naman Bishnoi", 
        to: "XLD", 
        body: "No", 
        isSpam: true, 
        description: "false"),
    
    Mail(
        id: 16, 
        subject: "Confirmation of your request from Hotels.com", 
        from: "Hotels.com <Hotelscom@roktpowered.com>", 
        to: "Naman Bishnoi", 
        body: "Coupon code $50 off, when you spend $350 or more. You must click through this email or book through our app to redeem this coupon. Bookings using this coupon are not eligible for Hotels.com™ Rewards. How to reedem your coupon:\n1. Click this email or open our app (this will activate your coupon)\n2. Search from thousand of hotels worldwide.\n3. Book using your unique coupon code.(Enter code on the booking form).\n\nTerms and Conditions\nThis offer is for email subscribers. It's only valid when you click through from your Hotels.com coupon email. Access your Hotels.com coupon email from your email inbox and click through to our website. Apply your discount before you book.\nUse this coupon to get $50 off the price of your booking at a participating Best Price Guarantee hotel when you stay between 1 and 28 nights and you spend a minimum of $350 for your entire stay.", 
        isSpam: true, 
        description: "Legit companies usually call you by your name, This is a very convincing email.\n For me, the clue was in the email domain."),
    
    Mail(
        id: 17, 
        subject: "Not Anymore", 
        from: "Naman Bishnoi", 
        to: "XLD", 
        body: "No", 
        isSpam: true, 
        description: "false"),
    
    Mail(
        id: 18, 
        subject: "Not Anymore", 
        from: "Naman Bishnoi", 
        to: "XLD", 
        body: "No", 
        isSpam: true, 
        description: "false"),
    
    Mail(
        id: 19, 
        subject: "Restore your account", 
        from: "PayTrans <VT@paytrans.com>", 
        to: "Naman Bishnoi", 
        body: "Dear customer,\nWe regret to inform you that your account has been restricted.\nTo continue using our services please download the file attached to this e-mail and update your login information.\n\nCopyright, PaymentTransferInc\n\n\n[update2816.html]", 
        isSpam: true, 
        description: "Legit companies don’t request your sensitive information via email. Notice the generic salutation at the beginning, and the unsolicited web link attachment?"),
    
    Mail(
        id: 20),
]

public var testData = [
    
    Mail(
        id: 0, 
        subject: "NEW PRODUCT!!!", 
        from: "kukelag@vis90kf.com", 
        to: "Naman Bishnoi", 
        body: "hello ar you satisfi with your isp do you have number email address for you and your famili do you have number mb of person webspac how truli unlimit is your access time our internet servic provid you with all of that at a low monthli fee of just dollarnumb number you get number email address numbermb of person webspac and number hour of access time per month virtual unlimit that is more than most peopl will us do the math we have local number for mani area for further inform pleas email me at emailaddr and place request inform in the subject line if you do not wish ani more mail pleas send a blank email to emailaddr regard steve murphi numberjrzsnumb numberrrsrnumberrvqgnumb numbersctlnumberoiejnumb numbergrtznumberlnumb httpaddr", 
        isSpam: true,
        description: "false"),
    
    Mail(
        id: 1, 
        subject: "Hiya", 
        from: "Naman Bishnoi", 
        to: "Steve Jobs", 
        body: "No", 
        isSpam: true, 
        description: "false"),
    
    Mail(
        id: 2, 
        subject: "iCloud Bug Bounty", 
        from: "Red Hat", 
        to: "Apple", 
        body: "Find out more!", 
        isSpam: true, 
        description: "false"),
    
    Mail(
        id: 3, 
        subject: "Not Anymore", 
        from: "Naman Bishnoi", 
        to: "XLD", 
        body: "No", 
        isSpam: true, 
        description: "false"),
    
    Mail(
        id: 4, 
        subject: "Not Anymore", 
        from: "Naman Bishnoi", 
        to: "XLD", 
        body: "No", 
        isSpam: true, 
        description: "false"),
    
    Mail(
        id: 5, 
        subject: "Not Anymore", 
        from: "Naman Bishnoi", 
        to: "XLD", 
        body: "No", 
        isSpam: true, 
        description: "false"),
    
    Mail(
        id: 6, 
        subject: "Not Anymore", 
        from: "Naman Bishnoi", 
        to: "XLD", 
        body: "No", 
        isSpam: true, 
        description: "false"),
    
    Mail(
        id: 7, 
        subject: "Not Anymore", 
        from: "Naman Bishnoi", 
        to: "XLD", 
        body: "No", 
        isSpam: true, 
        description: "false"),
    
    Mail(
        id: 8, 
        subject: "Not Anymore", 
        from: "Naman Bishnoi", 
        to: "XLD", 
        body: "No", 
        isSpam: true, 
        description: "false"),
    
    Mail(
        id: 9, 
        subject: "Not Anymore", 
        from: "Naman Bishnoi", 
        to: "XLD", 
        body: "No", 
        isSpam: true, 
        description: "false"),
    
    Mail(
        id: 10, 
        subject: "Not Anymore", 
        from: "Naman Bishnoi", 
        to: "XLD", 
        body: "No", 
        isSpam: true, 
        description: "false"),
]
