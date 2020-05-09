import SwiftUI

//Constants
// Swift Playgrounds
//let cardHeight:CGFloat = 1000
//let headingSize:CGFloat = 64
//let contentSize:CGFloat = 24

var famBoy = Fam()
var spamBoy = Spam()

var model:Classifier = Classifier(newModel: MultinomialTf)


var mxs = [
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
    @State private var mail: Mail = Mail()
    
    @State private var title: String = "📬 Swiftspam"
    
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
    
    func trainingEmails() -> some View{
        DispatchQueue.main.async{
//        self.title = "\(self.mails.count) more to go"
//        print(self.title)
        if self.mails.count == 0 {
            model = train(fam: famBoy, spam: spamBoy)
            self.title = "Training Done"
            print(self.title)
        }
        }
        return ZStack{
            Text("😄")
                .font(.custom("HelveticaNeue-ThinItalic", size: headingSize))
                .foregroundColor(.black)
            ForEach(self.mails, id: \.self) { mail in
                Group {
                    // Range Operator
                    if (self.maxID - 3)...self.maxID ~= mail.id {
                        CardView(size: self.cardDim, mail: mail, mails: self.$mails, dim: self.frame)
                            .offset(x: 0, y: self.getCardOffset(id: mail.id))
                        .animation(.spring())
                    }
                }
            }
        }
    }
        
    private var maxID: Int {
        return self.mails.map { $0.id }.max() ?? 0
    }
    
    private func getCardOffset(id: Int) -> CGFloat {
        return  CGFloat(self.mails.count - 1 - id) * 10
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
                
                // Training Emails
                self.trainingEmails()

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

                        Text("\(self.mail.subject)")
                            .font(.custom("HelveticaNeue-Light", size: contentSize))
                            .foregroundColor(textColor)
                    }

                    // From
                    HStack {
                        Text("From: ")
                            .font(.custom("HelveticaNeue-Bold", size: contentSize))
                            .foregroundColor(textColor)

                        Text("\(self.mail.from)")
                            .font(.custom("HelveticaNeue-Light", size: contentSize))
                            .foregroundColor(textColor)
                    }

                    // To
                    HStack {
                        Text("To: ")
                            .font(.custom("HelveticaNeue-Bold", size: contentSize))
                            .foregroundColor(textColor)

                        Text("\(self.mail.to)")
                            .font(.custom("HelveticaNeue-Light", size: contentSize))
                            .foregroundColor(textColor)
                    }

                    HStack {
                        // Body
                        Text("\(self.mail.body)")
                            .font(.custom("HelveticaNeue-Light", size: contentSize))
                            .foregroundColor(textColor)
                            .padding(.top)
                    }
            }.padding(self.size.height/20).padding(.top)
                .frame(width: self.size.width, height: self.size.height)
                .animation(.interactiveSpring())
                .background(Color.white)
                .cornerRadius(25)
            
            if self.spamOrHam == .fam{
                // IT IS A MAIL FROM SPAM
                RoundedRectangle(cornerRadius: 25, style: .continuous)
                    .fill(Color.yellow)
                    .frame(width: self.size.width, height: self.size.height)
                    .opacity(0.5)
            } else if self.spamOrHam == .spam{
                // BEGONE SPAMMER!
                RoundedRectangle(cornerRadius: 25, style: .continuous)
                    .fill(Color.red)
                    .frame(width: self.size.width, height: self.size.height)
                    .opacity(0.5)
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

public var hosting = UIHostingController(rootView: ContentView(mails: mxs))
