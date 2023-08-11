//
//  AnalyticsView.swift
//  QAnalytix
//
//  Created by Lindar Olostur on 11.08.2023.
//

import SwiftUI
//import OneSignal
//import AppsFlyerLib
//import Firebase
//import FirebaseDatabase
//import FirebaseAnalytics
import Combine

struct AnalyticsView: View {
    @EnvironmentObject var userSettings: UserSettings
//    @EnvironmentObject var webManager: WebViewModel
//    var view: MyWebView
    @State private var goToOnboarding1 = false
    @Binding var selectedScreen: Int
    @State var maxWidth = 0.0
    @State var currentValues: [Double] = [79.6, 11.6, 71.5, 66.6, 88.9, 37.1, 18.9, 59.74]
    @State var lastValues: [Double] = [89.4, 11.6, 50.5, 11.1, 90.8, 37.1, 23.3, 44.4]
    @State var widthList: [CGFloat] = [153.56791720569203, -164.0, 115.73997412677875, 92.85640362225092, 197.0, -44.91203104786547, -129.90815006468307, 60.819404915912]
    @State private var goToSettings = false
    var body: some View {
        Color("bg")
            .ignoresSafeArea()
            .overlay(
                VStack {
                    Group {
//                        if webManager.isLoading {
//                            LoaderView(tintColor: Color("blueBTN"), scaleSize: 2.0).padding(.bottom,50)
//                        } else {
//                            if webManager.serverResponse == 1 {
//                                view
//                            } else {
//                                //
//                            }
//                        }
                        VStack {
                            HStack {
                                Text("Analytics")
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
                            VStack {
                                GeometryReader { geometry in
                                    VStack(spacing: 2) {
                                        Spacer()
                                        ScrollView(showsIndicators: false) {
                                            VStack {
                                                CurrencyTracker(image: "EURUSD", text: "EUR/USD", currentVol: currentValues[0], lastVol: lastValues[0], grad1: Color(red: 0.26, green: 0.67, blue: 0.9), grad2: Color(red: 0.09, green: 0.39, blue: 0.97), width: Double(widthList[0]))
                                                CurrencyTracker(image: "GBPJPY", text: "GBP/JPY", currentVol: currentValues[1], lastVol: lastValues[1], grad1: Color(red: 0.85, green: 0.43, blue: 0.43), grad2: Color(red: 0.69, green: 0.03, blue: 0.03), width: Double(widthList[1]))
                                                CurrencyTracker(image: "AUDUSD", text: "AUD/USD", currentVol: currentValues[2], lastVol: lastValues[2], grad1: Color(red: 0.92, green: 0.82, blue: 0.58), grad2: Color(red: 0.71, green: 0.56, blue: 0.02), width: Double(widthList[2]))
                                                CurrencyTracker(image: "EURGBP", text: "EUR/GBP", currentVol: currentValues[3], lastVol: lastValues[3], grad1: Color(red: 0.9, green: 0.26, blue: 0.83), grad2: Color(red: 0.47, green: 0.06, blue: 0.57), width: Double(widthList[3]))
                                                CurrencyTracker(image: "CADCHF", text: "CAD/CHF", currentVol: currentValues[4], lastVol: lastValues[4], grad1: Color(red: 0.4, green: 0.89, blue: 0.86), grad2: Color(red: 0.05, green: 0.6, blue: 0.57), width: Double(widthList[4]))
                                                CurrencyTracker(image: "AUDJPY", text: "AUD/JPY", currentVol: currentValues[5], lastVol: lastValues[5], grad1: Color(red: 0.77, green: 0.89, blue: 0.44), grad2: Color(red: 0.44, green: 0.57, blue: 0.06), width: Double(widthList[5]))
                                                CurrencyTracker(image: "GBPJPY", text: "GBP/JPY", currentVol: currentValues[6], lastVol: lastValues[6], grad1: Color(red: 0.27, green: 0.26, blue: 0.9), grad2: Color(red: 0.15, green: 0.05, blue: 0.73), width: Double(widthList[6]))
                                                CurrencyTracker(image: "USDCAD", text: "USD/CAD", currentVol: currentValues[7], lastVol: lastValues[7], grad1: Color(red: 0.48, green: 0.74, blue: 0.44), grad2: Color(red: 0.12, green: 0.47, blue: 0.04), width: Double(widthList[7]))
                                            }
                                        }
                                        Spacer()
                                    }
                                    .padding(.top, 8)
                                    .onAppear {
                                        maxWidth = geometry.size.width
                                        widthList = calculateWidths(values: currentValues, totalWidth: maxWidth)
                                    }
                                }
                            }
                            Spacer()
                            Button(action: {
                                selectedScreen = 1
                            }) {
                                Text("Click Me").opacity(0)
                            }
                            .buttonStyle(MainButton(text: NSLocalizedString("Сurrency\nHeatwave", comment: ""), img: "btn1"))
                            Button(action: {
                                selectedScreen = 2
                            }) {
                                Text("Click Me").opacity(0)
                            }
                            .buttonStyle(MainButton(text: NSLocalizedString("Gainers/Losers", comment: ""), img: "btn2"))
                            Button(action: {
                                selectedScreen = 3
                            }) {
                                Text("Click Me").opacity(0)
                            }
                            .buttonStyle(MainButton(text: NSLocalizedString("Forex News flow", comment: ""), img: "btn3"))
                            .padding(.bottom)
                        }
                        .padding(.horizontal, 16)
                    }
                }
                    .onAppear {
                        updateTrackers()
                        checkOnboarding()
//                        if webManager.successEnter == false {
//                            webManager.askServer()
//                        }
                    }
                    .onDisappear {
                        userSettings.saveUserToUserDefaults()
                    }
                    .fullScreenCover(isPresented: $goToOnboarding1) {
                        Onboarding1View()
                    }
                    .fullScreenCover(isPresented: $goToSettings) {
                        SettingsView(userSettings: userSettings)
                    }
            )
    }
    func updateTrackers() {
        lastValues = currentValues
        var newList: [Double] = []
        for value in currentValues {
            let action = Int.random(in: 1...3)
            var newValue: Double = 0.0
            
            if action == 1 {
                newValue = value - Double.random(in: 2.0...10.0)
            }
            if action == 2 {
                newValue = value + Double.random(in: 2.0...10.0)
            }
            if action == 3 {
                newValue = value
            }
            if newValue < 1 {
                newValue = 1
            }
            if newValue > 99 {
                newValue = 99
            }
            newList.append(newValue)
        }
        currentValues = newList
        widthList = calculateWidths(values: currentValues, totalWidth: maxWidth)
    }
    func calculateWidths(values: [Double], totalWidth: CGFloat) -> [CGFloat] {
        let minValue = values.min() ?? 0
        let maxValue = values.max() ?? 1
        
        let minWidth: CGFloat = 30.0 // Ваша минимальная ширина
        let maxWidth = totalWidth - 75.0 - 73.0 - 16.0 // Максимальная ширина с учетом коррекций
        
        return values.map { value in
            let scaledValue = (CGFloat(value) - CGFloat(minValue)) / (CGFloat(maxValue) - CGFloat(minValue))
            let unscaledWidth = scaledValue * maxWidth
            return min(maxWidth, max(minWidth, unscaledWidth))
        }
    }

    func checkOnboarding() {
        if userSettings.isOnboardingCompleted == false {
            goToOnboarding1 = true
//            AppsFlyerLib.shared().logEvent("onboarding_start", withValues: nil)
//            Analytics.logEvent("onboarding_start", parameters: nil)
            userSettings.isOnboardingCompleted = true
        }
    }
}

struct AnalyticsView_Previews: PreviewProvider {
    static var previews: some View {
        AnalyticsView(selectedScreen: .constant(0))//view: MyWebView(urlString: "https://fdqfm.bemobtrcks.com/go/2ce4cfd7-2657-480a-a173-d206cf2a313e?clickId=1688194164160-4457247&siteId=app.qxquiz.com"))
            .environmentObject(UserSettings())
//            .environmentObject(WebViewModel())
    }
}
