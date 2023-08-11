//
//  Onboarding5View.swift
//  QAnalytix
//
//  Created by Lindar Olostur on 12.08.2023.
//

import SwiftUI
//import ScreenshotPreventingSwiftUI

struct Onboarding5View: View {
    //    @EnvironmentObject var webManager: WebViewModel
    let backgroundGradient = LinearGradient(
        gradient: Gradient(colors: [Color("bg"), Color("bg1")]),
        startPoint: .top, endPoint: .bottom)
    @State private var goToOnboarding6 = false
    var body: some View {
        backgroundGradient
            .ignoresSafeArea()
            .overlay(
                ZStack {
                    VStack(alignment: .leading) {
                        Text("Use the Analitics")
                            .customText(style: .bold, size: 24, color: .white)
                            .padding(.top, 42)
                        Text("Our tools will help you better understand forex")
                            .customText(style: .medium, size: 16, color: Color("grayText"))
                        Spacer()
                        HStack {
                            Spacer()
                            ZStack {
                                Image("phone1")
                                    .resizable()
                                    .aspectRatio(contentMode: .fit)
                                Image("phone3")
                                    .resizable()
                                    .aspectRatio(contentMode: .fit)
                            }
                            .overlay(
                                LinearGradient(
                                    gradient: Gradient(stops: [
                                        .init(color: Color.clear, location: 0),
                                        .init(color: Color("bg1"), location: 0.8)
                                    ]),
                                    startPoint: UnitPoint(x: 0.5, y: 0.2),
                                    endPoint: .bottom
                                )
                            )
                            .offset(y: 20)
                            Spacer()
                        }
                    }
                    VStack {
                        Spacer()
                        Button {
                            goToOnboarding6 = true
                        } label: {
                            Text("Continue")
                                .foregroundColor(.white)
                        }
                        .buttonStyle(BigButton(backgroundColor: Color("blueBTN")))
                        .padding(.bottom, 40)
                    }
                }
                    .padding(.horizontal, 16)
                    .fullScreenCover(isPresented: $goToOnboarding6) {
                        Onboarding6View()
                    }
            )
        //            .screenshotProtected(isProtected: webManager.screenBlock)
    }
}

struct Onboarding5View_Previews: PreviewProvider {
    static var previews: some View {
        Onboarding5View()
        //            .environmentObject(WebViewModel())
            .environment(\.locale, .init(identifier: "ru"))
    }
}
