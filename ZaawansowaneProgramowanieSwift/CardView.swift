//
//  CardView.swift
//  ZaawansowaneProgramowanieSwift
//
//  Created by Piotr Piwonski on 27/04/2024.
//

import SwiftUI

struct CardView: View {
    
    @State var isFaceUp: Bool = true
    var content: String = ""
    
    var body: some View {
        let rectangle: RoundedRectangle = RoundedRectangle(cornerRadius: 12)
        ZStack {
            Group {
                rectangle.foregroundColor(.white)
                rectangle.strokeBorder(lineWidth: 2)
                Text(content).font(.largeTitle)
            }
            .opacity(isFaceUp ? 1 : 0)
            rectangle.fill().opacity(isFaceUp ? 0 : 1)
        }.onTapGesture {
            isFaceUp.toggle()
        }
    }
}

struct CardView_Previews: PreviewProvider {
    static var previews: some View {
        CardView(
            isFaceUp: true,
            content: "🥊"
        )
    }
}
