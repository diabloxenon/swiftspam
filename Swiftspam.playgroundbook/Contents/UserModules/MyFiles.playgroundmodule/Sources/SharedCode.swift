//  /*#-localizable-zone(SharedCodeCopyright1)*/Copyright/*#-end-localizable-zone*/ © 2020 Naman Bishnoi. /*#-localizable-zone(SharedCodeCopyright2)*/Spam mail data may differ slightly from real world, due to this project's requirements. Data is licensed under MIT. DISCLAIMER: The following email addresses are collected from Spam or Ham dataset freely available at Spamassasin Data Corpora/*#-end-localizable-zone*/

//#-localizable-zone(Shapes01)
// Shared Code
// Feeling adventurous? Play with the spam data here and its values and see how our Swiftspam engine reacts to that. 😎
//#-end-localizable-zone

public var trainingData = [
    Mail(
        id: 0, 
        subject: "🙏🏻 Thanks for being here", 
        from: "🦸🏻‍♂️ Naman Bishnoi", 
        to: "👨‍⚖️ WWDC 2020 Judges 👩‍⚖️", 
        body: "Hello again, I hope you enjoyed training the model and learned how these Spam emails are low-key but critical threat to infrastructure.\nAfter training the email, tap on the 🥇 to proceed testing.\n\nA good classifier is necessary to protect yourself and company from these threats but then again, this is just a demonstation on how classification works and how you can manually identify this threat.\n\nThanks again.", 
        isSpam: false, 
        description: "Source code available at https://github.com/diabloxenon/swiftspam"),

    Mail(
        id: 1, 
        subject: "RE: Verification Required #27556566", 
        from: "idiotspammer@hax0r.com", 
        to: "🦸🏻‍♂️ Naman Bishnoi", 
        body: "INFO : Required-095-85579783-00 More Information please check attachment file [PDF] \n\n Your Apple ID was used to sign in to ICLoud via a Web Browser\nAAPL_TRPB_1_6075253244.pdf", 
        isSpam: true, 
        description: "false"),
    
    Mail(
        id: 2, 
        subject: "Goodbye Global Warming", 
        from: "Jim Whitehead <ejw@cse.ucsc.edu>", 
        to: "🦸🏻‍♂️ Naman Bishnoi", 
        body: "It is generally accepted that increases in CO2 in a closed environment subject to solar heating retain more of that solar energy. This is the current best explanation for the high temperature of Venus. If the CO2 concentration goes up globally (which it has), then theory states the earth should be retaining greater solar energy. This process may be slow, and may be difficult to monitor due to the variability of temperatures worldwide. I encourage you to refute any part of this causal chain linking CO2 to eventual increases in global energy content, part of which will be evident as heat.", 
        isSpam: false, 
        description: "Mail data is freely available at Apache Spamassasin Open Mail Corpora"),
    
    Mail(
        id: 3, 
        subject: "RE:", 
        from: "Sinister Six <noreply@dropoutmilano.com>", 
        to: "🦸🏻‍♂️ Naman Bishnoi", 
        body: "You have emerged as one of the lucky winners in the Guinness Brewery Promo, to receive €650,000.00. Kindly contact guinness004@outlook.de with your name age phone number occupation and address", 
        isSpam: true, 
        description: "Very similar to Nigerian beneficiary fraud scam email"),
    
    Mail(
        id: 4, 
        subject: "YET ANOTHER VIAGRA SPAM!!!", 
        from: "Killroy", 
        to: "Jimmy Beans", 
        body: "ironmandan explod your sex life all natur altern men of iron ha been featur on over number tv new and top radio station across america and we know why it realli work bui two bottl and get on free formul for men no doctor visit requir no prescript need not a drug click here to visit our web site iron man benefit number number formula for men dramat enhanc organ no neg side effect all natur ingredi boost multipl orgasm doe not increas blood pressur increas circul in men so erect becom firmer help men with a sexual respons dysfunct or lack of interest in sex clear impot problem boost multipl climax reliev emot up down and headach help reliev prostat problem lower cholesterol veri afford price visit our web site click here learn about our special offer", 
        isSpam: true, 
        description: "This is a filtered form of data I have performed in the same project written in Go. See at https://github.com/diabloxenon/spamaway"),
    
    Mail(
        id: 5, 
        subject: "Mail Agent", 
        from: "Hal DeVore <haldevore@acm.org>", 
        to: "Redhat <exmh-users@example.com>", 
        body: "Your sysadmins are wrong.\nWhatever program that is used to store the mail into the braindead 'mailbox' file (/var/spool/mail/whatever) is supposed to escape a line that begins with From.  That program is called the local Mail Delivery Agent (MDA)\n\nIt would be better if you never, ever, stored your mail in a 'mailbox' file.\n\nIf your sysadmins are capable of it, get them to set up the receiving Mail Transfer Agent (MTA) to allow the use of procmail as the local MDA.  Then use procmail to invoke rcvstore and deliver your mail directly into your MH mail folders.\n\nMost Linux systems come configured this way, if a user has a $HOME/.procmail file then mail is delivered using procmail.", 
        isSpam: false, 
        description: "Mail data is freely available at Apache Spamassasin Open Mail Corpora"),

    Mail(
        id: 6, 
        subject: "Not Anymore", 
        from: "David B. Thompson <thompson@shelob.ce.ttu.edu>", 
        to: "Linux Community", 
        body: "These are some good comments and I'd like to share an opinion here.  (Is that permitted? :)\n\nI started using linux about 8 or 9 years ago in rebellion against what the university was doing with Winder$.  I just couldn't get good support and was using a lot of unix-based tools (ported to Winder$) anyway. So, I jumped ship and became my own sysadm.\n\nWhat I got was the easy ability to use a shell (now ssh) to connect to my office box from just about anywhere and use either exmh or nmh (from the command line).  I can do email for the office fairly easily.\n\nI haven't seen any other tools that let me do that yet.  But, I have to admit, that some of the web-based mail software is getting pretty close.  Quoting and such is still primitive, but they're moving forward.", 
        isSpam: false, 
        description: "Mail data is freely available at Apache Spamassasin Open Mail Corpora"),
    
    Mail(
        id: 7, 
        subject: "SAVE YOUR STUFF! Sign in to your Nokia account before it disappears forever!",
        from: "Nokia <info@nok1a.com>", 
        to: "🦸🏻‍♂️ Naman Bishnoi", 
        body: "SAVE YOUR STUFF!\nWe noticed you haven't used Nokia account to access Nokia services in quite a while. To protect your privacy, this account will be deleted in 14 days, so sign in now.\n If you haven't experienced Nokia services recently, they're worth another look. And you may want to keep any maps, locations, email, music, reviews, or other stuff that is associated with your account.\n\nIt just takes few seconds to sign in to your Nokia account.\n\nWe hope to see you soon.\n\n Sincerely,\n The Nokia account team", 
        isSpam: true, 
        description: "Although very convincing, the real Nokia wouldn't be sending you a 'Save your stuff' email from info@nok1a.com and moreover you can see how the email name <nok1a.com> differs from the real domain <nokia.com>"),
    
    Mail(
        id: 8, 
        subject: "Information",
        from: "Manager Sam Porter Bridges", 
        to: "🦸🏻‍♂️ Naman Bishnoi", 
        body: "<HTML><BODY> <DIV style='FONT: 10pt Arial'> <A href='http://gogogo.world'> Notification\nOur courier couldnt make the delivery of parcel to you at <B>20th August.</B>\n Be sure to print label and show it in the nearest post office. </DIV> </A> </BODY></HTML>", 
        isSpam: true, 
        description: "This whole email was a gigantic hyperlink, so if you clicked anywhere in the email, you would initiate the malicious attack."),
    
    Mail(
        id: 9, 
        subject: "Ready. Set. Code.", 
        from: "Apple Developer", 
        to: "🦸🏻‍♂️ Naman Bishnoi", 
        body: "👨🏻‍💻 On June 22, WWDC20 takes off. Get ready for the first global, all-online WWDC by downloading the Apple Developer app to stay notified on all the latest news, with updates for events and sessions. And there’s a lot more to come — starting with the first-ever Swift Student Challenge. <Learn More>", 
        isSpam: false, 
        description: "The reason you are using this application."),

    Mail(
        id: 10, 
        subject: "Special Order Delivery Problem", 
        from: "Go Package <go@11920lx.com>", 
        to: "🦸🏻‍♂️ Naman Bishnoi", 
        body: "Sir/Madam,\n\nYour order BBY-4983814314 has not been delivered because the specified address was not correct.\nPlease fill this form and send it back with your reply to this message.\n\n\nIf we do not receive your reply within a week we will pay your money back less 17 because your order was reserved for the time of Christmas holidays.", 
        isSpam: true, 
        description: "Legit companies know how to spell, In addition to the generic salutation, grammar gaffes are usually a good clue that something is wrong. 'Please fill this form…' And notice the ‘17’ reference in the middle of the sentence."),
    
    Mail(
        id: 11, 
        subject: "COVID-19 Everything you need to know", 
        from: "Wei Chang <weic@coronavirus.app>", 
        to: "🦸🏻‍♂️ Naman Bishnoi", 
        body: "How to protect your friends from nCov 2019 Coronavirus FAQ\n\nThere are more than 4,250,000 infected COVID-19 cases all around the world!\n\nCOVID-19 FAQ - uploaded with iCloud Drive.\n\nRegards,\n Wei Chang", 
        isSpam: true, 
        description: "COVID-19 Emails and ransomware is common during times like these. Its best to totally avoid them and check sender's domain name."),
    
    Mail(
        id: 12, 
        subject: "I ❤️ Tifa", 
        from: "🦸🏻‍♂️ Naman Bishnoi", 
        to: "Square Enix", 
        body: "AVALANCHE destroys a Shinra Mako reactor in Midgar; an attack on another reactor goes wrong, and Cloud falls into the city slums. There, he meets Aerith and protects her from Shinra.\nMeanwhile, Shinra finds AVALANCHE and collapses part of the upper city, killing most of AVALANCHE along with the slum population below.\nAerith is also captured; as a Cetra, she can potentially reveal the 'Promised Land', which Shinra believes is overflowing with exploitable Lifestream energy.\nCloud, Barret, and Tifa rescue Aerith; during their escape from Midgar, they discover that President Shinra was murdered by Sephiroth, who was presumed dead five years earlier.\nThe party pursues Sephiroth across the Planet, with now-President Rufus on their trail.", 
        isSpam: false, 
        description: "Mail data is freely available at Apache Spamassasin Open Mail Corpora"),
    
    Mail(
        id: 13, 
        subject: "Scheduled Home Delivery Problem", 
        from: "Costco Shipping Agent <manager@cbcbuilding.com", 
        to: "🦸🏻‍♂️ Naman Bishnoi", 
        body: "Costco®\nUnfortunately the delivery of your order COS-0077945599 was cancelled since the specified address of the recepient was not correct. You are recommended to complete this form and send it back with your reply to us.\nPlease do this within the period of one week - if we don't get your timely reply you will be paid your money back less 21% since your order was booked from Chrismas. ", 
        isSpam: true, 
        description: "Legit companies have domain emails, "),
    
    Mail(
        id: 14, 
        subject: "Shared Document Phishing Attacks", 
        from: "🦸🏻‍♂️ Naman Bishnoi", 
        to: "👨‍⚖️ WWDC 2020 Judges 👩‍⚖️", 
        body: "You may receive an e-mail that appears to come from file-sharing sites like Dropbox or Google Drive alerting you that a document has been shared with you. The link provided in these e-mails will take you to a fake login page that mimics the real login page and will steal your account credentials.", 
        isSpam: false, 
        description: "Things to remember\n\n▫️ Be especially cautious when opening attachments or clicking links if you receive an email containing a warning banner indicating that it originated from an external source.\n▫️ Inspect URLs carefully to make sure they’re legitimate and not imposter sites."),
    
    Mail(
        id: 15, 
        subject: "Whaling Phishing Attacks", 
        from: "🦸🏻‍♂️ Naman Bishnoi", 
        to: "👨‍⚖️ WWDC 2020 Judges 👩‍⚖️", 
        body: "Whaling is a popular ploy aimed at getting you to transfer money or send sensitive information to an attacker via email by impersonating a real company executive. Using a fake domain that appears similar to ours, they look like normal emails from a high-level official of the company, typically the CEO or CFO, and ask you for sensitive information (including usernames and passwords).", 
        isSpam: false, 
        description: "Things to remember\n\n▫️ Do not provide sensitive personal information (like usernames and passwords) over email.\n▫️ Watch for email senders that use suspicious or misleading domain names."),
    
    Mail(
        id: 16, 
        subject: "Confirmation of your request from Hotels.com", 
        from: "Hotels.com <Hotelscom@roktpowered.com>", 
        to: "🦸🏻‍♂️ Naman Bishnoi", 
        body: "Coupon code $50 off, when you spend $350 or more. You must click through this email or book through our app to redeem this coupon. Bookings using this coupon are not eligible for Hotels.com™ Rewards. How to reedem your coupon:\n1. Click this email or open our app (this will activate your coupon)\n2. Search from thousand of hotels worldwide.\n3. Book using your unique coupon code.(Enter code on the booking form).\n\nTerms and Conditions\nThis offer is for email subscribers. It's only valid when you click through from your Hotels.com coupon email. Access your Hotels.com coupon email from your email inbox and click through to our website. Apply your discount before you book.\nUse this coupon to get $50 off the price of your booking at a participating Best Price Guarantee hotel when you stay between 1 and 28 nights and you spend a minimum of $350 for your entire stay.", 
        isSpam: true, 
        description: "Legit companies usually call you by your name, This is a very convincing email.\nFor me, the clue was in the email's domain name. Always Inspect URLs carefully to make sure they’re legitimate and not imposter sites."),
    
    Mail(
        id: 17, 
        subject: "Spear Phishing Attacks", 
        from: "🦸🏻‍♂️ Naman Bishnoi", 
        to: "👨‍⚖️ WWDC 2020 Judges 👩‍⚖️", 
        body: "Spear phishing is a more sophisticated phishing attack that includes customized information that makes the attacker seem like a legitimate source. They may use your name and phone number and refer to your company in the e-mail to trick you into thinking they have a connection to you, making you more likely to click a link or attachment that they provide.", 
        isSpam: false, 
        description: "'Phishing' is the most common type of cyber attack that affects organizations like ours. Phishing attacks can take many forms, but they all share a common goal – getting you to share sensitive information such as login credentials, credit card information, or bank account details."),
    
    Mail(
        id: 18, 
        subject: "Always Think Before You Click", 
        from: "🦸🏻‍♂️ Naman Bishnoi", 
        to: "👨‍⚖️ WWDC 2020 Judges 👩‍⚖️", 
        body: "The most common way Ransomware 🏴‍☠️ enters corporate networks is through email. Often, scammers will include malicious links or attachments in emails that look harmless. To avoid this trap, please observe the following email best practices:\n▪️ Do not click on links or attachments from unrecognizable senders. Be especially wary of .zip or other compressed or executable file types.\n▪️ Do not provide sensitive personal information (like usernames and passwords) over email.\n▪️ Watch for email senders that use suspicious or misleading domain names.\n▪️ If you can’t tell if an email is legitimate or not, please refer to your company's protocol.", 
        isSpam: false, 
        description: "Be especially cautious when opening attachments or clicking links if you receive an email containing a warning banner indicating that it originated from an external source.\n\nIf your computer is infected with ransomware, you will typically be locked out of all programs and a “ransom screen” will appear. In the unfortunate event that you click a link or attachment that you suspect is malware or ransomware, please notify IT immediately."),
    
    Mail(
        id: 19, 
        subject: "Restore your account", 
        from: "PayTrans <VT@paytrans.com>", 
        to: "🦸🏻‍♂️ Naman Bishnoi", 
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
        to: "🦸🏻‍♂️ Naman Bishnoi", 
        body: "hello ar you satisfi with your isp do you have number email address for you and your famili do you have number mb of person webspac how truli unlimit is your access time our internet servic provid you with all of that at a low monthli fee of just dollarnumb number you get number email address numbermb of person webspac and number hour of access time per month virtual unlimit that is more than most peopl will us do the math we have local number for mani area for further inform pleas email me at emailaddr and place request inform in the subject line if you do not wish ani more mail pleas send a blank email to emailaddr regard steve murphi numberjrzsnumb numberrrsrnumberrvqgnumb numbersctlnumberoiejnumb numbergrtznumberlnumb httpaddr", 
        isSpam: true,
        description:  "This is a filtered form of data I have performed in the same project written in Go. See at https://github.com/diabloxenon/spamaway"),
    
    Mail(
        id: 1, 
        subject: "Ending of Final Fantasy VII Remake", 
        from: "🦸🏻‍♂️ Naman Bishnoi", 
        to: "Jimmy Beans", 
        body: "Shinra fails to destroy Meteor but manages to defeat a Weapon and puncture the Northern Crater, costing the lives of Rufus and other personnel. After killing Hojo, who is revealed to be Sephiroth's biological father, the party descends to the Planet's core through the opening in the Northern Crater and defeats both Jenova and Sephiroth. The party escapes and Holy is summoned, which destroys Meteor with the help of the Lifestream.Five hundred years later, Red XIII is seen with two cubs looking out over the ruins of Midgar, which are now covered in greenery, showing the planet has healed.", 
        isSpam: false, 
        description:  "Full story will be revealed in Final Fantasy Remake, stay tuned 😉"),
    
    Mail(
        id: 2, 
        subject: "Spam Test", 
        from: "Spamgod", 
        to: "🦸🏻‍♂️ Naman Bishnoi", 
        body: "digit publish tool free softwar alert publish like a profession with digit publish tool easili creat profession ebook ebrochur ecatalog resum newslett present magazin photo album invit much much more save monei save tree save on print postag and advertis cost digit publish tool download new free version now limit time offer choos from these displai style numberd page turn slide show sweep wipe emb hyperlink and link to anywher onlin such as your websit order page or contact form distribut via floppi cd rom e mail or onlin take your market to the next level for more info sampl or a free download click the appropri link to the right nbsp server demand is extrem high for thi limit time free softwar offer nbsp pleas try these link period if a site seem slow or unreach websit number websit number websit number if you wish to be remov from our mail list pleas cick the unsubscrib button nbsp copyright number affili id number free version is fulli function with no expir and ha a number page number page spread limit", 
        isSpam: true, 
        description:  "This is a filtered form of data I have performed in the same project written in Go. See at https://github.com/diabloxenon/spamaway"),
    
    Mail(
        id: 3, 
        subject: "Another Spam Test", 
        from: "Jolly Rogers", 
        to: "🦸🏻‍♂️ Naman Bishnoi", 
        body: "reduc your debt in number minut you ar receiv thi email as a subscrib to the dealsuw mail list to remov yourself from thi and relat email list click here unsubscrib my email under bill s number titl iii by the number us congress per section number paragraph a number of s number a letter cannot be consideyellow spam if the sender includ contact inform and a method of quot remov quot", 
        isSpam: true, 
        description:  "This is a filtered form of data I have performed in the same project written in Go. See at https://github.com/diabloxenon/spamaway"),
    
    Mail(
        id: 4, 
        subject: "Re: Goodbye Global Warming", 
        from: "Jim Whitehead <ejw@cse.ucsc.edu>", 
        to: "James Rogers <jamesr@best.com>", 
        body: "There has been a significant recent increase in global CO2 concentration. The vast preponderance of the new CO2 in the atmosphere is due to human activity starting around the industrialization of Europe, and accelerating after WWII. Most scientists studying global climate change believe that these increased CO2 concentration are the primary causal agent for increased global warming. Hence our interest in items of human time scale.", 
        isSpam: false, 
        description:  "Mail data is freely available at Apache Spamassasin Open Mail Corpora"),
    
    Mail(
        id: 5, 
        subject: "Re: Recommended Viewing", 
        from: "Gary Lawrence Murphy <garym@canada.com>", 
        to: "Geege Schuman <geege@barrera.org>", 
        body: "Spam is also a medium for fraudsters to scam users into entering personal information on fake Web sites using emails forged to look like they are from banks or other organizations, such as PayPal. This is known as phishing. Targeted phishing, where known information about the recipient is used to create forged emails, is known as spear-phishing.", 
        isSpam: false, 
        description:  "Mail data is freely available at Apache Spamassasin Open Mail Corpora"),
    
    Mail(
        id: 6, 
        subject: "Buy TODAY!!", 
        from: "Spamgod", 
        to: "🦸🏻‍♂️ Naman Bishnoi", 
        body: "dear homeown nbsp number number number yr fix rate mortgag interest rate ar at their lowest point in number year we help you find the best rate for your situat by match your need with hundr of lender home improv refin second mortgag home equiti loan and more even with less than perfect credit click here for a free quot lock in your low fix rate todai a no cost out of pocket a no oblig a free consult a all credit grade accept rate as low as number number won t stai thi low forev click here nbsp base on mortgag rate as of number number number as low as number number see lender for detail nbsp h appli now and on of our lend partner will get back to you within number hour click here to be remov pleas quot click here quot", 
        isSpam: true, 
        description:  "Mail data is freely available at Apache Spamassasin Open Mail Corpora"),
    
    Mail(
        id: 7, 
        subject: "Coronavirus Update - China Operations", 
        from: "John DeFranco <johnd@coronavirusupdate.tk>", 
        to: "🦸🏻‍♂️ Naman Bishnoi", 
        body: "Unfortunately, the New Year has been dominated by the 2019 nCov Coronavirus outbreak.\n\nWuhan is identified as center of COVID-19 outbreak and remain under quarantine as the government continues with containment efforts.\n\nRegards,\nJohn DeFranco", 
        isSpam: true, 
        description:  "Excerpt of a real email from my Inbox"),
    
    Mail(
        id: 8, 
        subject: "Final Fantasy VII Plot", 
        from: "Owen Byrne <owen@permafrost.net>", 
        to: "Geege <grlygrl201@aol.com>", 
        body: "The group begins to encounter Sephiroth during their journey, who continuously appears and disappears after taunting Cloud and sending Jenova-esque monsters after him.\nFinding him at a Cetra temple, Sephiroth reveals his intentions to use the Black Materia to summon 'Meteor', a spell that will hit the Planet with a devastating impact.\nSephiroth will absorb the Lifestream as it attempts to heal the wound, becoming a god-like being. The party retrieves the Black Materia, but Sephiroth manipulates Cloud into surrendering it.\nAerith departs alone to stop Sephiroth, following him to an abandoned Cetra city.\nDuring Aerith's prayer to the Planet for help, Sephiroth attempts to force Cloud to kill her; failing, he kills her himself before fleeing and leaving the Black Materia behind.\nThe party then learns that Jenova is not a Cetra as once thought. Rather, it is a hostile alien lifeform whose remains were unearthed by Shinra scientists decades earlier; at Nibelheim, Jenova's cells were used to create Sephiroth.", 
        isSpam: false, 
        description:  "Mail data is freely available at Apache Spamassasin Open Mail Corpora"),
    
    Mail(
        id: 9, 
        subject: "Congratulations on Your 6 New Signups", 
        from: "csgo@eslgaming.com", 
        to: "Jason Ling <vytekdemise@hotmail.com>", 
        body: "<HTML><BODY> We guarantee you signups before you ever pay a penny! We will show you the green before you ever take out your wallet. Sign up for FREE and test drive our system. No Obligation whatsoever. No Time Limit on the test drive. Our system is so powerful that the system enrolled over 400 people into my downline the first week.\n\nTo get signed up for FREE and take a test drive use the link: mailto:workinathome@btamail.net.cn?subject=more_MOSS3_info_please Be sure to request info if the subject line does not! \n\nThe national attention drawn by this program will drive this program with incredible momentum! Don't wait, if you wait, the next 400 people will be above you. </BODY></HTML>", 
        isSpam: true, 
        description:  "Mail data is freely available at Apache Spamassasin Open Mail Corpora"),
    
    Mail(
        id: 10, 
        subject: "[ILUG] What HOWTOs for SOHO system", 
        from: "Dermot Daly", 
        to: "Linux Community", 
        body: "Hi All, I'm trying to set up the following:\n1️⃣ A Linux server running with a modem for internet connectivity and an ethernet card for LAN connectivity\n2️⃣ Other LAN pcs with ethernet cards, using the Linux server for DNS/DHCP etc.\n\n Basically, I want to route any non LAN traffic through the ppp0. I've got some of the way, but like a similar post earlier about modem problems, when I am connected to the internet with eht0 up, the routing is all incorrect and noting goes out through ppp0 (eh0 must be the default route or something).\n Is there standard out of the box Linux tools that will carry out portmapping on behalf of the LAN PCs? (I'm planning on non routable addresses 192.168.x.x for the LAN, routed outwards via the ppp0 interface). Can someone point me at the right HOWTOs or routing documentation I need to follow? Thanks,Dermot.", 
        isSpam: false, 
        description:  "Mail data is freely available at Apache Spamassasin Open Mail Corpora"),
]
