import SwiftUI

//Constants
// Swift Playgrounds
//let cardHeight:CGFloat = 1000
//let headingSize:CGFloat = 64
//let contentSize:CGFloat = 24

var famBoy = Fam()
var spamBoy = Spam()

var model:Classifier = Classifier(newModel: MultinomialTf)

// Playgrounds
// let cardHeight: CGFloat = 500
let headingSize: CGFloat = 32
let contentSize: CGFloat = 16

// Common Constants
let factor:CGFloat = 0.75

let textColor = Color(.sRGB, white: 0, opacity: 1)

enum SpamFam: Int {
    case spam, fam, none
}

public struct ContentView: View {
    
    @State public var mails: [Mail]
    @State public var testMails: [Mail]
    @State private var mail: Mail = Mail()
    
    @State private var title: String = "📬 Swiftspam"
    @State private var stats: Status = .start
    @State private var testResult: Results = .None
    
    enum Status: Int {
        case start, trainingDone, testingDone
    }
    
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
                CardView(size: self.cardDim, mail: mx, mails: self.$mails, dim: self.frame)
                    .offset(x: 0, y: self.getCardOffset(mails: self.mails, id: mx.id))
                .animation(.spring())
            }
        }
    }
    
    func testEmails(_ mx: Mail) -> some View{
        DispatchQueue.main.async{
            self.title = "🧪 Testing"
            print(self.title)
            self.testResult = test(mail: mx, classifier: model)
            if self.testResult == .FamSpam {
                self.title = "Anomaly FP"
            }
            if self.testResult == .SpamFam {
                self.title = "Anomaly FN"
            }
            if self.testResult == .SpamSpam {
                self.title = "SPAM!"
            }
            if self.testResult == .FamFam {
                self.title = "Fam!"
            }
            if self.testMails.count == 1{
                self.stats = .testingDone
            }
        }
        return Group {
            // Range Operator
            if (self.testMailsMaxID - 3)...self.testMailsMaxID ~= mx.id {
                CardView(size: self.cardDim, mail: mx, mails: self.$testMails, dim: self.frame)
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
            LinearGradient(gradient: Gradient(colors: [Color(.sRGB, red: (203/255.0), green: (203/255.0), blue: (160/255.0), opacity: 1.0), Color(.sRGB, red: (181/255.0), green: (181/255.0), blue: (73/255.0), opacity: 1.0)]), startPoint: UnitPoint(x: 1, y: 1), endPoint: UnitPoint(x: 0, y: 0))
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
//                        ZStack{
                        ForEach(self.mails, id: \.self) { mail in
                            self.trainingEmails(mail)
                        }
//                        }
                    }
                    
                    if self.stats == .trainingDone {
//                        ZStack{
                        ForEach(self.testMails, id: \.self) { mail in
                            self.testEmails(mail)
                        }
//                        }
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
//    @Binding var mail: Mail
    var mail: Mail
    @Binding var mails: [Mail]
    @State private var spamOrHam: SpamFam = .none
    var dim: CGSize
    
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
                        }
                        .onEnded { v in withAnimation {
                            if abs(v.translation.width/self.dim.width) > 0.35{
                                
                                // Add mail data to the list
                                if self.spamOrHam == .fam {
                                    addFam(fam: &famBoy, mail: self.mail)
//                                    print(famBoy)
                                } else if self.spamOrHam == .spam {
                                    addSpam(spam: &spamBoy, mail: self.mail)
//                                    print(spamBoy)
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
            VStack(alignment: .leading) {
                    // Subject Line
                    HStack(alignment: .top, spacing: 5){
                        Text("Subject: ")
                            .font(.custom("HelveticaNeue-Bold", size: contentSize))
                            .foregroundColor(textColor)

                        Text(self.mail.subject)
                            .font(.custom("HelveticaNeue-Light", size: contentSize))
                            .foregroundColor(textColor)
                    }

                    // From
                    HStack {
                        Text("From: ")
                            .font(.custom("HelveticaNeue-Bold", size: contentSize))
                            .foregroundColor(textColor)

                        Text(self.mail.from)
                            .font(.custom("HelveticaNeue-Light", size: contentSize))
                            .foregroundColor(textColor)
                    }

                    // To
                    HStack {
                        Text("To: ")
                            .font(.custom("HelveticaNeue-Bold", size: contentSize))
                            .foregroundColor(textColor)

                        Text(self.mail.to)
                            .font(.custom("HelveticaNeue-Light", size: contentSize))
                            .foregroundColor(textColor)
                    }

                    HStack {
                        // Body
                        Text(self.mail.body)
                            .font(.custom("HelveticaNeue-Light", size: contentSize))
                            .foregroundColor(textColor)
                            .padding(.top)
                        Spacer()
                    }
                    Spacer()
            }.padding(self.size.height/20).padding(.top)
                .frame(width: self.size.width, height: self.size.height)
                .animation(.interactiveSpring())
                .background(Color.white)
                .cornerRadius(25)
            
            if self.toggleInfo {
                VStack{
                    HStack{
                        Text(self.mail.description)
                            .font(.custom("HelveticaNeue-Light", size: contentSize))
                            .foregroundColor(Color.white)
                            .padding(.top)
                            Spacer()
                    }.padding(.all)
                    Spacer()
                }.background(Color.black)
                .frame(width: self.size.width, height: self.size.height)
                .cornerRadius(25)
            }
            
            if self.spamOrHam == .fam{
                // IT IS A MAIL FROM SPAM
                RoundedRectangle(cornerRadius: 25, style: .continuous)
                    .fill(Color.yellow)
                    .frame(width: self.size.width, height: self.size.height)
                    .opacity(0.6)
            } else if self.spamOrHam == .spam{
                // BEGONE SPAMMER!
                RoundedRectangle(cornerRadius: 25, style: .continuous)
                    .fill(Color.red)
                    .frame(width: self.size.width, height: self.size.height)
                    .opacity(0.6)
            }
        }.shadow(color: Color(.sRGB, white: 0, opacity: 0.10), radius: 7, x: 5, y: 5)
        .scaleEffect(self.isSelected ? 1.1 : 1)
        .opacity(self.isSelected ? 0.9 : 1)
        .offset(x: self.offset.width, y: self.offset.height)
        .rotationEffect(.degrees(Double(self.offset.width / dim.width) * 25), anchor: .bottom)
        .gesture(self.swipe)
        .animation(.interactiveSpring())
    }
}

public var hosting = UIHostingController(rootView: ContentView(mails: trainingData, testMails: testData))
