//
//  News.swift
//  QAnalytix
//
//  Created by Lindar Olostur on 13.08.2023.
//

import SwiftUI
import WebKit
//import OneSignal
//import AppsFlyerLib
//import Firebase
//import FirebaseDatabase
//import FirebaseAnalytics

struct NewsView: View {
    @Environment(\.presentationMode) var presentationMode
    @EnvironmentObject var userSettings: UserSettings
    @State private var goToSettings = false
    var view: MyWidgetWebView
    //    @EnvironmentObject var webManager: WebViewModel
    var body: some View {
        Color("bg")
            .ignoresSafeArea()
            .overlay(
                VStack {
                    HStack {
                        Text("News")
                            .customText(style: .bold, size: 24, color: .white)
                        Spacer()
                        Button {
                            goToSettings.toggle()
                        } label: {
                            Image("gear")
                                .resizable()
                                .scaledToFit()
                                .frame(width: 24, height: 24)
                        }
                    }
                    .padding(16)
                    view
                }
                    .fullScreenCover(isPresented: $goToSettings) {
                        SettingsView(userSettings: userSettings)
                    }
            )
    }
}

struct NewsView_Previews: PreviewProvider {
    static var previews: some View {
        MyWidgetWebView(htmlString: """
                                <!-- TradingView Widget BEGIN -->
                                <div class="tradingview-widget-container">
                                  <div class="tradingview-widget-container__widget"></div>
                                  <div class="tradingview-widget-copyright"><a href="https://www.tradingview.com/" rel="noopener nofollow" target="_blank"><span class="blue-text">Track all markets on TradingView</span></a></div>
                                  <script type="text/javascript" src="https://s3.tradingview.com/external-embedding/embed-widget-timeline.js" async>
                                  {
                                  "feedMode": "all_symbols",
                                  "colorTheme": "dark",
                                  "isTransparent": true,
                                  "displayMode": "regular",
                                  "width": "100%",
                                  "height": "100%",
                                  "locale": "en"
                                }
                                  </script>
                                </div>
                                <!-- TradingView Widget END -->
                            """)
//        NewsView(view: NewsWebView(htmlString: """
//                                <!-- TradingView Widget BEGIN -->
//                                <div class="tradingview-widget-container">
//                                  <div class="tradingview-widget-container__widget"></div>
//                                  <div class="tradingview-widget-copyright"><a href="https://www.tradingview.com/" rel="noopener nofollow" target="_blank"><span class="blue-text">Track all markets on TradingView</span></a></div>
//                                  <script type="text/javascript" src="https://s3.tradingview.com/external-embedding/embed-widget-timeline.js" async>
//                                  {
//                                  "feedMode": "all_symbols",
//                                  "colorTheme": "dark",
//                                  "isTransparent": true,
//                                  "displayMode": "regular",
//                                  "width": "100%",
//                                  "height": "100%",
//                                  "locale": "en"
//                                }
//                                  </script>
//                                </div>
//                                <!-- TradingView Widget END -->
//                            """))
            .environmentObject(UserSettings())
        //            .environmentObject(WebViewModel())
    }
}
