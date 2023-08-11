//
//  
//  TabBarButton.swift
//  QAnalytix
//
//  Created by Lindar Olostur on 11.08.2023.
//
//

import SwiftUI

struct TabBarButton: View {
    let image: String
    let text: String
    let isSelected: Bool
    let action: () -> Void
    
    var body: some View {
        Button(action: action) {
            VStack {
                
                VStack {
                    if isSelected {
                        Divider()
                            .frame(height: 2)
                            .background(Color.blue)
                            .padding(.top, -6)
                            .offset(y: 6)
                    } else {
                        Divider()
                            .frame(height: 1)
                            .background(Color("grayText"))
                            .padding(.top, -6)
                            .offset(y: 6)
                    }
                    Image(image)
                        .resizable()
                        .scaledToFit()
                        .frame(height: 26)
                        .colorMultiply(isSelected ? Color("lightBlue") : .gray)
                    Text(NSLocalizedString(text, comment: ""))
                        .font(.custom("Manrope-Regular", size: 12))
                        .foregroundColor(isSelected ? .white : Color("grayText"))
                        .multilineTextAlignment(.center)
                }
                
            }.padding(.bottom)
        }
    }
}
struct TabBarButton_Previews: PreviewProvider {
    static var previews: some View {
        TabBarButton(image: "fightIcon", text: "lol", isSelected: false, action: {})
    }
}
struct TabItem {
    let icon: String
    let text: LocalizedStringKey
}
