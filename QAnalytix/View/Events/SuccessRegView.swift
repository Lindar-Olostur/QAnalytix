//
//  SuccessRegView.swift
//  QAnalytix
//
//  Created by Lindar Olostur on 15.08.2023.
//

import SwiftUI
//import AppsFlyerLib
//import Firebase
//import FirebaseAnalytics
//import OneSignal
//import ScreenshotPreventingSwiftUI
//
struct SuccessRegistrationView: View {
    @Environment(\.presentationMode) var presentationMode
    let backgroundGradient = LinearGradient(
        gradient: Gradient(colors: [Color("bg"), Color("bg1")]),
        startPoint: .top, endPoint: .bottom)
//    @EnvironmentObject var webManager: WebViewModel
    @EnvironmentObject var userSettings: UserSettings
    var body: some View {
        backgroundGradient
            .ignoresSafeArea()
            .overlay(
                ZStack {
                    VStack(alignment: .center) {
                        Spacer()
                        VStack {
                            VStack(alignment: .center) {
                                Image("reg")
                                    .resizable()
                                    .frame(width: 80, height: 80)
                                    .padding(10)
                                Text("Registration completed.")
                                    .customText(style: .bold, size: 24, color: .white)
                                    .foregroundColor(.white)
                                Text("Great job!")
                                    .customText(style: .bold, size: 24, color: .white)
                                    .foregroundColor(.white)
                            }
                            .padding(.horizontal, 16)
                            .padding(.vertical, 44)
                            .frame(width: 343, alignment: .center)
                            .background(Color(red: 0.21, green: 0.23, blue: 0.3))
                            .cornerRadius(8)
                        }
                        .frame(maxWidth: .infinity)
                        .background(Color("BackgroundQuaternary"))
                        .cornerRadius(15)
                        .padding(.vertical)
                        Spacer()
                        Button {
                            userSettings.event0 = true
                            userSettings.saveUserToUserDefaults()
//                            OneSignal.sendTags(["reg": "true"])
                            self.presentationMode.wrappedValue.dismiss()
                        } label: {
                            Text("Next")
                        }
                        .buttonStyle(BigButton(backgroundColor: Color("blueBTN")))
                        .padding(16)
                        .padding(.bottom, 34)
                    }
                }
//                    .onAppear {
//                        AppsFlyerLib.shared().logEvent("event0_success", withValues: nil)
//                        Analytics.logEvent("event0_success", parameters: nil)
//                    }
//            .screenshotProtected(isProtected: webManager.screenBlock)
                        )
    }
}

struct SuccessRegistrationView_Previews: PreviewProvider {
    static var previews: some View {
        SuccessRegistrationView()
//            .environmentObject(WebViewModel())
            .environmentObject(UserSettings())
            .environment(\.locale, .init(identifier: "ru"))
    }
}
