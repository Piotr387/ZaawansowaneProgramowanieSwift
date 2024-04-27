//
//  ContentView.swift
//  ZaawansowaneProgramowanieSwift
//
//  Created by Piotr Piwonski on 27/04/2024.
//

import SwiftUI

struct ContentView: View {
    
    // Tematy motywów
    let dayTheme: Array<String> = ["☀️", "🌈", "🌸", "🍦"]
    let nightTheme: Array<String> = ["🌙", "🦉", "🔮", "🌌", "🎆", "🚀"]
    let natureTheme: Array<String> = ["🌳", "🌼", "🦋", "🌊", "🐦", "🌄", "🦠", "🖼"]
    
    @State private var emoji: [String] = [
        "😁", "😇", "🎒", "⛑", "🧳",
        "⛸", "🏀", "⚽️", "🥎", "🏐",
        "🪃", "🏓", "🚗", "🚜", "🚓",
        "🚀", "🚤", "✈️", "🏖", "💵",
        "🎁", "🖼", "🪑", "📪", "💊", "🦠"
    ]
    @State var cardCount : Int = 2
    @State var color: Color = .blue
    
    var body: some View {
        VStack {
            Text("Memo").font(.largeTitle)
            cardDisplay
            Spacer()
            //cardCounterAdjuster
            themeSelectionButtons
        }
        .padding()
        
    }
    
    var cardDisplay: some View {
        ScrollView {
            let columnsSetUp = [
                GridItem(.adaptive(minimum: 120))
            ]
            
            LazyVGrid(columns: columnsSetUp, spacing: 10) {
                ForEach(emoji.indices, id: \.self) { index in
                    //ForEach(0..<cardCount, id: \.self) { index in
                    CardView(content: emoji[index])
                        .aspectRatio(2/3, contentMode: .fit)
                }
            }
            .foregroundColor(color)
            .padding()
        }
    }
    
    
    var themeSelectionButtons: some View {
        HStack {
            ThemeChangeViewButton(imageName: "sun.max.fill", label: "Dzień") {
                self.changeTheme(to: self.dayTheme)
                color = .yellow
            }
            Spacer()
            ThemeChangeViewButton(imageName: "moon.fill", label: "Noc") {
                self.changeTheme(to: self.nightTheme)
                color = .black
            }
            Spacer()
            ThemeChangeViewButton(imageName: "leaf.fill", label: "Natura") {
                self.changeTheme(to: self.natureTheme)
                color = .green
            }
        }.foregroundColor(color)
    }

    
    // Kolor i tło kart zależne od wybranego tematu
    var cardColor: Color {
        emoji.isEmpty ? .black : .white
    }
    
    var cardBackgroundColor: Color {
        emoji.isEmpty ? .white : .black
    }
    
    // Zmiana tematu i przetasowanie kart
    func changeTheme(to theme: [String]) {
        emoji = [].shuffled()
        emoji = theme.shuffled()
    }
    
    init() {
        changeTheme(to: dayTheme) // Domyślny temat
    }
    
    //    CardCounter...
    //    CardCounter...
    //    CardCounter...
    //    CardCounter...
    
    var cardCounterAdjuster: some View {
        HStack {
            cardRemover
            Spacer()
            cardAdder
        }
        .imageScale(.large)
        .font(.largeTitle)
    }
    
    func adjustCardNumber(by offset: Int, symbol: String) -> some View {
        let isMinusDisabled = cardCount <= 2 && offset < 0
        let isPlusDisabled = cardCount >= emoji.count && offset > 0
        
        return Button(action: {
            guard cardCount + offset >= 0 && cardCount + offset <= emoji.count else {
                return
            }
            
            cardCount += offset
        }) {
            Image(systemName: symbol)
        }
        .disabled(isMinusDisabled || isPlusDisabled)
    }
    
    var cardRemover: some View {
        return adjustCardNumber(by: -2, symbol: "minus.rectangle")
    }
    
    var cardAdder: some View {
        return adjustCardNumber(by: 2, symbol: "plus.rectangle")
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
