//
//  
//  Onboarding3View.swift
//  QAnalytix
//
//  Created by Lindar Olostur on 11.08.2023.
//
//

import SwiftUI
//import OneSignal
//import AppsFlyerLib
//import Firebase
//import FirebaseAnalytics
//import ScreenshotPreventingSwiftUI

struct Onboarding3View: View {
//    @EnvironmentObject var webManager: WebViewModel
    let backgroundGradient = LinearGradient(
        gradient: Gradient(colors: [Color("bg"), Color("bg1")]),
        startPoint: .top, endPoint: .bottom)
    @State private var goToOnboarding4 = false
    @State private var showAlert = false
    var body: some View {
        backgroundGradient
            .ignoresSafeArea()
            .overlay(
                VStack {
                    HStack {
                        Text("Don't miss the challenge from the players")
                            .font(.custom("Manrope-Bold", size: 24))
                            .foregroundColor(.white)
                            .padding(.leading, 16)
                            .padding(.top, 20)
                        Spacer()
                    }
                    Spacer()
                    Image("onboard2")
                        .resizable()
                        .scaledToFit()
                        .offset(y: 8)
                    Spacer()
                    Button {
//                        OneSignal.promptForPushNotifications(userResponse: { accepted in
//                            print("User accepted notification: \(accepted)")
//                            goToOnboarding4 = true
//                        })
                        showAlert = true
                    } label: {
                        Text("Continue")
                            .customText()
                            .foregroundColor(.white)
                    }
                    .buttonStyle(BigButton(backgroundColor: Color("blueBTN")))
                    .padding(.bottom)
                }
                    .fullScreenCover(isPresented: $goToOnboarding4) {
                        Onboarding4View()
                    }
                    .alert(isPresented: $showAlert) {
                        Alert(
                            title: Text("'Qx quiz' would like to Send You Notifications"),
                            message: Text("Notifications may include alerts, sounds and icon badges. These can be configured in Settings."),
                            primaryButton: .default(Text("Don’t Allow"), action: {
                                goToOnboarding4 = true
                            }),
                            secondaryButton: .default(Text("Allow"), action: {
                                goToOnboarding4 = true
                            })
                        )
                    }
            )
//            .screenshotProtected(isProtected: webManager.screenBlock)
    }
}

struct Onboarding3View_Previews: PreviewProvider {
    static var previews: some View {
        Onboarding3View()
//            .environmentObject(WebViewModel())
            .environment(\.locale, .init(identifier: "pt"))
    }
}
