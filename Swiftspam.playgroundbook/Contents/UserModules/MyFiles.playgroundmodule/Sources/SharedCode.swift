//  /*#-localizable-zone(SharedCodeCopyright1)*/Copyright/*#-end-localizable-zone*/ © 2020 Naman Bishnoi./*#-localizable-zone(SharedCodeCopyright2)*/Spam mail data may differ slightly from real world, due to this project's requirements. Data is licensed under MIT./*#-end-localizable-zone*/

//#-localizable-zone(Shapes01)
// Shared Code
// Feeling adventurous? Play with the spam data here and its values and see how our Swiftspam engine reacts to that. 😎
//#-end-localizable-zone

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
        subject: "Shared Document Phishing Attacks", 
        from: "Naman Bishnoi", 
        to: "WWDC 2020 Judges", 
        body: "You may receive an e-mail that appears to come from file-sharing sites like Dropbox or Google Drive alerting you that a document has been shared with you. The link provided in these e-mails will take you to a fake login page that mimics the real login page and will steal your account credentials.", 
        isSpam: false, 
        description: "Things to remember\n\n▫️ Be especially cautious when opening attachments or clicking links if you receive an email containing a warning banner indicating that it originated from an external source.\n▫️ Inspect URLs carefully to make sure they’re legitimate and not imposter sites."),
    
    Mail(
        id: 15, 
        subject: "Whaling Phishing Attacks", 
        from: "Naman Bishnoi", 
        to: "WWDC 2020 Judges", 
        body: "Whaling is a popular ploy aimed at getting you to transfer money or send sensitive information to an attacker via email by impersonating a real company executive. Using a fake domain that appears similar to ours, they look like normal emails from a high-level official of the company, typically the CEO or CFO, and ask you for sensitive information (including usernames and passwords).", 
        isSpam: false, 
        description: "Things to remember\n\n▫️ Do not provide sensitive personal information (like usernames and passwords) over email.\n▫️ Watch for email senders that use suspicious or misleading domain names."),
    
    Mail(
        id: 16, 
        subject: "Confirmation of your request from Hotels.com", 
        from: "Hotels.com <Hotelscom@roktpowered.com>", 
        to: "Naman Bishnoi", 
        body: "Coupon code $50 off, when you spend $350 or more. You must click through this email or book through our app to redeem this coupon. Bookings using this coupon are not eligible for Hotels.com™ Rewards. How to reedem your coupon:\n1. Click this email or open our app (this will activate your coupon)\n2. Search from thousand of hotels worldwide.\n3. Book using your unique coupon code.(Enter code on the booking form).\n\nTerms and Conditions\nThis offer is for email subscribers. It's only valid when you click through from your Hotels.com coupon email. Access your Hotels.com coupon email from your email inbox and click through to our website. Apply your discount before you book.\nUse this coupon to get $50 off the price of your booking at a participating Best Price Guarantee hotel when you stay between 1 and 28 nights and you spend a minimum of $350 for your entire stay.", 
        isSpam: true, 
        description: "Legit companies usually call you by your name, This is a very convincing email.\nFor me, the clue was in the email's domain name. Always Inspect URLs carefully to make sure they’re legitimate and not imposter sites."),
    
    Mail(
        id: 17, 
        subject: "Spear Phishing Attacks", 
        from: "Naman Bishnoi", 
        to: "WWDC 2020 Judges", 
        body: "Spear phishing is a more sophisticated phishing attack that includes customized information that makes the attacker seem like a legitimate source. They may use your name and phone number and refer to your company in the e-mail to trick you into thinking they have a connection to you, making you more likely to click a link or attachment that they provide.", 
        isSpam: false, 
        description: "'Phishing' is the most common type of cyber attack that affects organizations like ours. Phishing attacks can take many forms, but they all share a common goal – getting you to share sensitive information such as login credentials, credit card information, or bank account details."),
    
    Mail(
        id: 18, 
        subject: "Always Think Before You Click", 
        from: "Naman Bishnoi", 
        to: "WWDC 2020 Judges", 
        body: "The most common way Ransomware 🏴‍☠️ enters corporate networks is through email. Often, scammers will include malicious links or attachments in emails that look harmless. To avoid this trap, please observe the following email best practices:\n▪️ Do not click on links or attachments from unrecognizable senders. Be especially wary of .zip or other compressed or executable file types.\n▪️ Do not provide sensitive personal information (like usernames and passwords) over email.\n▪️ Watch for email senders that use suspicious or misleading domain names.\n▪️ If you can’t tell if an email is legitimate or not, please refer to your company's protocol.", 
        isSpam: false, 
        description: "Be especially cautious when opening attachments or clicking links if you receive an email containing a warning banner indicating that it originated from an external source.\n\nIf your computer is infected with ransomware, you will typically be locked out of all programs and a “ransom screen” will appear. In the unfortunate event that you click a link or attachment that you suspect is malware or ransomware, please notify IT immediately."),
    
    Mail(
        id: 19, 
        subject: "Restore your account", 
        from: "PayTrans <VT@paytrans.com>", 
        to: "Naman Bishnoi", 
        body: "Dear customer,\nWe regret to inform you that your account has been restricted.\nTo continue using our services please download the file attached to this e-mail and update your login information.\n\nCopyright, PaymentTransferInc\n\n\n[update1337.html]", 
        isSpam: true, 
        description: "Legit companies don’t request your sensitive information via email. Notice the generic salutation at the beginning, and the unsolicited web link attachment?"),
    
    Mail(
        id: 20),
]



//#-localizable-zone(Shapes01)
// Test Cases mentioned here.
//#-end-localizable-zone

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
