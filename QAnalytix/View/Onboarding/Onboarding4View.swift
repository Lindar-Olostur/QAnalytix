//
//  Onboarding4View.swift
//  QAnalytix
//
//  Created by Lindar Olostur on 12.08.2023.
//

import SwiftUI

struct Onboarding4View: View {
    //    @EnvironmentObject var webManager: WebViewModel
    let backgroundGradient = LinearGradient(
        gradient: Gradient(colors: [Color(red: 0.13, green: 0.14, blue: 0.21), Color(red: 0.07, green: 0.08, blue: 0.13)]),
        startPoint: .top, endPoint: .bottom)
    @State private var goToOnboarding5 = false
    
    var body: some View {
        backgroundGradient
            .ignoresSafeArea()
            .overlay(
                VStack(alignment: .leading) {
                    Text("Question 2/3")
                        .customText(style: .bold, size: 18, color: .white)
                        .padding(.top, 42)
                        .padding(.bottom, 12)
                    HStack {
                        Rectangle()
                            .frame(maxWidth: .infinity, minHeight: 6, maxHeight: 6)
                            .foregroundColor(Color("blueBTN"))
                            .cornerRadius(100)
                        Rectangle()
                            .frame(maxWidth: .infinity, minHeight: 6, maxHeight: 6)
                            .foregroundColor(Color("blueBTN"))
                            .cornerRadius(100)
                        Rectangle()
                            .frame(maxWidth: .infinity, minHeight: 6, maxHeight: 6)
                            .foregroundColor(Color(red: 0.21, green: 0.23, blue: 0.3))
                            .cornerRadius(100)
                    }
                    .padding(.bottom, 12)
                    Text("What income per week do you want to come to?")
                        .customText(style: .bold, size: 24, color: .white)
                        .padding(.vertical, 16)
                    Spacer()
                    Button {
                        goToOnboarding5 = true
                    } label: {
                        Text("< 1000")
                            .foregroundColor(.white)
                    }
                    .buttonStyle(BigButton(backgroundColor: Color("blueBTN")))
                    .padding(.bottom, 20)
                    Button {
                        goToOnboarding5 = true
                    } label: {
                        Text("> 1000")
                            .foregroundColor(.white)
                    }
                    .buttonStyle(BigButton(backgroundColor: Color("blueBTN")))
                    Spacer()
                }
                    .padding(.horizontal, 16)
                    .fullScreenCover(isPresented: $goToOnboarding5) {
                        Onboarding5View()
                    }
            )
        //            .screenshotProtected(isProtected: webManager.screenBlock)
    }
}

struct Onboarding4View_Previews: PreviewProvider {
    static var previews: some View {
        Onboarding4View()
        //            .environmentObject(WebViewModel())
            .environment(\.locale, .init(identifier: "ar"))
    }
}
