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

public struct ContentView: View {
    @State var frame: CGSize = .zero

    @State private var offset: CGSize = .zero
    @GestureState var isLongPressed = false
    @State var hasDragged = false
    @State public var mail: Mail = Mail()
    
//    @State private var translation: CGSize = .zero

    var swipe: some Gesture{
        LongPressGesture()
            .updating($isLongPressed) { value, state, _ in
                    state = value
                }.simultaneously(with: DragGesture()
                    .onChanged {
                    self.offset = $0.translation
//                        self.rotation = $
                        }
                    .onEnded { _ in withAnimation {
                    self.offset = .zero
                        }
                    print("Hello")
                    self.hasDragged = true
                }
//                  .opacity(isLongPressed ? 0.3 : 1)
        )
    }
    
    public var body: some View {
        GeometryReader { geometry in
        ZStack {
            LinearGradient(gradient: Gradient(colors: [Color(.sRGB, red: (203/255.0), green: (203/255.0), blue: (160/255.0), opacity: 1.0), Color(.sRGB, red: (181/255.0), green: (181/255.0), blue: (73/255.0), opacity: 1.0)]), startPoint: UnitPoint(x: 1, y: 1), endPoint: UnitPoint(x: 0, y: 0))
                .edgesIgnoringSafeArea(.all)

            VStack{
            //Header
            Text("📬 Swiftspam")
                .font(.custom("HelveticaNeue-Thin", size: headingSize))
                .foregroundColor(.black)
                .padding(.bottom)
                // .offset(x:0, y: -((geometry.size.height * factor * 0.6)-((geometry.size.height * factor * 0.6)/10)))

                CardView(cardHeight: geometry.size.height * factor, cardWidth: geometry.size.height * factor * 0.6, mail: self.mail)
                    .shadow(color: Color(.sRGB, white: 0, opacity: 0.15), radius: 5, x: 10, y: 10)
                    .scaleEffect(self.isLongPressed ? 1.1 : 1)
                    .opacity(self.isLongPressed ? 0.9 : 1)
                    // .animation(.interactiveSpring())
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
    var cardHeight: CGFloat
    var cardWidth: CGFloat
    var mail: Mail

    var body: some View {
//        GeometryReader { geometry in
        Group{
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
                }.padding(self.cardHeight/20).padding(.top)
                    .frame(width: self.cardWidth, height: self.cardHeight)
                 .animation(.interactiveSpring())
                 .background(Color.white)
                 .cornerRadius(25)
        }
    }
}

public var hosting = UIHostingController(rootView: ContentView())
