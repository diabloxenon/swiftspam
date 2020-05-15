import SwiftUI

public struct CreditsView: View {
    let credits = ["इनके द्वारा निर्मित: नमन बिश्नोई", "Created by: Naman Bishnoi", "作成者：ナマンビシュノイ", "Erstellt von: Naman Bishnoi", "Creato da: Naman Bishnoi", "Aangemaakt door: Naman Bishnoi", "Vytvořil: Naman Bishnoi", "Создатель: Наман Бишной", "Δημιουργήθηκε από: Naman Bishnoi", "تخلیق کردہ: نعمان بشنوئی", "नमन बिश्नोई द्वारा बनाईएको", "Cruthaithe ag: Naman Bishnoi", "Créé par: Naman Bishnoi", "Creado por: Naman Bishnoi", "Készítette: Naman Bishnoi", "Geskep deur: Naman Bishnoi", "创建于：Naman Bishnoi", "נוצר על ידי: נאמן בישנוי", "Thank You 🙏🏻"]
    
    
    public var body: some View{
        ZStack{
            LinearGradient(gradient: Gradient(colors: [Color.swiftspamInfoBG1, Color.swiftspamInfoBG2]), startPoint: UnitPoint(x: 1, y: 1), endPoint: UnitPoint(x: 0, y: 0))
                .edgesIgnoringSafeArea(.all)
            ScrollView(showsIndicators: false) {
                VStack(spacing: 20) {
                    Spacer()
                    Text("A tribute to all my friends who have motivated me from all around the world. This is for you!")
                        .foregroundColor(.white)
                        .font(.headline)
                        .padding(.all)
                        .multilineTextAlignment(.center)
                    ForEach(0..<self.credits.count) {
                        Text(self.credits[$0])
                            .foregroundColor(.white)
                            .font(.headline)
                            .frame(width: 350, height: 50)
                            .multilineTextAlignment(.center)
                    }
                    Spacer()
                }
            }
        }
    }
}

public var credits = UIHostingController(rootView: CreditsView())