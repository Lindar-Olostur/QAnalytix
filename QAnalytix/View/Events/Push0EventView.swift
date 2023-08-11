//
//  Push0EventView.swift
//  QAnalytix
//
//  Created by Lindar Olostur on 15.08.2023.
//

import SwiftUI
//import OneSignal
//import AppsFlyerLib
//import Firebase
//import FirebaseAnalytics
//import ScreenshotPreventingSwiftUI
//
struct PushSubEventView: View {
    @Environment(\.presentationMode) var presentationMode
//    @EnvironmentObject var webManager: WebViewModel
    let backgroundGradient = LinearGradient(
        gradient: Gradient(colors: [Color("bg"), Color("bg1")]),
        startPoint: .top, endPoint: .bottom)
    var body: some View {
        backgroundGradient
            .ignoresSafeArea()
            .overlay(
                ZStack {
                    VStack {
                        VStack(alignment: .leading) {
                            Text("Don't miss your chance\nto make money!")
                                .customText(style: .bold, size: 24, color: .white)
                                .padding(.top, 42)
                            Text("Turn on push notifications for more efficient use of push notifications")
                                .customText(style: .medium, size: 16, color: Color("grayText"))
                        }
                        Spacer()
                        Spacer()
                        VStack {
                            SignalRow(pair: "EUR/USD", flags: "EURUSD", time: Date(), isSell: false)
                            SignalRow(pair: "AUD/USD", flags: "AUDUSD", time: Date(), isSell: true)
                        }
                        .padding(16)
                        Spacer()
                        Button {
                            //                        if let appSettingsURL = URL(string: UIApplication.openSettingsURLString) {
                            //                            UIApplication.shared.open(appSettingsURL, options: [:], completionHandler: nil)
                            //                        }
                            self.presentationMode.wrappedValue.dismiss()
                        } label: {
                            Text("Continue")
                        }
                        .buttonStyle(BigButton(backgroundColor: Color("blueBTN")))
                        .padding(16)
                        .padding(.bottom, 34)
                    }
                }
//                    .onAppear {
//                        AppsFlyerLib.shared().logEvent("push_sub_opened", withValues: nil)
//                        Analytics.logEvent("push_sub_opened", parameters: nil)
//                    }
                )
//            .screenshotProtected(isProtected: webManager.screenBlock)
    }
}

struct PushSubEventView_Previews: PreviewProvider {
    static var previews: some View {
        PushSubEventView()
//            .environmentObject(WebViewModel())
            .environment(\.locale, .init(identifier: "ar"))
    }
}
