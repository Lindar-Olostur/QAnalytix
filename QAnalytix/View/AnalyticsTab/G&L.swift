//
//  G&L.swift
//  QAnalytix
//
//  Created by Lindar Olostur on 14.08.2023.
//

import SwiftUI

struct GnLView: View {
    @EnvironmentObject var userSettings: UserSettings
    @State private var tab = 0
    @State var goToSettings = false
    var body: some View {
        Color("bg")
            .ignoresSafeArea()
            .overlay(
                VStack {
                    HStack {
                        Text("Gainers & Losers")
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
                    .padding(.horizontal, 16)
                    HStack {
                        Button(action: {
                            tab = 0
                        }) {
                            Text("Gainers")
                                .customText(style: tab == 0 ? .bold : .regular, size: 14, color: .white)
                            
                            .frame(maxWidth: .infinity)
                            .foregroundColor(tab == 0 ? .white : .gray)
                            .padding(10)
                            .background(tab == 0 ? Color(red: 0.21, green: 0.23, blue: 0.3) : Color(red: 0.51, green: 0.54, blue: 0.66))
                            .cornerRadius(10)
                        }
                        Button(action: {
                            tab = 1
                        }) {
                            Text("Losers")
                                .customText(style: tab == 1 ? .bold : .regular, size: 14, color: .white)
                                .frame(maxWidth: .infinity)
                                .foregroundColor(tab == 1 ? .white : .gray)
                                .padding(10)
                                .background(tab == 1 ? Color(red: 0.21, green: 0.23, blue: 0.3) : Color(red: 0.51, green: 0.54, blue: 0.66))
                                .cornerRadius(10)
                        }
                    }
                    .padding(2)
                    .background(Color(red: 0.51, green: 0.54, blue: 0.66))
                    .clipShape(RoundedRectangle(cornerRadius: 10))
                    .padding()
                    
                    VStack {
                        VStack {
                            if tab == 0 {
                                VStack {
                                    ScrollView(showsIndicators: false) {
                                        VStack {
                                            ForEach(userSettings.gainers.sorted(by: { $0.money > $1.money }), id: \.self) { user in
                                                GnLRow(portrait: user.portrait, isGainer: user.isGainer, name: user.name, isMale: user.isMale, pair: user.pair, flags: user.flags, money: user.money, percent: user.percent)
                                                HStack {
                                                    Spacer().frame(width: 59)
                                                    Rectangle()
                                                        .frame(height: 2)
                                                        .foregroundColor(Color(red: 0.21, green: 0.23, blue: 0.3).opacity(0.4))
                                                }
                                                .padding(.top, 4)
                                                .padding(.bottom, 8)
                                            }
                                        }
                                    }
                                }
                                .padding()
                            }
                            
                            if tab == 1 {
                                VStack {
                                    ScrollView(showsIndicators: false) {
                                        VStack {
                                            ForEach(userSettings.losers.sorted(by: { $0.money > $1.money }), id: \.self) { user in
                                                GnLRow(portrait: user.portrait, isGainer: user.isGainer, name: user.name, isMale: user.isMale, pair: user.pair, flags: user.flags, money: user.money, percent: user.percent)
                                                HStack {
                                                    Spacer().frame(width: 59)
                                                    Rectangle()
                                                        .frame(height: 2)
                                                        .foregroundColor(Color(red: 0.21, green: 0.23, blue: 0.3).opacity(0.4))
                                                }
                                                .padding(.top, 4)
                                                .padding(.bottom, 8)
                                            }
                                        }
                                    }
                                }
                                .padding()
                            }
                        }
                    }
                }
                    .fullScreenCover(isPresented: $goToSettings) {
                        SettingsView(userSettings: userSettings)
                    }
            )
    }
    //            .onDisappear {
    //                userSettings.saveUserToUserDefaults()
    //            }
}

struct GnLView_Previews: PreviewProvider {
    static var previews: some View {
        GnLView().environmentObject(UserSettings())
        //.environment(\.locale, .init(identifier: "ar"))
    }
}
