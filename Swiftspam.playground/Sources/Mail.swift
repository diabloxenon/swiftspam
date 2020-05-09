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

//    init(subject: String, from: String, to: String, body: String, isSpam: Bool) {
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


// public struct Mail: Hashable {
//     var id: Int
    
//     let subject: String
//     let from: String
//     let to: String
//     let body: String
//     let isSpam: Bool
//     var reportedAsSpam: Bool
// }
