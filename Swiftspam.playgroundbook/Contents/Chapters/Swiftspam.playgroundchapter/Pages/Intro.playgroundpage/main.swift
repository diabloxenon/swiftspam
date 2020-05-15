//#-hidden-code
//
//  main.swift
//  
//  Copyright © 2020 Naman Bishnoi. Licensed under MIT.
//
//  Copyright © 2016-2019 Apple Inc. All rights reserved.
//
//#-end-hidden-code
//#-code-completion(module, hide, Swift)
//#-code-completion(identifier, hide, AbstractDrawable, _ColorLiteralType, _setup())
//#-hidden-code
_setup()
_start(trainingData, testData)
//#-end-hidden-code
/*:
 # Suspicious or Familiar 🤔
 
 Every crisis brings an opportunity. For developers, it is our skills and effort to create one, for hackers it is their malicious intent. With COVID-19, the world is seeing a revolution in their workplaces where at center of it are our mailboxes.
 
 This playground gives you a unique freedom to explore how you can identify one of the most threatening cyber attack that no antivirus can save you from. Yes I am talking about SPAM!
 
 Hi, I am Naman Bishnoi and in this year's WWDC I will discuss about one of the major cyber threats that take down biggest of the big organizations, SPAM. SPAM stands for **SusPicious Annoying Mails** (or that's what I think of atleast) and good ones are FAM (**FAmiliar Mails**) which we need to look for. 
 
 We will explore how you can identify a SPAM email from FAM. First few emails will be selected manually by you just for the sake of training our machine learning model (in this case it's Naive Bayes). After that, it will use that trained model to automatically classify the remaining emails.
 
 ## How to Use?
 
 Keeping things simple, I have designed this playground to effortlessly segregate your emails. To classify the emails, just simply:
 - **Swipe left** for `Spam 👻`
 - **Swipe right** for `Fam 👍🏻`

 * Callout(Tip):
 You can always use hint to check if its spam or not by clicking on `Learn More ℹ️` at bottom of card.

 ## Features
 * TF-IDF weights with Naive Bayes modelling used which is considered to be as fast as SVM.
 * This model also helps alleviate problems stemming from the curse of dimensionality.
 * The legitimate e-mails a user receives will tend to be different. For example, in a corporate environment, the company name and the names of clients or customers will be mentioned often. The filter will assign a lower spam probability to emails containing those names.

 

 - note:
 If you see testing mails with `⚠️ False ➕` or `⚠️ False ➖` symbols, that means somehow you have classified wrong mails in training phase. Please, train the emails carefully.
 
 

 Although, I don't expect a completely spam free mailbox due to algorithmic inefficiencies but it gets rid of most unnecessary stuff. This open-source project gives you full right to do whatever you want with your data.

 You can check the source code of this project repository at [Github](https://github.com/diabloxenon/swiftspam)

 

 [Credits ➤](@next)
 */