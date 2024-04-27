//
//  ThemeChangeViewButton.swift
//  ZaawansowaneProgramowanieSwift
//
//  Created by Piotr Piwonski on 27/04/2024.
//

import SwiftUI

struct ThemeChangeViewButton: View {
    let imageName: String
    let label: String
    let action: () -> Void
    
    var body: some View {
        Button(action: action) {
            VStack {
                Image(systemName: imageName)
                    .font(.title)
                Text(label)
                    .font(.caption)
            }
            .padding()
        }
    }
}

//struct ThemeChangeViewButton_Previews: PreviewProvider {
//    static var previews: some View {
//        ThemeChangeViewButton("")
//    }
//}
