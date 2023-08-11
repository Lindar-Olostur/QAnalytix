//
//  Onboarding8View.swift
//  QAnalytix
//
//  Created by Lindar Olostur on 12.08.2023.
//

import SwiftUI
//import AppsFlyerLib
//import Firebase
//import FirebaseAnalytics
//import ScreenshotPreventingSwiftUI

struct Onboarding8View: View {
    @EnvironmentObject var userSettings: UserSettings
//    @EnvironmentObject var webManager: WebViewModel
    @State private var finishOnboarding = false
    @State var progress: Int = 0
    @State var animationDuration = 0.2
    let backgroundGradient = LinearGradient(
        gradient: Gradient(colors: [Color("bg"), Color("bg1")]),
        startPoint: .top, endPoint: .bottom)
    var body: some View {
        backgroundGradient
            .ignoresSafeArea()
            .overlay(
                VStack(alignment: .leading) {
                    Text(progress != 12 ? "Thank you!" : "Done! ")
                        .customText(style: .bold, size: 24, color: .white)
                        .padding(.top, 42)
                    Text(progress != 12 ? "We are processing your responses" : "The application is adjusted for you")
                        .customText(style: .medium, size: 16, color: Color("grayText"))
                    Spacer()
                    HStack {
                        Spacer()
                        RingWithAnimatedProgress(animationDuration: $animationDuration, progress: $progress)
                            .frame(width: 156, height: 158)
                        Spacer()
                    }
                    Spacer()
                    Button {
                        UserDefaults.standard.set(true, forKey: "isOnboardingCompleted")
                        finishOnboarding = true
                        userSettings.isOnboardingCompleted = true
//                        AppsFlyerLib.shared().logEvent("onboarding_finish", withValues: nil)
//                        Analytics.logEvent("onboarding_finish", parameters: nil)
                    } label: {
                        Text(progress != 12 ? "Continue" : "Get started")
                    }
                    .disabled(progress != 12 ? true : false)
                    .opacity(progress == 12 ? 1.0 : 0.5)
                    .buttonStyle(BigButton(backgroundColor: Color("blueBTN")))
                    .padding(.bottom, 40)
                }
                    .padding(.horizontal, 16)
                    .onAppear {
                        Timer.scheduledTimer(withTimeInterval: self.animationDuration, repeats: true) { timer in
                            if self.progress < 12 {
                                self.progress += 1
                            } else {
                                timer.invalidate()
                            }
                        }
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

struct Onboarding8View_Previews: PreviewProvider {
    static var previews: some View {
        Onboarding8View()
//            .environmentObject(WebViewModel())
            //.environment(\.locale, .init(identifier: "ar"))
    }
}
