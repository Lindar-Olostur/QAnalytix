////
////  
//  PushEvent2View..swift
//  QAnalytix
//
//  Created by Lindar Olostur on 11.08.2023.
//
////
//
//import SwiftUI
//import AppsFlyerLib
//import Firebase
//import FirebaseAnalytics
//import ScreenshotPreventingSwiftUI
//
//struct PushEvent2View_: View {
//    @EnvironmentObject var webManager: WebViewModel
//    @EnvironmentObject var userSettings: UserSettings
//    @State private var shoeTabFromPush = false
//    var body: some View {
//        Color("bg")
//            .ignoresSafeArea()
//            .overlay(
//                VStack(alignment: .center) {
////                    Spacer()
////                    Image("stonks")
////                        .resizable()
////                        .frame(width: 100, height: 84)
////                    Text("Already 343 568 users have registered and are earning right now")
////                        .multilineTextAlignment(.center)
////                        .font(.custom("Manrope-Bold", size: 24))
////                        .foregroundColor(.white)
////                        .padding(.top, 25)
////                        .padding(.bottom, 1)
////                        .padding(.horizontal)
//                    Spacer()
//                    Button {
//                        webManager.view = MyWebView(urlString: "https://qxbroker.com/\(getSystemLanguage())/deposit")
//                        shoeTabFromPush.toggle()
//                    } label: {
//                        Text("Next")
//                            .font(.custom("Manrope-Bold", size: 16))
//                            .foregroundColor(.white)
//                    }
//                    .buttonStyle(BigButton(backgroundColor: Color("blueBTN")))
//                }
//                    .onAppear {
//                        AppsFlyerLib.shared().logEvent("push_event2_opened", withValues: nil)
//                        Analytics.logEvent("push_event2_opened", parameters: nil)
//                    }
//                    .fullScreenCover(isPresented: $shoeTabFromPush) {
//                        NewTabView()
//                    }
//                )
//            .screenshotProtected(isProtected: webManager.screenBlock)
//    }
//    func getSystemLanguage() -> String {
//            let locale = Locale.current
//            let languageCode = locale.languageCode ?? ""
//            return languageCode
//        }
//}
//
//struct PushEvent2View__Previews: PreviewProvider {
//    static var previews: some View {
//        PushEvent2View_()
//            .environmentObject(UserSettings())
//            .environmentObject(WebViewModel())
//            .environment(\.locale, .init(identifier: "ru"))
//    }
//}
