//let Fam: Label = "fam"
//let Spam: Label = "spam"
//
//var FamToke: [String] = ["good", "better", "best"]
//var SpamToke: [String] = ["bad", "evil", "worst"]
//
//var yoo = Classifier(newModel: MultinomialTf)
//
//yoo.learn(docs: [
//    Document(label: Fam, toke: FamToke),
//    Document(label: Spam, toke: SpamToke)
//])
//
//var (allScores, cls, cert) = yoo.classify(tokens: ["iam", "good", "now"])
//
//print(allScores, cls, cert)

import SwiftUI
import PlaygroundSupport

//Constants
// Swift Playgrounds
//let cardHeight:CGFloat = 1000
//let headingSize:CGFloat = 64
//let contentSize:CGFloat = 24

// Playgrounds
let cardHeight:CGFloat = 500
let headingSize:CGFloat = 48
let contentSize:CGFloat = 16

// Common Constants
let cardWidth:CGFloat = cardHeight * 0.6


struct ContentView: View {
    @State var frame: CGSize = .zero
    
    @State private var offset: CGSize = .zero
    @GestureState var isLongPressed = false
    
    var body: some View {
        
        ZStack {
            LinearGradient(gradient: Gradient(colors: [Color(.sRGB, red: (203/255.0), green: (203/255.0), blue: (160/255.0), opacity: 1.0), Color(.sRGB, red: (181/255.0), green: (181/255.0), blue: (73/255.0), opacity: 1.0)]), startPoint: UnitPoint(x: 1, y: 1), endPoint: UnitPoint(x: 0, y: 0))
                .edgesIgnoringSafeArea(.all)
            
            //Header
            Text("📬 Swiftspam")
                .font(.custom("HelveticaNeue-Thin", size: headingSize))
                .foregroundColor(.black)
                .offset(x: 0, y: -(cardWidth-(cardWidth/10)))
            
            CardView(isLongPressed: isLongPressed)
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
                    //                            .opacity(isLongPressed ? 0.3 : 1)
                ))
                .animation(.interactiveSpring())
        }
    }
}

struct CardView: View {
    // States
    var isLongPressed: Bool
    
    //Variables
    var greetings = "👋🏻 Hello World"

    var textColor = Color(.sRGB, white: 0, opacity: 1)
    
    var body: some View {
        ZStack {
            Group{
                RoundedRectangle(cornerRadius: 25, style: .continuous)
                    //            .fill(isLongPressed ? Color.blue : Color.white)
                    .fill(Color.white)
                    .frame(width: cardWidth, height: cardHeight)
                    .shadow(color: Color(.sRGB, white: 0, opacity: 0.15), radius: 5, x: 10, y: 10)
                    .padding()
                    .animation(.interactiveSpring())
                
                VStack(alignment: .leading, spacing: 5) {
                    // Subject Line
                    HStack{
                        Text("Subject: ")
                            .font(.custom("HelveticaNeue-Bold", size: contentSize))
                            .foregroundColor(textColor)
                        
                        Text("\(greetings)")
                            .font(.custom("HelveticaNeue-Light", size: contentSize))
                            .foregroundColor(textColor)
                    }
                    
                    // From
                    HStack {
                        Text("From: ")
                            .font(.custom("HelveticaNeue-Bold", size: contentSize))
                            .foregroundColor(textColor)
                        
                        Text("Steve Jobs")
                            .font(.custom("HelveticaNeue-Light", size: contentSize))
                            .foregroundColor(textColor)
                    }
                    
                    // To
                    HStack {
                        Text("To: ")
                            .font(.custom("HelveticaNeue-Bold", size: contentSize))
                            .foregroundColor(textColor)
                        
                        Text("Naman Bishnoi")
                            .font(.custom("HelveticaNeue-Light", size: contentSize))
                            .foregroundColor(textColor)
                    }
                    
                    HStack{
                        // Body
                        Text("Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum. Curabitur pretium tincidunt lacus. Nulla gravida orci a odio. Nullam varius, turpis et commodo pharetra, est eros bibendum elit, nec luctus magna felis sollicitudin mauris. Integer in mauris eu nibh euismod gravida. Duis ac tellus et risus vulputate vehicula. Donec lobortis risus a elit. Etiam tempor. Ut ullamcorper, ligula eu tempor congue, eros est euismod turpis, id tincidunt sapien risus a quam. Maecenas fermentum consequat mi. Donec fermentum. Pellentesque malesuada nulla a mi. Duis sapien sem, aliquet nec, commodo eget, consequat quis, neque. Aliquam faucibus, elit ut dictum aliquet, felis nisl adipiscing sapien, sed malesuada diam lacus eget erat. Cras mollis scelerisque nunc. Nullam arcu. Aliquam consequat. Curabitur augue lorem, dapibus quis, laoreet et, pretium ac, nisi. Aenean magna nisl, mollis quis, molestie eu, feugiat in, orci. In hac habitasse platea dictumst.")
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

PlaygroundPage.current.setLiveView(ContentView())
