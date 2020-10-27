# Swiftspam

The open-source spam classification project purely written in Swift.

**Winner of the Apple WWDC 2020 Swift student challenge and now integrated into iOS 14, iPadOS 14 and macOS 11.0 Big Sur.**

Every crisis brings an opportunity. For developers, it is our skills and effort to create one, for hackers it is their malicious intent. With COVID-19, the world is seeing a revolution in their workplaces where at center of it are our mailboxes.

This playground gives you a unique freedom to explore how you can identify one of the most threatening cyber attack that no antivirus can save you from. Yes I am talking about SPAM!

Hi, I am Naman Bishnoi and in this year's WWDC I will discuss about one of the major cyber threats that take down biggest of the big organizations, SPAM. SPAM stands for **SusPicious Annoying Mails** (or that's what I think of atleast) and good ones are FAM (**FAmiliar Mails**) which we need to look for.

We will explore how you can identify a SPAM email from FAM. First few emails will be selected manually by you just for the sake of training our machine learning model (in this case it's Naive Bayes). After that, it will use that trained model to automatically classify the remaining emails.

## How to Use

Keeping things simple, I have designed this playground to effortlessly segregate your emails. To classify the emails, just simply:

- **Swipe left** for `Spam 👻`
- **Swipe right** for `Fam 👍🏻`
- **After 💪 Training**, Hold down the `📧mail card` to automatically classify it.

You can always use hint to check if its spam or not by clicking on `Learn More ℹ️` at bottom of card.

## Features

- TF-IDF weights with Naive Bayes modelling used which is considered to be as fast as SVM.
- This model also helps alleviate problems stemming from the curse of dimensionality.
- The legitimate e-mails a user receives will tend to be different. For example, in a corporate environment, the company name and the names of clients or customers will be mentioned often. The filter will assign a lower spam probability to emails containing those names.

## Note

If you see testing mails with `⚠️ False ➕` or `⚠️ False ➖` symbols, that means somehow you have classified wrong mails in training phase. Please, train the emails carefully.

Although, I don't expect a completely spam free mailbox due to algorithmic inefficiencies but it gets rid of most unnecessary stuff. This open-source project gives you full right to do whatever you want with your data.

## Similar Project

This project is based mostly on my another project [Spamaway](https://github.com/diabloxenon/spamaway). This one is written in Go.

## Resource Credits

- Apple for creating this awesome platform.
- [Wikipedia](https://en.wikipedia.org/wiki/Naive_Bayes_spam_filtering) for reference guide
- [Sebastian Raschka](https://sebastianraschka.com/Articles/2014_naive_bayes_1.html) for his awesome work on the topic
- [Spamassasin](http://spamassassin.apache.org/old/publiccorpus/) for their open source corpora dataset.
- [Securitymetrics](https://www.securitymetrics.com/blog/7-ways-recognize-phishing-email) for their awesome article on the same.
- [Scamnet](https://www.scamnet.wa.gov.au/scamnet/Scam_prevention-Email_scam_examples.htm#) for spam examples
- Thumbnail is freely available at [Freepik](https://www.freepik.com/free-photos-vectors/business) and redesigned by me.
