//
////  
//  SuccessDView.swift
//  QAnalytix
//
//  Created by Lindar Olostur on 11.08.2023.
//
//
//
//import SwiftUI
//import AppsFlyerLib
//import Firebase
//import FirebaseAnalytics
//import OneSignal
//import ScreenshotPreventingSwiftUI
//
//struct SuccessDView: View {
//    @Environment(\.presentationMode) var presentationMode
//    @EnvironmentObject var userSettings: UserSettings
//    @EnvironmentObject var webManager: WebViewModel
//    var body: some View {
//        Color("bg")
//            .ignoresSafeArea()
//            .overlay(
//                VStack(alignment: .center) {
//                    Spacer()
//                    VStack {
//                        VStack(alignment: .center) {
//                            Image("coins")
//                                .resizable()
//                                .frame(width: 44, height: 44)
//                            Text("Your first deposit was successful. Congrats!")
//                                .font(.custom("Manrope-Bold", size: 24))
//                                .foregroundColor(.white)
//                        }
//                        .padding(40)
//                    }
//                    .frame(maxWidth: .infinity)
//                    .background(Color("BackgroundQuaternary"))
//                    .cornerRadius(15)
//                    .padding(.vertical)
//                    Spacer()
//                    Button {
//                        userSettings.event1 = true
//                        userSettings.saveUserToUserDefaults()
//                        OneSignal.sendTags(["dep": "true"])
//                        self.presentationMode.wrappedValue.dismiss()
//                    } label: {
//                        Text("Next")
//                            .font(.custom("Manrope-Bold", size: 16))
//                            .foregroundColor(.white)
//                    }
//                    .buttonStyle(BigButton(backgroundColor: Color("blueBTN")))
//                }
//                    .onAppear {
//                        AppsFlyerLib.shared().logEvent("event1_success", withValues: nil)
//                        Analytics.logEvent("event1_success", parameters: nil)
//                    }
//                )
//            .screenshotProtected(isProtected: webManager.screenBlock)
//    }
//}
//
//struct SuccessDView_Previews: PreviewProvider {
//    static var previews: some View {
//        SuccessDView()
//            .environmentObject(WebViewModel())
//            .environmentObject(UserSettings())
//            .environment(\.locale, .init(identifier: "ru"))
//    }
//}
