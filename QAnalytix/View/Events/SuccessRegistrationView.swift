//
//  
//  SuccessRegistrationView.swift
//  QAnalytix
//
//  Created by Lindar Olostur on 11.08.2023.
//
//

//import SwiftUI
//import AppsFlyerLib
//import Firebase
//import FirebaseAnalytics
//import OneSignal
//import ScreenshotPreventingSwiftUI
//
//struct SuccessRegistrationView: View {
//    @Environment(\.presentationMode) var presentationMode
//    @EnvironmentObject var webManager: WebViewModel
//    @EnvironmentObject var userSettings: UserSettings
//    var body: some View {
//        Color("bg")
//            .ignoresSafeArea()
//            .overlay(
//                VStack(alignment: .center) {
//                    Spacer()
//                    VStack {
//                        VStack(alignment: .center) {
//                            Image("blueCheck")
//                                .resizable()
//                                .frame(width: 44, height: 44)
//                            Text("Registration completed.")
//                                .font(.custom("Manrope-Bold", size: 24))
//                                .foregroundColor(.white)
//                            Text("Great job!")
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
//                        userSettings.event0 = true
//                        userSettings.saveUserToUserDefaults()
//                        OneSignal.sendTags(["reg": "true"])
//                        self.presentationMode.wrappedValue.dismiss()
//                    } label: {
//                        Text("Next")
//                            .font(.custom("Manrope-Bold", size: 16))
//                            .foregroundColor(.white)
//                    }
//                    .buttonStyle(BigButton(backgroundColor: Color("blueBTN")))
//                }
//                    .onAppear {
//                        AppsFlyerLib.shared().logEvent("event0_success", withValues: nil)
//                        Analytics.logEvent("event0_success", parameters: nil)
//                    }
//                )
//            .screenshotProtected(isProtected: webManager.screenBlock)
//    }
//}
//
//struct SuccessRegistrationView_Previews: PreviewProvider {
//    static var previews: some View {
//        SuccessRegistrationView()
//            .environmentObject(WebViewModel())
//            .environmentObject(UserSettings())
//            .environment(\.locale, .init(identifier: "ru"))
//    }
//}
