//#-hidden-code
//
//  main.swift
//  
//  Copyright © 2016-2019 Apple Inc. All rights reserved.
//
//#-end-hidden-code
//#-code-completion(module, hide, Swift)
//#-code-completion(identifier, hide, AbstractDrawable, _ColorLiteralType, _setup())
//#-hidden-code
_setup()
// _start()

//#-end-hidden-code
//#-editable-code Tap to enter code
import SwiftUI

import PlaygroundSupport

//Constants
// Swift Playgrounds
//let cardHeight:CGFloat = 1000
//let headingSize:CGFloat = 64
//let contentSize:CGFloat = 24

var famBoy = Fam()
var spamBoy = Spam()

var model:Classifier = Classifier(newModel: MultinomialTf)

// Playgrounds
let iconSize: CGFloat = 128
let headingSize: CGFloat = 64
let contentSize: CGFloat = 24

// Common Constants
let factor:CGFloat = 0.75

let textColor = Color(.sRGB, white: 0, opacity: 0.8)

let spamEmoji:String = "👻"
let famEmoji:String = "👍🏻"

enum SpamFam: Int {
    case spam, fam, none
}

enum Status: Int {
    case start, trainingDone, testingDone
}

public struct ContentView: View {
    
    @State public var mails: [Mail]
    @State public var testMails: [Mail]
    @State private var mail: Mail = Mail()
    
    @State private var title: String = "📨 Swiftspam"
    @State private var stats: Status = .start
    @State private var testResult: Results = .None
    
    @State private var frame: CGSize = .zero // Contains Geometrical dims of current view.
    @State private var cardDim: CGSize = .zero
    func setDims(_ geometry: GeometryProxy) -> some View{
        DispatchQueue.main.async {
            self.frame = geometry.size
            self.cardDim.height = geometry.size.height * factor
            self.cardDim.width = geometry.size.height * factor * 0.6 //Aspect ratio
        }
        return EmptyView()
    }
    
    private var mailsMaxID: Int {
        return self.mails.map { $0.id }.max() ?? 0
    }
    
    private var testMailsMaxID: Int {
        return self.testMails.map { $0.id }.max() ?? 0
    }
    
    private func getCardOffset(mails: [Mail], id: Int) -> CGFloat {
        return  CGFloat(mails.count - 1 - id) * 10
    }
    
    func trainingEmails(_ mx: Mail) -> some View{
        DispatchQueue.main.async{
//        self.title = "\(self.mails.count) more to go"
//        print(self.title)
        if self.mails.count == 1 {
//            print("BP 1 familiar mails: \(famBoy) spam mails: \(spamBoy)")
            model = train(fam: famBoy, spam: spamBoy)
            self.title = "Training Done"
            print(self.title)
            self.stats = .trainingDone
        }
        }
        return Group {
            // Range Operator
            if (self.mailsMaxID - 3)...self.mailsMaxID ~= mx.id {
                CardView(size: self.cardDim, mail: mx, mails: self.$mails, dim: self.frame, stats: self.stats)
                    .offset(x: 0, y: self.getCardOffset(mails: self.mails, id: mx.id))
                .animation(.spring())
            }
        }
    }
    
    func testEmails(_ mx: Mail) -> some View{
        DispatchQueue.main.async{
//            self.title = "🧪 Testing"
            self.testResult = test(mail: mx, classifier: model)
            if self.testResult == .FamSpam {
                self.title = "⚠️ False ➕"
            }
            if self.testResult == .SpamFam {
                self.title = "⚠️ False ➖"
            }
            if self.testResult == .SpamSpam {
                self.title = "\(spamEmoji) Spam"
            }
            if self.testResult == .FamFam {
                self.title = "\(famEmoji) Fam"
            }
            if self.testMails.count == 0 {
                self.stats = .testingDone
            }
            print(self.title)
        }
        return Group {
            // Range Operator
            if (self.testMailsMaxID - 3)...self.testMailsMaxID ~= mx.id {
                CardView(size: self.cardDim, mail: mx, mails: self.$testMails, dim: self.frame, stats: self.stats)
                    .offset(x: 0, y: self.getCardOffset(mails: self.testMails, id: mx.id))
                .animation(.spring())
            }
        }
    }
    
    func congrats() -> some View {
        return VStack{
            HStack{
                Text("🎉").font(.custom("HelveticaNeue-ThinItalic", size: 64))
                Spacer()
                Text("🎊").font(.custom("HelveticaNeue-ThinItalic", size: 64))
                Spacer()
                Text("🎉").font(.custom("HelveticaNeue-ThinItalic", size: 64)).rotation3DEffect(.degrees(180), axis: (x: 0, y: 1, z: 0))
            }.padding(.all)
                Text("🏆").font(.custom("HelveticaNeue-ThinItalic", size: 64))
        }
    }
    
    public var body: some View {
        GeometryReader { geometry in
        ZStack {
            self.setDims(geometry)
            LinearGradient(gradient: Gradient(colors: [Color.swiftspamBG1, Color.swiftspamBG2]), startPoint: UnitPoint(x: 1, y: 1), endPoint: UnitPoint(x: 0, y: 0))
                .edgesIgnoringSafeArea(.all)

            VStack{
            //Header
                Text(self.title)
                .font(.custom("HelveticaNeue-Thin", size: headingSize))
                .foregroundColor(.black)
                .padding(.vertical)
                
                ZStack{
                    // Training Emails
                    if self.stats == .start{
                        ForEach(self.mails, id: \.self) { mail in
                            self.trainingEmails(mail)
                        }
                    }
                    
                    if self.stats == .trainingDone {
                        ForEach(self.testMails, id: \.self) { mail in
                            self.testEmails(mail)
                        }
                    }
                    
                    if self.stats == .testingDone {
                        self.congrats()
                    }
                }

                Spacer()
            }
        }
    }
    }
}

struct CardView: View {
    // States
    var size: CGSize
    var mail: Mail
    @Binding var mails: [Mail]
    @State private var spamOrHam: SpamFam = .none
    var dim: CGSize
    var stats: Status
    
    @State private var offset: CGSize = .zero
    @State private var toggleInfo = false
    
    @GestureState var isSelected = false
    
    var swipe: some Gesture{
            LongPressGesture()
                .updating($isSelected) { value, state, _ in
                        state = value
                    }.simultaneously(with: DragGesture()
                        .onChanged {
                            self.offset = $0.translation
                            
                        if self.stats == .start {
                            if $0.translation.width / self.dim.width >= 0.35{
    //                            print("RIGHT")
                                self.spamOrHam = .fam
                            } else if $0.translation.width / self.dim.width <= -0.35{
    //                            print("LEFT")
                                self.spamOrHam = .spam
                            } else {
    //                            print("NONE")
                                self.spamOrHam = .none
                            }
                        } else if self.stats == .trainingDone {
                            // TODO: Remove the self.mail.isSpam and link it with actual predictions.
                            if self.mail.isSpam{
                                self.spamOrHam = .spam
                                self.offset.width = self.dim.width * -0.35
                            } else {
                                self.spamOrHam = .fam
                                self.offset.width = self.dim.width * 0.35
                            }
                        }

                        }
                        .onEnded { v in withAnimation {
                            if abs(v.translation.width/self.dim.width) > 0.35{
                                // Add mail data to the list
                                if self.spamOrHam == .fam && self.stats == .start {
                                    addFam(fam: &famBoy, mail: self.mail)
                                } else if self.spamOrHam == .spam && self.stats == .start {
                                    addSpam(spam: &spamBoy, mail: self.mail)
                                }
                                self.mails.removeAll { $0.id == self.mail.id}
    //                            if let index = self.mails.firstIndex(of: self.mail) {
    //                                self.mails.remove(at: index)
    //                            }
                            } else{
                                self.offset = .zero
                                self.spamOrHam = .none
                            }
                        }
                    }
            )
    }
    
    var body: some View {
        ZStack{

            mailView
            if self.toggleInfo {
                infoView
            }
            
            if self.spamOrHam == .fam{
                // IT IS A FAMILIAR MAIL
                famOverlay
            } else if self.spamOrHam == .spam{
                // BEGONE SPAMMER!
                spamOverlay

            }
        }.shadow(color: Color(.sRGB, white: 0, opacity: 0.10), radius: 7, x: 5, y: 5)
            .scaleEffect(self.isSelected ? 1.05 : 1)
        .opacity(self.isSelected ? 0.9 : 1)
        .offset(x: self.offset.width, y: self.offset.height)
        .rotationEffect(.degrees(Double(self.offset.width / dim.width) * 25), anchor: .bottom)
        .gesture(self.swipe)
        .animation(.interactiveSpring())
    }
    
    private var mailView: some View{
                    VStack(alignment: .leading) {
                    // Subject Line
                    mailObjects("Subject", self.mail.subject)

                    // From
                    mailObjects("From", self.mail.from)

                    // To
                    mailObjects("To", self.mail.to)

                    // HStack {
                    //     // Body
                    //     Text(self.mail.body)
                    //         .font(.custom("HelveticaNeue-Light", size: contentSize))
                    //         .foregroundColor(textColor)
                    //         .padding(.top)
                    //     Spacer()
                    // }
                    mailObjects("Body", self.mail.body)
                    Spacer()
                
                infoButton("Learn More")
                
            }.padding(self.size.height/20).padding(.top)
                .frame(width: self.size.width, height: self.size.height)
                .animation(.interactiveSpring())
                .background(LinearGradient(gradient: Gradient(colors: [Color.swiftspamCardBG1, Color.swiftspamCardBG2]), startPoint: UnitPoint(x: 1, y: 1), endPoint: UnitPoint(x: 0, y: 0)).edgesIgnoringSafeArea(.all))
                .cornerRadius(25)
    }

    private var infoView: some View{
        VStack(alignment: .leading){
            Text(self.mail.isSpam ? "\(spamEmoji) Spam" : "\(famEmoji) Fam" )
                .font(.custom("HelveticaNeue-Thin", size: headingSize))
                .foregroundColor(Color.white)
                .padding(.all)
            HStack{
                Text(self.mail.description)
                    .font(.custom("HelveticaNeue-Light", size: contentSize))
                    .foregroundColor(Color.white)
                Spacer()
            }
            
            Spacer()
            infoButton("Read Mail")

        }.padding(self.size.height/20).padding(.top)
            .background(LinearGradient(gradient: Gradient(colors: [Color.swiftspamInfoBG1, Color.swiftspamInfoBG2]), startPoint: UnitPoint(x: 1, y: 1), endPoint: UnitPoint(x: 0, y: 0)).edgesIgnoringSafeArea(.all))
            .frame(width: self.size.width, height: self.size.height)
            .cornerRadius(25)
    }
    
    private var spamOverlay: some View{
        VStack{
            Spacer()
            HStack{
                Spacer()
                Text(spamEmoji)
                    .font(.custom("HelveticaNeue-Thin", size: iconSize))
                    .foregroundColor(Color.white)
                    .padding(.all)
                // Spacer()
            }
            // Spacer()
        }.background(Color.red)
            .frame(width: self.size.width, height: self.size.height)
            .cornerRadius(25)
            .opacity(0.65)
    }
    
    private var famOverlay: some View{
        VStack{
            Spacer()
            HStack{
                // Spacer()
                Text(famEmoji)
                    .font(.custom("HelveticaNeue-Thin", size: iconSize))
                    .foregroundColor(Color.white)
                    .padding(.all)
                Spacer()
            }
            // Spacer()
        }.background(Color.green)
            .frame(width: self.size.width, height: self.size.height)
            .cornerRadius(25)
            .opacity(0.65)
    }

    private func infoButton(_ desc: String) -> some View{
        return Button(action : {
                self.toggleInfo = !self.toggleInfo
            }){
                Text(desc) // Button Text
                    .font(.custom("HelveticaNeue", size: contentSize))
                    .foregroundColor(Color.blue)
            }
    }

    private func mailObjects(_ desc: String, _ mailData: String) -> some View{
            return  HStack(alignment: .top, spacing: 5){
                Text("\(desc): ")
                    .font(.custom("HelveticaNeue-Bold", size: contentSize))
                    .foregroundColor(textColor)

                Text(mailData)
                    .font(.custom("HelveticaNeue-Light", size: contentSize))
                    .foregroundColor(textColor)
                Spacer()
            }
    }
}

public var hosting = UIHostingController(rootView: ContentView(mails: trainingData, testMails: testData))


PlaygroundPage.current.setLiveView(hosting)


//#-end-editable-code