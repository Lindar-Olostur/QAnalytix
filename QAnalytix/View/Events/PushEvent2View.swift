//
//  PushEvent2View.swift
//  QAnalytix
//
//  Created by Lindar Olostur on 17.08.2023.
//

import SwiftUI
//import AppsFlyerLib
//import Firebase
//import FirebaseAnalytics
//import ScreenshotPreventingSwiftUI
//
struct PushEvent2View_: View {
    //    @EnvironmentObject var webManager: WebViewModel
    @EnvironmentObject var userSettings: UserSettings
    @State private var shoeTabFromPush = false
    let backgroundGradient = LinearGradient(
        gradient: Gradient(colors: [Color("bg"), Color("bg1")]),
        startPoint: .top, endPoint: .bottom)
    var body: some View {
        backgroundGradient
            .ignoresSafeArea()
            .overlay(
                ZStack {
                    VStack(alignment: .center) {
                        Text("Congratulations!\nYour demo account is growing. Start earning from your first deposit now")
                            .customText(style: .bold, size: 24, color: .white)
                            .padding(.top, 42)
                        Spacer()
                        Image("stonks")
                            .resizable()
                            .frame(width: 213, height: 176)
                        Spacer()
                        Button {
//                            webManager.view = MyWebView(urlString: "https://qxbroker.com/\(getSystemLanguage())/deposit")
                            shoeTabFromPush.toggle()
                        } label: {
                            Text("Continue")
                        }
                        .buttonStyle(BigButton(backgroundColor: Color("blueBTN")))
                        
                        .padding(.bottom, 34)
                    }
                    .padding(.horizontal, 16)
                }
                //                    .onAppear {
                //                        AppsFlyerLib.shared().logEvent("push_event2_opened", withValues: nil)
                //                        Analytics.logEvent("push_event2_opened", parameters: nil)
                //                    }
                //                    .fullScreenCover(isPresented: $shoeTabFromPush) {
                //                        NewTabView()
                //                    }
            )
        //            .screenshotProtected(isProtected: webManager.screenBlock)
    }
    //    func getSystemLanguage() -> String {
    //            let locale = Locale.current
    //            let languageCode = locale.languageCode ?? ""
    //            return languageCode
    //        }
}
//
struct PushEvent2View__Previews: PreviewProvider {
    static var previews: some View {
        PushEvent2View_()
            .environmentObject(UserSettings())
        //            .environmentObject(WebViewModel())
            .environment(\.locale, .init(identifier: "ru"))
    }
}
