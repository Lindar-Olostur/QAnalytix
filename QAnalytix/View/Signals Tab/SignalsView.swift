//
//  SignalsView.swift
//  QAnalytix
//
//  Created by Lindar Olostur on 12.08.2023.
//

import SwiftUI

struct SignalsView: View {
    @Environment(\.presentationMode) var presentationMode
    @EnvironmentObject var userSettings: UserSettings
    @State private var goToSettings = false
    @State private var angleList = [0.0, 68.0, 108.0, 160.0, 210.0, 250.0, 296.0]
    @State private var redArrowAngle: Double = 0
    @State private var greenArrowAngle: Double = 180
    @State private var hot1 = ""
    @State private var hot2 = ""
    @State private var isSpinning = false
    @State private var spinningFinished = false
    @State private var animationDuration = 2.0
    @State private var progress = 0
    @State private var isRouletteHidden = false
    //    @EnvironmentObject var webManager: WebViewModel
    var body: some View {
        Color("bg")
            .ignoresSafeArea()
            .overlay(
                VStack {
                    HStack {
                        Text("Signals")
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
                    .padding(.bottom)
                    ScrollView(showsIndicators: false) {
                        VStack {
                            if isRouletteHidden {
                                VStack {
                                    Spacer()
                                    VStack {
                                        ForEach(userSettings.signals.sorted(by: { $0.time < $1.time })) { signal in
                                            SignalRow(pair: signal.pair, flags: signal.flags, time: signal.time, isSell: signal.isSell)
                                        }
                                    }
                                    Spacer()
                                    Button {
                                        isRouletteHidden.toggle()
                                    } label: {
                                        Text("Back")
                                            .foregroundColor(.white)
                                    }
                                    .buttonStyle(BigButton(backgroundColor: Color("blueBTN")))
                                    .padding(.top, 20)
                                }
                            } else {
                                VStack {
                                    Spacer()
                                    HStack {
                                        Spacer()
                                        ZStack {
                                            Image("roulette")
                                                .resizable()
                                                .scaledToFit()
                                                .frame(maxWidth: 342)
                                                .padding()
                                            Image("dot2")
                                                .resizable()
                                                .scaledToFit()
                                                .frame(maxHeight: 60)
                                                .padding()
                                            Image("arrowRed")
                                                .resizable()
                                                .scaledToFit()
                                                .frame(maxHeight: 95)
                                                .rotationEffect(.degrees(redArrowAngle), anchor: .bottom)
                                                .offset(y: -45)
                                            Image("arrowGreen")
                                                .resizable()
                                                .scaledToFit()
                                                .frame(maxHeight: 95)
                                                .rotationEffect(.degrees(greenArrowAngle), anchor: .bottom)
                                                .offset(y: -45)
                                            Image("dot1")
                                                .resizable()
                                                .scaledToFit()
                                                .frame(maxHeight: 40)
                                                .padding()
                                        }
                                        Spacer()
                                    }
                                    Spacer()
                                    if isSpinning != true {
                                        VStack {
                                            if spinningFinished {
                                                VStack {
                                                    SignalRow(pair: hot2, flags: hot2.replacingOccurrences(of: "/", with: ""), time: randomDateFromNow(), isSell: false)
                                                    SignalRow(pair: hot1, flags: hot1.replacingOccurrences(of: "/", with: ""), time: randomDateFromNow(), isSell: true)
                                                }
                                                .padding(.bottom, 20)
                                            }
                                            Button {
                                                spinningFinished = false
                                                spinning()
                                            } label: {
                                                Text("Hot signal")
                                                    .foregroundColor(.white)
                                            }
                                            .buttonStyle(BigButton(backgroundColor: Color("blueBTN")))
                                            Text("Or")
                                                .customText(style: .regular, size: 16, color: .white)
                                            Button {
                                                isRouletteHidden.toggle()
                                            } label: {
                                                Text("Today signals")
                                                    .foregroundColor(.white)
                                            }
                                            .buttonStyle(BigButton(backgroundColor: Color("blueBTN")))
                                        }
                                    } else {
                                        RingWithAnimatedProgress(animationDuration: $animationDuration, progress: $progress)
                                            .frame(width: 156, height: 158)
                                    }
                                    Spacer()
                                }
                            }
                        }
                    }
                }
                    .padding(16)
                    .fullScreenCover(isPresented: $goToSettings) {
                        SettingsView(userSettings: userSettings)
                    }
            )
    }
    func spinning() {
        let count = Int.random(in: 5...10)
        let currentList = angleList.shuffled()
        redArrowAngle = currentList.first ?? 0.0
        greenArrowAngle = currentList.last ?? 0.0
        hot1 = getHot(angle: redArrowAngle)
        hot2 = getHot(angle: greenArrowAngle)
        isSpinning = true
        var currentProgress = 0
        _ = Timer.scheduledTimer(withTimeInterval: 0.15, repeats: true) { timer in
            currentProgress += 1
            progress = currentProgress
            
            if currentProgress >= 13 {
                timer.invalidate()
                isSpinning = false
                progress = 0
                spinningFinished = true
            }
        }
        withAnimation(
            Animation.timingCurve(0, 0, 0.2, 1, duration: 2)
        ) {
            redArrowAngle += 360 * Double(count)
            greenArrowAngle += 360 * Double(count)
        }
        
    }
    func getHot(angle: Double) -> String {
        switch angle {
        case 0.0:
            return "EUR/USD"
        case 68.0:
            return "GBP/JPY"
        case 108.0:
            return "AUD/USD"
        case 160.0:
            return "EUR/GBP"
        case 210.0:
            return "GBP/CHF"
        case 250.0:
            return "CAD/CHF"
        case 296.0:
            return "AUD/JPY"
        default:
            return "EUR/USD"
        }
    }
    func randomDateFromNow() -> Date {
        let currentTime = Date()
        let randomMinutes = Int.random(in: 5...60)
        let newDate = Calendar.current.date(byAdding: .minute, value: randomMinutes, to: currentTime) ?? currentTime
        return newDate
    }
}

struct SignalsView_Previews: PreviewProvider {
    static var previews: some View {
        SignalsView().environmentObject(UserSettings())
        //.environment(\.locale, .init(identifier: "ar"))
    }
}
