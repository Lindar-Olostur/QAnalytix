////
////  
//  PushEvent1View.swift
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
//struct PushEvent1View: View {
//    @EnvironmentObject var userSettings: UserSettings
//    @EnvironmentObject var webManager: WebViewModel
//    @Environment(\.presentationMode) var presentationMode
//    var body: some View {
//        Color("bg")
//            .ignoresSafeArea()
//            .overlay(
//                VStack(alignment: .center) {
////                    Spacer()
////
////                    VStack {
////                        ZStack {
////                            Rectangle()
////                              .foregroundColor(.clear)
////                              .frame(width: 41, height: 2)
////                              .background(Color(red: 0.85, green: 0.85, blue: 0.85))
////                              .cornerRadius(2)
////                            Rectangle()
////                              .foregroundColor(.clear)
////                              .frame(width: 41, height: 2)
////                              .background(Color(red: 0.85, green: 0.85, blue: 0.85))
////                              .cornerRadius(2)
////                              .rotationEffect(Angle(degrees: -90))
////                              .offset(x: 40, y: 24)
////                            HStack {
////                                VStack {
////                                    VStack(alignment: .leading, spacing: 3) {
////                                        Text("Deposit")
////                                          .font(
////                                            Font.custom("Outfit", size: 6.77419)
////                                          )
////                                          .multilineTextAlignment(.center)
////                                      .foregroundColor(.white)
////                                        Text("$250")
////                                          .font(
////                                            Font.custom("Outfit", size: 12.5).weight(.bold)
////                                          )
////                                          .multilineTextAlignment(.center)
////                                      .foregroundColor(Color(red: 0.21, green: 0.71, blue: 0.47))
////                                    }
////                                    .padding(7)
////                                }
////                                .background(Color(red: 0.28, green: 0.33, blue: 0.43))
////                                .cornerRadius(7)
////                                .offset(x: -10)
////
////                                VStack {
////                                    VStack() {
////                                        Text("Buy")
////                                          .font(
////                                            Font.custom("Outfit", size: 9.5)
////                                          )
////                                          .multilineTextAlignment(.center)
////                                      .foregroundColor(.white)
////                                    }
////                                    .padding(5)
////                                    .padding(.horizontal, 6)
////                                }
////                                .background(Color(red: 0.21, green: 0.71, blue: 0.47))
////                                .cornerRadius(15)
////                            }
////                        }
////                        ZStack {
////                            Rectangle()
////                              .foregroundColor(.clear)
////                              .frame(width: 80, height: 2)
////                              .background(Color(red: 0.85, green: 0.85, blue: 0.85))
////                              .cornerRadius(2)
////                            VStack {
////                                VStack {
////                                    Text("Sell")
////                                      .font(
////                                        Font.custom("Outfit", size: 9.5)
////                                      )
////                                      .multilineTextAlignment(.center)
////                                  .foregroundColor(.white)
////                                }
////                                .padding(5)
////                                .padding(.horizontal, 6)
////                            }
////                            .background(Color(red: 0.86, green: 0.04, blue: 0.2))
////                            .cornerRadius(15)
////                        .padding(3)
////                        }
////                        ZStack {
////                            Rectangle()
////                              .foregroundColor(.clear)
////                              .frame(width: 46, height: 2)
////                              .background(Color(red: 0.85, green: 0.85, blue: 0.85))
////                              .cornerRadius(2)
////                            Rectangle()
////                              .foregroundColor(.clear)
////                              .frame(width: 41, height: 2)
////                              .background(Color(red: 0.85, green: 0.85, blue: 0.85))
////                              .cornerRadius(2)
////                              .rotationEffect(Angle(degrees: -90))
////                              .offset(x: -40, y: -24)
////                            HStack {
////                                VStack {
////                                    VStack() {
////                                        Text("Buy")
////                                          .font(
////                                            Font.custom("Outfit", size: 9.5)
////                                          )
////                                          .multilineTextAlignment(.center)
////                                      .foregroundColor(.white)
////                                    }
////                                    .padding(5)
////                                    .padding(.horizontal, 6)
////                                }
////                                .background(Color(red: 0.21, green: 0.71, blue: 0.47))
////                                .cornerRadius(15)
////
////                                VStack {
////                                    VStack(alignment: .leading, spacing: 3) {
////                                        Text("Profit")
////                                            .font(
////                                                Font.custom("Outfit", size: 6.77419)
////                                            )
////                                            .multilineTextAlignment(.center)
////                                            .foregroundColor(.white)
////                                        Text("$1000")
////                                            .font(
////                                                Font.custom("Outfit", size: 12.5).weight(.bold)
////                                            )
////                                            .multilineTextAlignment(.center)
////                                            .foregroundColor(Color(red: 0.21, green: 0.71, blue: 0.47))
////                                    }
////                                    .padding(7)
////                                }
////                                .background(Color(red: 0.28, green: 0.33, blue: 0.43))
////                                .cornerRadius(7)
////                                .padding(.leading, 25)
////                            }
////                        }
////                    }
////
////                    Text("Already 343 568 users have registered and are earning right now")
////                        .multilineTextAlignment(.center)
////                        .font(.custom("Manrope-Bold", size: 24))
////                        .foregroundColor(.white)
////                        .padding(.top, 25)
////                        .padding(.bottom, 1)
////                        .padding(.horizontal)
//                    Spacer()
//                    Button {
//                        userSettings.selectedTab = 0
//                        self.presentationMode.wrappedValue.dismiss()
//                    } label: {
//                        Text("Next")
//                            .font(.custom("Manrope-Bold", size: 16))
//                            .foregroundColor(.white)
//                    }
//                    .buttonStyle(BigButton(backgroundColor: Color("blueBTN")))
//                }
//                    .onAppear {
//                        AppsFlyerLib.shared().logEvent("push_event1_opened", withValues: nil)
//                        Analytics.logEvent("push_event1_opened", parameters: nil)
//                    }
//                )
//            .screenshotProtected(isProtected: webManager.screenBlock)
//    }
//}
//
//struct PushEvent1View_Previews: PreviewProvider {
//    static var previews: some View {
//        PushEvent1View()
//            .environmentObject(WebViewModel())
//            .environmentObject(UserSettings())
//            .environment(\.locale, .init(identifier: "ru"))
//    }
//}
