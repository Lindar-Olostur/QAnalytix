//
//  Onboarding3View.swift
//  QAnalytix
//
//  Created by Lindar Olostur on 11.08.2023.
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
                ZStack {
                    VStack(alignment: .leading) {
                        Text("Use the signals")
                            .customText(style: .bold, size: 24, color: .white)
                            .padding(.top, 42)
                        Text("How much time are you willing to devote to learning how to trade ?")
                            .customText(style: .medium, size: 16, color: Color("grayText"))
                        Spacer()
                        HStack {
                            Spacer()
                            ZStack {
                                Image("phone1")
                                    .resizable()
                                    .aspectRatio(contentMode: .fit)
                                Image("phone2")
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
                            showAlert = true
                            //                        OneSignal.promptForPushNotifications(userResponse: { accepted in
                            //                            print("User accepted notification: \(accepted)")
                            //                            goToOnboarding4 = true
                            //                        })
                        } label: {
                            Text("Continue")
                                .foregroundColor(.white)
                        }
                        .buttonStyle(BigButton(backgroundColor: Color("blueBTN")))
                        .padding(.bottom, 40)
                    }
                }
                    .padding(.horizontal, 16)
                    .fullScreenCover(isPresented: $goToOnboarding4) {
                        Onboarding4View()
                    }
                    .alert(isPresented: $showAlert) {
                        Alert(
                            title: Text("'Q Analytix' would like to Send You Notifications"),
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
            .environment(\.locale, .init(identifier: "ru"))
    }
}
