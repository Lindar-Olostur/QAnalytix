//
//  
//  Onboarding6View.swift
//  QAnalytix
//
//  Created by Lindar Olostur on 11.08.2023.
//
//

import SwiftUI
//import AppsFlyerLib
//import Firebase
//import FirebaseAnalytics
//import ScreenshotPreventingSwiftUI

struct Onboarding6View: View {
    @EnvironmentObject var userSettings: UserSettings
//    @EnvironmentObject var webManager: WebViewModel
    @State private var finishOnboarding = false
    let backgroundGradient = LinearGradient(
        gradient: Gradient(colors: [Color("bg"), Color("bg1")]),
        startPoint: .top, endPoint: .bottom)
    var body: some View {
        backgroundGradient
            .ignoresSafeArea()
            .overlay(
                VStack {
                    Text("Register so as not to lose the accumulated progress and victories")
                        .font(.custom("Manrope-Bold", size: 24))
                        .foregroundColor(.white)
                        .padding(.leading, 16)
                        .padding(.top, 20)
                        .multilineTextAlignment(.leading)
                    Image("iPhone")
                        .resizable()
                        .scaledToFit()
                        .overlay(
                            LinearGradient(
                                gradient: Gradient(stops: [
                                    .init(color: Color.clear, location: 0),
                                    .init(color: Color("bg1"), location: 0.8)
                                ]),
                                startPoint: UnitPoint(x: 0.5, y: 0.6),
                                endPoint: .bottom
                            )
                        )
                        .offset(y: 20)
                    Button {
                        UserDefaults.standard.set(true, forKey: "isOnboardingCompleted")
                        finishOnboarding = true
                        userSettings.isOnboardingCompleted = true
//                        AppsFlyerLib.shared().logEvent("onboarding_finish", withValues: nil)
//                        Analytics.logEvent("onboarding_finish", parameters: nil)
                    } label: {
                        Text("Continue")
                    }
                    .buttonStyle(BigButton(backgroundColor: Color("blueBTN")))
                    .padding(.bottom)
                }
                    .fullScreenCover(isPresented: $finishOnboarding) {
                        NewTabView()
                            .environmentObject(userSettings)
//                            .environmentObject(webManager)
                    }
            )
//            .screenshotProtected(isProtected: webManager.screenBlock)
    }
}

struct Onboarding6View_Previews: PreviewProvider {
    static var previews: some View {
        Onboarding6View()
//            .environmentObject(WebViewModel())
            .environment(\.locale, .init(identifier: "ar"))
    }
}
