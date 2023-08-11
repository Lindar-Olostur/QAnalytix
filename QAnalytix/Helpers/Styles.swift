//
//  Styles.swift
//  QAnalytix
//
//  Created by Lindar Olostur on 11.08.2023.
//

import Foundation
import SwiftUI
import Combine

//-----Text-----
struct CustomText: ViewModifier {
    enum TextStyle {
        case bold, regular, medium
    }
    
    let style: TextStyle
    let size: CGFloat
    let color: Color
    
    func body(content: Content) -> some View {
        var fontName = ""
        switch style {
        case .bold:
            fontName = "Rubik-Bold"
        case .regular:
            fontName = "Rubik-Regular"
        case .medium:
            fontName = "Rubik-Medium"
        }
        
        return content
            .font(.custom(fontName, size: size))
            .foregroundColor(color)
            .padding(.bottom, 0.5)
            .lineSpacing(5)
    }
}

extension View {
    func customText(style: CustomText.TextStyle, size: CGFloat, color: Color) -> some View {
        self.modifier(CustomText(style: style, size: size, color: color))
    }
}

//------Buttons------------
struct BigButton: ButtonStyle {
    var backgroundColor: Color
    func makeBody(configuration: Self.Configuration) -> some View {
        configuration.label
            .frame(maxWidth: .infinity)
            .font(.custom("Rubik-Regular", size: 16))
            .padding()
            .background(configuration.isPressed ? (backgroundColor == Color("blueBTN") ? Color(red: 0.33, green: 0.36, blue: 0.47) : backgroundColor.opacity(0.5)) : backgroundColor)
            .foregroundColor(.white)
            .cornerRadius(8)
            .animation(.easeIn, value: 5)
            //.opacity(configuration.isPressed ? 0.5 : 1)
        
        }
}

struct MainButton: ButtonStyle {
    let text: String
    let img: String
    
    func makeBody(configuration: Configuration) -> some View {
        configuration.label
            .frame(width: 343, height: 72)
            .background(Color(red: 0.99, green: 0.88, blue: 0.57))
            .cornerRadius(8)
            .overlay(
                Rectangle()
                    .frame(width: 343, height: 72)
                    .foregroundColor(Color(red: 0.43, green: 0.54, blue: 0.93))
                    .cornerRadius(8)
                    .offset(x: 5, y: 0)
                    .overlay(
                        HStack {
                            Text(text)
                                .font(.custom("Rubik-Bold", size: 18))
                                .foregroundColor(.white)
                                .padding(.leading)
                            Spacer()
                            Image(img)
                                .resizable()
                                .scaledToFit()
                                .padding(.trailing)
                        }
                    )
            )
            .opacity(configuration.isPressed ? 0.8 : 1)
            .padding(.bottom, 2)
    }
}


//-------hide keyboard
extension View {
  func endTextEditing() {
    UIApplication.shared.sendAction(#selector(UIResponder.resignFirstResponder),
                                    to: nil, from: nil, for: nil)
  }
}
// реализуется через onTapGesture на коренвой View
//    .onTapGesture {
//          self.endTextEditing()
//    }
