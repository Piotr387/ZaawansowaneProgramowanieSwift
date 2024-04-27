//
//  ContentView.swift
//  ZaawansowaneProgramowanieSwift
//
//  Created by Piotr Piwonski on 27/04/2024.
//

import SwiftUI

struct ContentView: View {
    
    let emoji: Array<String> = [
        "😁", "😇", "🎒", "⛑", "🧳",
        "⛸", "🏀", "⚽️", "🥎", "🏐",
        "🪃", "🏓", "🚗", "🚜", "🚓",
        "🚀", "🚤", "✈️", "🏖", "💵",
        "🎁", "🖼", "🪑", "📪", "💊", "🦠"
    ]
    @State var cardCount : Int = 2
    
    var body: some View {
        VStack {
            Text("Memo").font(.largeTitle)
            cardDisplay
            Spacer()
        
            HStack {
                cardRemover
                Spacer()
                cardAdder
            }
            .imageScale(.large)
            .font(.largeTitle)
        }
        .padding()
        
    }
    
    var cardDisplay: some View {
        ScrollView {
            LazyVGrid(columns: [GridItem(.adaptive(minimum: 120))], spacing: 10) {
                ForEach(0..<cardCount, id: \.self) { index in
                    CardView(content: emoji[index])
                }
            }
            .foregroundColor(.blue)
            .padding()
        }
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
