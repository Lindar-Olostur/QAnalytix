//
//  WidgetWebView.swift
//  QAnalytix
//
//  Created by Lindar Olostur on 16.08.2023.
//

import SwiftUI
import WebKit

struct WidgetWebView: UIViewRepresentable {
    typealias UIViewType = WKWebView
    let webView: WKWebView

    init(htmlString: String) {
        let configuration = WKWebViewConfiguration()
        let script = "var script = document.createElement('meta'); script.name = 'viewport'; script.content = 'width=device-width, initial-scale=1.0, maximum-scale=1.0, user-scalable=no'; document.head.appendChild(script);"
        let userScript = WKUserScript(source: script, injectionTime: .atDocumentEnd, forMainFrameOnly: true)
        configuration.userContentController.addUserScript(userScript)

        webView = WKWebView(frame: .zero, configuration: configuration)
        webView.loadHTMLString(htmlString, baseURL: nil)
    }
    
    func makeUIView(context: Context) -> WKWebView {
        webView.isOpaque = false
        webView.backgroundColor = .clear
        return webView
    }
    
    func updateUIView(_ uiView: WKWebView, context: Context) {
    }
    
    func goBack() {
        webView.goBack()
    }
    
    func refresh() {
        webView.reload()
    }
}


struct MyWidgetWebView: View {
    let webView: WidgetWebView
    @State var htmlString: String = ""
    
    init(htmlString: String) {
        webView = WidgetWebView(htmlString: htmlString)
    }
    
    var body: some View {
        VStack {
//            HStack {
//                Button(action: {
//                    webView.goBack()
//                }) {
//                    Image(systemName: "chevron.left")
//                        .font(.system(size: 20))
//                        .font(.title)
//                        .foregroundColor(.white)
//                        .padding()
//                }.padding(.horizontal)
//                Spacer()
////                Button(action: {
////                    webView.goHome()
////                }) {
////                    Image(systemName: "house.fill")
////                        .font(.title)
////                        .foregroundColor(.blue)
////                        .padding()
////                }
////                Spacer()
//                Button(action: {
//                    webView.refresh()
//                    print(htmlString)
//                }) {
//                    Image(systemName: "arrow.clockwise")
//                        .font(.system(size: 20))
//                        .font(.title)
//                        .foregroundColor(.white)
//                        .padding()
//                }.padding(.horizontal)
////                Spacer()
////                Button(action: {
////                    webView.goForward()
////                }) {
////                    Image(systemName: "arrowtriangle.right.fill")
////                        .font(.title)
////                        .foregroundColor(.blue)
////                        .padding()
////                }
//            }
//            .padding(.vertical, -8)
            webView.background(Color.clear)
                .padding(-10)
                .onReceive(webView.webView.publisher(for: \.url), perform: { newURL in
                    if let newURL = newURL {
                        htmlString = newURL.absoluteString
                    }
                })
        }
    }
}


struct MyWidgetWebView_Previews: PreviewProvider {
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
    }
}
