////
////  
//  PushSubEventView.swift
//  QAnalytix
//
//  Created by Lindar Olostur on 11.08.2023.
//
////
//
//import SwiftUI
//import OneSignal
//import AppsFlyerLib
//import Firebase
//import FirebaseAnalytics
//import ScreenshotPreventingSwiftUI
//
//struct PushSubEventView: View {
//    @Environment(\.presentationMode) var presentationMode
//    @EnvironmentObject var webManager: WebViewModel
//    var body: some View {
//        Color("bg")
//            .ignoresSafeArea()
//            .overlay(
//                VStack {
////                    Spacer()
////                    Rectangle()
////                      .foregroundColor(.clear)
////                      .frame(width: 181.9086, height: 46.69892)
////                      .background(Color(red: 0.24, green: 0.26, blue: 0.31))
////                      .cornerRadius(10.86021)
////                      .overlay(
////                        HStack {
////                            VStack(spacing: 3) {
////                                Text("AUD/USD")
////                                    .font(.custom("Outfit-SemiBold", size: 10))
////                                  .multilineTextAlignment(.center)
////                              .foregroundColor(.white)
////                                HStack {
////                                    Image(systemName: "arrow.up")
////                                        .foregroundColor(Color("AccentSuccess"))
////                                        .font(.system(size: 13))
////                                      .offset(x: 4)
////                                    Text("Buy 1m")
////                                        .font(.custom("Outfit-Regular", size: 10))
////                                      .multilineTextAlignment(.center)
////                                      .foregroundColor(.white)
////                                }
////                            }
////                            Spacer()
////                            VStack {
////                                Text("1m ago")
////                                    .font(.custom("Outfit-Regular", size: 10))
////                                  .multilineTextAlignment(.trailing)
////                              .foregroundColor(.white)
////                                Spacer()
////                            }
////                            .padding(.vertical, 8)
////                            .padding(.horizontal, 5)
////                        }
////                            .padding(.horizontal, 8)
////                      )
////                    VStack {
////                        Rectangle()
////                          .foregroundColor(.clear)
////                          .frame(width: 181.9086, height: 46.69892)
////                          .background(Color(red: 0.24, green: 0.26, blue: 0.31))
////                          .cornerRadius(10.86021)
////                          .overlay(
////                            HStack {
////                                VStack(spacing: 3) {
////                                    Text("EUR/USD")
////                                      .font(
////                                        Font.custom("Outfit", size: 9.77419)
////                                          .weight(.bold)
////                                      )
////                                      .multilineTextAlignment(.center)
////                                  .foregroundColor(.white)
////                                    HStack {
////                                        Image(systemName: "arrow.down")
////                                            .foregroundColor(Color("AccentNegative"))
////                                          .font(.system(size: 13))
////                                          .offset(x: 4)
////                                        Text("Buy 1m")
////                                          .font(Font.custom("Outfit", size: 9.77419))
////                                          .multilineTextAlignment(.center)
////                                          .foregroundColor(.white)
////                                    }
////                                }
////                                Spacer()
////                                VStack {
////                                    Text("1m ago")
////                                      .font(Font.custom("Outfit", size: 9.77419))
////                                      .multilineTextAlignment(.trailing)
////                                  .foregroundColor(.white)
////                                    Spacer()
////                                }
////                                .padding(.vertical, 8)
////                                .padding(.horizontal, 5)
////                            }
////                                .padding(.horizontal, 8)
////                          )
////                    }
////                    Text("Don't miss your chance to make money!")
////                        .multilineTextAlignment(.center)
////                        .font(.custom("Manrope-Bold", size: 24))
////                        .foregroundColor(.white)
////                        .padding(.top, 25)
////                        .padding(.bottom, 1)
////                    Text("Turn on push notifications for more efficient use of push notifications")
////                        .multilineTextAlignment(.center)
////                        .font(.custom("Manrope-Regular", size: 18))
////                        .foregroundColor(Color(red: 0.58, green: 0.58, blue: 0.66))
//                    Spacer()
//                    Button {
//                        if let appSettingsURL = URL(string: UIApplication.openSettingsURLString) {
//                            UIApplication.shared.open(appSettingsURL, options: [:], completionHandler: nil)
//                        }
//                        self.presentationMode.wrappedValue.dismiss()
//                    } label: {
//                        Text("Next")
//                            .customFont()
//                            .foregroundColor(.white)
//                    }
//                    .buttonStyle(BigButton(backgroundColor: Color("blueBTN")))
//                }
//                    .onAppear {
//                        AppsFlyerLib.shared().logEvent("push_sub_opened", withValues: nil)
//                        Analytics.logEvent("push_sub_opened", parameters: nil)
//                    }
//                )
//            .screenshotProtected(isProtected: webManager.screenBlock)
//    }
//}
//
//struct PushSubEventView_Previews: PreviewProvider {
//    static var previews: some View {
//        PushSubEventView()
//            .environmentObject(WebViewModel())
//            .environment(\.locale, .init(identifier: "ar"))
//    }
//}
