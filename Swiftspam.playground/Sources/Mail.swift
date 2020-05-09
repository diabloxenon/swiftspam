import Foundation

// The Anatomical structure of Email
public struct Mail: MailDelegate, Hashable {
    var id: Int = 0
    var subject: String = ""
    var from: String = ""
    var to: String = ""
    var body: String = ""
    var isSpam: Bool = false
    var reportedAsSpam: Bool

    public init(id: Int = 0, subject: String = "👋🏻 Hello, This is Swiftspam", from: String = "Naman Bishnoi", to: String = "WWDC 2020 Judges", body: String = "Swiftspam swiftly sweeps spam emails from your cluttered inbox. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum. Curabitur pretium tincidunt lacus. Nulla gravida orci a odio. Nullam varius, turpis et commodo pharetra, est eros bibendum elit, nec luctus magna felis sollicitudin mauris. Integer in mauris eu nibh euismod gravida. Duis ac tellus et risus vulputate vehicula. Donec lobortis risus a elit. Etiam tempor. Ut ullamcorper, ligula eu tempor congue, eros est euismod turpis, id tincidunt sapien risus a quam. Maecenas fermentum consequat mi. Donec fermentum. Pellentesque malesuada nulla a mi. Duis sapien sem, aliquet nec, commodo eget, consequat quis, neque. Aliquam faucibus, elit ut dictum aliquet, felis nisl adipiscing sapien, sed malesuada diam lacus eget erat. Cras mollis scelerisque nunc. Nullam arcu. Aliquam consequat. Curabitur augue lorem, dapibus quis, laoreet et, pretium ac, nisi. Aenean magna nisl, mollis quis, molestie eu, feugiat in, orci. In hac habitasse platea dictumst.", isSpam: Bool = false, reportedAsSpam: Bool = false) {
        self.id = id
        self.subject = subject
        self.from = from
        self.to = to
        self.body = body
        self.isSpam = isSpam
        self.reportedAsSpam = reportedAsSpam
    }
}


public var trainingData = [
    Mail(id: 0, subject: "Not Anymore", from: "Naman Bishnoi", to: "XLD", body: "No", isSpam: true, reportedAsSpam: false),
    Mail(id: 1, subject: "Hiya", from: "Naman Bishnoi", to: "Steve Jobs", body: "No", isSpam: true, reportedAsSpam: false),
    Mail(id: 2, subject: "iCloud Bug Bounty", from: "Red Hat", to: "Apple", body: "Find out more!", isSpam: true, reportedAsSpam: false),
    Mail(id: 3, subject: "Not Anymore", from: "Naman Bishnoi", to: "XLD", body: "No", isSpam: true, reportedAsSpam: false),
    Mail(id: 4, subject: "Not Anymore", from: "Naman Bishnoi", to: "XLD", body: "No", isSpam: true, reportedAsSpam: false),
    Mail(id: 5, subject: "RE: Verification Required #27556566", from: "idiotspammer@hax0r.com", to: "Naman Bishnoi", body: "INFO : Required-095-85579783-00 More Information please check attachment file [PDF]\n\n Your Apple ID was used to sign in to ICLoud via a Web Browser\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n", isSpam: true, reportedAsSpam: false),
    Mail(id: 6, subject: "Not Anymore", from: "Naman Bishnoi", to: "XLD", body: "No", isSpam: true, reportedAsSpam: false),
    Mail(id: 7, subject: "RE:", from: "Sinister Six", to: "Naman Bishnoi", body: "You have emerged as one of the lucky winners in the Guinness Brewery Promo, to receive €650,000.00. Kindly contact guinness004@outlook.de with your name age phone number occupation and address\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n", isSpam: true, reportedAsSpam: false),
    Mail(id: 8, subject: "Ready. Set. Code.", from: "Apple Developer", to: "Naman Bishnoi", body: "👨🏻‍💻 On June 22, WWDC20 takes off. Get ready for the first global, all-online WWDC by downloading the Apple Developer app to stay notified on all the latest news, with updates for events and sessions. And there’s a lot more to come — starting with the first-ever Swift Student Challenge. <Learn More>\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n", isSpam: false, reportedAsSpam: false),
    Mail(id: 9, subject: "[ILUG] What HOWTOs for SOHO system", from: "Dermot Daly", to: "Linus Torvalds", body: "Hi All, I'm trying to set up the following:\n 1. A Linux server running with a modem for internet connectivity and an ethernet card for LAN connectivity\n 2. Other LAN pcs with ethernet cards, using the Linux server for DNS/DHCP etc.\n\n Basically, I want to route any non LAN traffic through the ppp0. I've got some of the way, but like a similar post earlier about modem problems, when I am connected to the internet with eht0 up, the routing is all incorrect and noting goes out through ppp0 (eh0 must be the default route or something).\n Is there standard out of the box Linux tools that will carry out portmapping on behalf of the LAN PCs ?  (I'm planning on non routable addresses 192.168.x.x for the LAN, routed outwards via the ppp0 interface). Can someone point me at the right HOWTOs or routing documentation I need to follow? Thanks,Dermot.", isSpam: false, reportedAsSpam: false),
    Mail(id: 10),
]

public var testData = [
    Mail(id: 0, subject: "Not Anymore", from: "Naman Bishnoi", to: "XLD", body: "No", isSpam: true, reportedAsSpam: false),
    Mail(id: 1, subject: "Hiya", from: "Naman Bishnoi", to: "Steve Jobs", body: "No", isSpam: true, reportedAsSpam: false),
    Mail(id: 2, subject: "iCloud Bug Bounty", from: "Red Hat", to: "Apple", body: "Find out more!", isSpam: true, reportedAsSpam: false),
    Mail(id: 3, subject: "Not Anymore", from: "Naman Bishnoi", to: "XLD", body: "No", isSpam: true, reportedAsSpam: false),
    Mail(id: 4, subject: "Not Anymore", from: "Naman Bishnoi", to: "XLD", body: "No", isSpam: true, reportedAsSpam: false),
    Mail(id: 5, subject: "Not Anymore", from: "Naman Bishnoi", to: "XLD", body: "No", isSpam: true, reportedAsSpam: false),
    Mail(id: 6, subject: "Not Anymore", from: "Naman Bishnoi", to: "XLD", body: "No", isSpam: true, reportedAsSpam: false),
    Mail(id: 7, subject: "Not Anymore", from: "Naman Bishnoi", to: "XLD", body: "No", isSpam: true, reportedAsSpam: false),
    Mail(id: 8, subject: "Not Anymore", from: "Naman Bishnoi", to: "XLD", body: "No", isSpam: true, reportedAsSpam: false),
    Mail(id: 9, subject: "Not Anymore", from: "Naman Bishnoi", to: "XLD", body: "No", isSpam: true, reportedAsSpam: false),
    Mail(id: 10),
]
