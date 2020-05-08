import SwiftUI

//Constants
// Swift Playgrounds
//let cardHeight:CGFloat = 1000
//let headingSize:CGFloat = 64
//let contentSize:CGFloat = 24

// Playgrounds
let cardHeight: CGFloat = 500
let headingSize: CGFloat = 48
let contentSize: CGFloat = 16

// Common Constants
let cardWidth: CGFloat = cardHeight * 0.6
let textColor = Color(.sRGB, white: 0, opacity: 1)

public struct ContentView: View {
    @State var frame: CGSize = .zero

    @State private var offset: CGSize = .zero
    @GestureState var isLongPressed = false

    public var body: some View {

        ZStack {
            LinearGradient(gradient: Gradient(colors: [Color(.sRGB, red: (203/255.0), green: (203/255.0), blue: (160/255.0), opacity: 1.0), Color(.sRGB, red: (181/255.0), green: (181/255.0), blue: (73/255.0), opacity: 1.0)]), startPoint: UnitPoint(x: 1, y: 1), endPoint: UnitPoint(x: 0, y: 0))
                .edgesIgnoringSafeArea(.all)

            //Header
            Text("📬 Swiftspam")
                .font(.custom("HelveticaNeue-Thin", size: headingSize))
                .foregroundColor(.black)
                .offset(x: 0, y: -(cardWidth-(cardWidth/10)))

            CardView(isLongPressed: isLongPressed, mail: Mail())
                .scaleEffect(isLongPressed ? 1.1 : 1)
                .opacity(isLongPressed ? 0.9 : 1)
                .offset(x: offset.width, y: offset.height+(cardWidth/10))
                .gesture(LongPressGesture()
                    .updating($isLongPressed) { value, state, _ in
                        state = value
                }.simultaneously(with: DragGesture()
                    .onChanged {
                        self.offset = $0.translation
                }
                .onEnded { _ in withAnimation {
                    self.offset = .zero
                    }}
//                  .opacity(isLongPressed ? 0.3 : 1)
                ))
                .animation(.interactiveSpring())
        }
    }
}

struct CardView: View {
    // States
    var isLongPressed: Bool
    var mail: Mail

    var body: some View {
        ZStack {
            Group {
                RoundedRectangle(cornerRadius: 25, style: .continuous)
                    .fill(Color.white)
                    .frame(width: cardWidth, height: cardHeight)
                    .shadow(color: Color(.sRGB, white: 0, opacity: 0.15), radius: 5, x: 10, y: 10)
                    .padding()
                    .animation(.interactiveSpring())

                VStack(alignment: .leading, spacing: 5) {
                    // Subject Line
                    HStack(alignment: .top, spacing: 5){
                        Text("Subject: ")
                            .font(.custom("HelveticaNeue-Bold", size: contentSize))
                            .foregroundColor(textColor)

                        Text("\(mail.subject)")
                            .font(.custom("HelveticaNeue-Light", size: contentSize))
                            .foregroundColor(textColor)
                    }

                    // From
                    HStack {
                        Text("From: ")
                            .font(.custom("HelveticaNeue-Bold", size: contentSize))
                            .foregroundColor(textColor)

                        Text("\(mail.from)")
                            .font(.custom("HelveticaNeue-Light", size: contentSize))
                            .foregroundColor(textColor)
                    }

                    // To
                    HStack {
                        Text("To: ")
                            .font(.custom("HelveticaNeue-Bold", size: contentSize))
                            .foregroundColor(textColor)

                        Text("\(mail.to)")
                            .font(.custom("HelveticaNeue-Light", size: contentSize))
                            .foregroundColor(textColor)
                    }

                    HStack {
                        // Body
                        Text("\(mail.body)")
                            .font(.custom("HelveticaNeue-Light", size: contentSize))
                            .foregroundColor(textColor)
                            .padding(.top)
                    }
                }.padding(cardHeight/20).padding(.vertical)
                 .frame(width: cardWidth, height: cardHeight)
            }.padding(cardHeight/10)
        }
    }
}

public var hosting = UIHostingController(rootView: ContentView())
