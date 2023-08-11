//
//  PushEvent1View.swift
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
struct PushEvent1View: View {
    @EnvironmentObject var userSettings: UserSettings
    //    @EnvironmentObject var webManager: WebViewModel
    @Environment(\.presentationMode) var presentationMode
    let backgroundGradient = LinearGradient(
        gradient: Gradient(colors: [Color("bg"), Color("bg1")]),
        startPoint: .top, endPoint: .bottom)
    var body: some View {
        backgroundGradient
            .ignoresSafeArea()
            .overlay(
                ZStack {
                    VStack(alignment: .center) {
                        VStack {
                            Text("Already").foregroundColor(Color.white) +
                            Text(" 343 568 ").foregroundColor(Color(red: 0.43, green: 0.54, blue: 0.93)) +
                            Text("users have registered and are earning right now").foregroundColor(Color.white)
                        }
                        .customText(style: .bold, size: 24, color: .white)
                        .padding(.top, 16)
                        Spacer()
                        HStack(alignment: .top, spacing: 10) {
                            VStack {
                                HStack {
                                    Image("kumar")
                                    .resizable()
                                    .aspectRatio(contentMode: .fill)
                                    .frame(width: 50, height: 50)
                                    VStack {
                                        Text("Kumar").customText(style: .bold, size: 18, color: .white)
                                        Text("Trader").customText(style: .regular, size: 16, color: Color(red: 0.43, green: 0.54, blue: 0.93))
                                    }
                                    Spacer()
                                }
                                .padding(.bottom, 20)
                                ZStack {
                                    Rectangle()
                                    .foregroundColor(.clear)
                                    .frame(width: .infinity, height: 4)
                                    .background(Color(red: 0.85, green: 0.85, blue: 0.85))
                                    .cornerRadius(4)
                                    HStack {
                                        Spacer()
                                        Rectangle()
                                            .foregroundColor(.clear)
                                            .frame(width: 61, height: 4)
                                            .background(Color(red: 0.85, green: 0.85, blue: 0.85))
                                            .cornerRadius(4)
                                            .rotationEffect(Angle(degrees: -90))
                                            .offset(x: 5, y: 38)
                                    }
                                    HStack {
                                        VStack {
                                            VStack(alignment: .leading, spacing: 3) {
                                                Text("Deposit")
                                                    .multilineTextAlignment(.center)
                                                    .customText(style: .regular, size: 14, color: .white)
                                                Text("$250")
                                                    .multilineTextAlignment(.center)
                                                    .customText(style: .bold, size: 24, color: Color(red: 0.43, green: 0.54, blue: 0.93))
                                            }
                                        }
                                        .padding(12)
                                        .background(Color(red: 0.28, green: 0.33, blue: 0.43))
                                        .cornerRadius(7)
                                        Spacer()
                                        VStack {
                                            VStack() {
                                                Text("Buy")
                                                    .customText(style: .regular, size: 14, color: .white)
                                                    .multilineTextAlignment(.center)
                                            }
                                            .padding(5)
                                            .padding(.horizontal, 6)
                                        }
                                        .background(Color(red: 0.36, green: 0.8, blue: 0.32))
                                        .cornerRadius(15)
                                    }
                                }
                                ZStack {
                                    HStack {
                                        Rectangle()
                                            .foregroundColor(.clear)
                                            .frame(width: .infinity, height: 4)
                                            .background(Color(red: 0.85, green: 0.85, blue: 0.85))
                                        .cornerRadius(4)
                                    }.padding(.horizontal, 13)
                                    HStack {
                                        VStack {
                                            VStack {
                                                Text("Sell")
                                                    .customText(style: .regular, size: 14, color: .white)
                                                    .multilineTextAlignment(.center)
                                            }
                                            .padding(5)
                                            .padding(.horizontal, 6)
                                        }
                                        .background(Color(red: 0.86, green: 0.04, blue: 0.2))
                                        .cornerRadius(15)
                                        .padding(3)
                                        Spacer()
                                        VStack {
                                            VStack {
                                                Text("Sell")
                                                    .customText(style: .regular, size: 14, color: .white)
                                                    .multilineTextAlignment(.center)
                                            }
                                            .padding(5)
                                            .padding(.horizontal, 6)
                                        }
                                        .background(Color(red: 0.86, green: 0.04, blue: 0.2))
                                        .cornerRadius(15)
                                        .padding(3)
                                    }
                                    .padding(.vertical, 18)
                                }
                                ZStack {
                                    Rectangle()
                                    .foregroundColor(.clear)
                                    .frame(width: .infinity, height: 4)
                                    .background(Color(red: 0.85, green: 0.85, blue: 0.85))
                                    .cornerRadius(4)
                                    HStack {
                                        Rectangle()
                                            .foregroundColor(.clear)
                                            .frame(width: 61, height: 4)
                                            .background(Color(red: 0.85, green: 0.85, blue: 0.85))
                                            .cornerRadius(4)
                                            .rotationEffect(Angle(degrees: -90))
                                            .offset(x: -5, y: -38)
                                        Spacer()
                                    }
                                    HStack {
                                        VStack {
                                            VStack() {
                                                Text("Buy")
                                                    .customText(style: .regular, size: 14, color: .white)
                                                    .multilineTextAlignment(.center)
                                            }
                                            .padding(5)
                                            .padding(.horizontal, 6)
                                        }
                                        .background(Color(red: 0.36, green: 0.8, blue: 0.32))
                                        .cornerRadius(15)
                                        Spacer()
                                        VStack {
                                            VStack(alignment: .leading, spacing: 3) {
                                                Text("Profit")
                                                    .multilineTextAlignment(.center)
                                                    .customText(style: .regular, size: 14, color: .white)
                                                Text("$1000")
                                                    .multilineTextAlignment(.center)
                                                    .customText(style: .bold, size: 24, color: Color(red: 0.43, green: 0.54, blue: 0.93))
                                            }
                                        }
                                        .padding(12)
                                        .background(Color(red: 0.28, green: 0.33, blue: 0.43))
                                        .cornerRadius(7)
                                    }
                                }
                            }
                        }
                        .padding(.horizontal, 32)
                        .padding(.vertical, 20)
                        .background(Color(red: 0.21, green: 0.23, blue: 0.3))
                        .cornerRadius(8)
                        .frame(width: 260, height: 300)
                        
                        Spacer()
                        Button {
                            userSettings.selectedTab = 0
                            self.presentationMode.wrappedValue.dismiss()
                        } label: {
                            Text("Continue")
                        }
                        .buttonStyle(BigButton(backgroundColor: Color("blueBTN")))
                        .padding(.bottom, 34)
                    }
                    .padding(16)
                }
                //                    .onAppear {
                //                        AppsFlyerLib.shared().logEvent("push_event1_opened", withValues: nil)
                //                        Analytics.logEvent("push_event1_opened", parameters: nil)
                //                    }
            )
        //            .screenshotProtected(isProtected: webManager.screenBlock)
    }
}

struct PushEvent1View_Previews: PreviewProvider {
    static var previews: some View {
        PushEvent1View()
        //            .environmentObject(WebViewModel())
            .environmentObject(UserSettings())
            .environment(\.locale, .init(identifier: "ru"))
    }
}
