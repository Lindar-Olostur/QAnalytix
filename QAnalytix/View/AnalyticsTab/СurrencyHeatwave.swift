//
//  СurrencyHeatwave.swift
//  QAnalytix
//
//  Created by Lindar Olostur on 13.08.2023.
//

import SwiftUI

struct СurrencyHeatwave: View {
    @Environment(\.presentationMode) var presentationMode
    @EnvironmentObject var userSettings: UserSettings
    @State private var goToSettings = false
    @Binding var selectedScreen: Int
    //    @EnvironmentObject var webManager: WebViewModel
    var body: some View {
        Color("bg")
            .ignoresSafeArea()
            .overlay(
                VStack {
                    HStack {
                        Text("Сurrency  Heatwave")
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
                            HStack(spacing: 17) {
                                HeatwaveMeter(image: "EURUSD", text: "EUR/USD")
                                HeatwaveMeter(image: "USDJPY", text: "USD/JPY")
                            }.padding(.bottom, 10)
                            HStack(spacing: 17) {
                                HeatwaveMeter(image: "GBPUSD", text: "GBP/USD")
                                HeatwaveMeter(image: "EURAUD", text: "EUR/AUD")
                            }.padding(.bottom, 10)
                            HStack(spacing: 17) {
                                HeatwaveMeter(image: "AUDUSD", text: "AUD/USD")
                                HeatwaveMeter(image: "CADCHF", text: "CAD/CHF")
                            }.padding(.bottom, 10)
                            HStack(spacing: 17) {
                                HeatwaveMeter(image: "GBPJPY", text: "GBP/JPY")
                                HeatwaveMeter(image: "AUDJPY", text: "AUD/JPY")
                            }.padding(.bottom, 10)
                        }
                    }
                    Button {
                    selectedScreen = 0
                    } label: {
                        Text("Back")
                            .foregroundColor(.white)
                    }
                    .buttonStyle(BigButton(backgroundColor: Color("blueBTN")))
                }
                    .padding(16)
                    .fullScreenCover(isPresented: $goToSettings) {
                        SettingsView(userSettings: userSettings)
                    }
            )
    }
}

struct СurrencyHeatwave_Previews: PreviewProvider {
    static var previews: some View {
        СurrencyHeatwave(selectedScreen: .constant(1))
            .environmentObject(UserSettings())
        //            .environmentObject(WebViewModel())
    }
}
