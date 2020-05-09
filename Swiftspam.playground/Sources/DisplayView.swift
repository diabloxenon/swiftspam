import SwiftUI

//Constants
// Swift Playgrounds
//let cardHeight:CGFloat = 1000
//let headingSize:CGFloat = 64
//let contentSize:CGFloat = 24

// Playgrounds
// let cardHeight: CGFloat = 500
let headingSize: CGFloat = 48
let contentSize: CGFloat = 16

// Common Constants
let factor:CGFloat = 0.75

let textColor = Color(.sRGB, white: 0, opacity: 1)

enum SpamFam: Int {
    case spam, fam, none
}

public struct ContentView: View {
    @State private var frame: CGSize = .zero // Contains Geometrical dims of current view.
    @State private var cardDim: CGSize = .zero
    
    @State private var offset: CGSize = .zero
    @GestureState var isLongPressed = false
    
    @State private var swipeStatus: SpamFam = .none
    
    @State public var mail: Mail = Mail()
    
    func setDims(_ geometry: GeometryProxy) -> some View{
        DispatchQueue.main.async {
            self.frame = geometry.size
            self.cardDim.height = geometry.size.height * factor
            self.cardDim.width = geometry.size.height * factor * 0.6 //Aspect ratio
        }
        return Text("")
    }

    var swipe: some Gesture{
        LongPressGesture()
            .updating($isLongPressed) { value, state, _ in
                    state = value
                }.simultaneously(with: DragGesture()
                    .onChanged {
                        self.offset = $0.translation
                        
                        if $0.translation.width / self.frame.width >= 0.35{
//                            print("RIGHT")
                            self.swipeStatus = .fam
                        } else if $0.translation.width / self.frame.width <= -0.35{
//                            print("LEFT")
                            self.swipeStatus = .spam
                        } else {
//                            print("NONE")
                            self.swipeStatus = .none
                        }
                    }
                    .onEnded { v in withAnimation {
//                        if abs(v.translation.width/self.frame.width) > 0.35{
////                            self.onRemove(self.user)
//                        } else{
//                            self.offset = .zero
//                        }
                        self.offset = .zero
                        self.swipeStatus = .none
                    }
                }
        )
    }
    
    public var body: some View {
        GeometryReader { geometry in
        ZStack {
            self.setDims(geometry)
            LinearGradient(gradient: Gradient(colors: [Color(.sRGB, red: (203/255.0), green: (203/255.0), blue: (160/255.0), opacity: 1.0), Color(.sRGB, red: (181/255.0), green: (181/255.0), blue: (73/255.0), opacity: 1.0)]), startPoint: UnitPoint(x: 1, y: 1), endPoint: UnitPoint(x: 0, y: 0))
                .edgesIgnoringSafeArea(.all)

            VStack{
            //Header
            Text("📬 Swiftspam")
                .font(.custom("HelveticaNeue-Thin", size: headingSize))
                .foregroundColor(.black)
                .padding(.bottom)

                CardView(spamOrHam: self.swipeStatus, size: self.cardDim, mail: self.mail)
                    .shadow(color: Color(.sRGB, white: 0, opacity: 0.15), radius: 5, x: 10, y: 10)
                    .scaleEffect(self.isLongPressed ? 1.1 : 1)
                    .opacity(self.isLongPressed ? 0.9 : 1)
                    .offset(x: self.offset.width, y: self.offset.height)
                    .rotationEffect(.degrees(Double(self.offset.width / geometry.size.width) * 25), anchor: .bottom)
                    .gesture(self.swipe)
                .animation(.interactiveSpring())

            }
            
        }
    }
    }
}

struct CardView: View {
    // States
    var spamOrHam: SpamFam
    var size: CGSize
    var mail: Mail

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
        }
    }
}

public var hosting = UIHostingController(rootView: ContentView())
