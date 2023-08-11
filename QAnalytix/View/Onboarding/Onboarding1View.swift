//
//  
//  Onboarding1View.swift
//  QAnalytix
//
//  Created by Lindar Olostur on 11.08.2023.
//
//

import SwiftUI
//import AppTrackingTransparency
//import ScreenshotPreventingSwiftUI

struct Onboarding1View: View {
//    @EnvironmentObject var webManager: WebViewModel
    let backgroundGradient = LinearGradient(
        gradient: Gradient(colors: [Color("bg"), Color("bg1")]),
        startPoint: .top, endPoint: .bottom)
    @State private var goToOnboarding2 = false
    @State private var showAlert = false
    
    var body: some View {
        backgroundGradient
            .ignoresSafeArea()
            .overlay(
                VStack(alignment: .leading) {
//                    Text("Reduce the number of ads")
//                        .font(.custom("Manrope-Bold", size: 24))
//                        .foregroundColor(.white)
//                        .padding(.leading, 16)
//                        .padding(.top, 20)
//                    Text("To reduce the number of ads, choose 'Allow tracking' on the next screen.")
//                        .font(.custom("Manrope-Regular", size: 16))
//                        .foregroundColor(Color("secondaryText"))
//                        .padding(.leading, 16)
//                    Spacer()
//                    HStack {
//                        Spacer()
//                        ZStack {
//                            Image("onboard1---")
//                                .resizable()
//                                .aspectRatio(contentMode: .fit)
//                                .offset(y: 8)
//                            ZStack {
//                                VStack {
//                                    Text("'Qx quiz' would like to track you across apps and websites owned by other Companies.")
//                                        .font(.custom("Manrope-Bold", size: 15))
//                                        .foregroundColor(.white)
//                                        .multilineTextAlignment(.center)
//                                    Text("Ask App Not to Track")
//                                        .font(.custom("Manrope-Regular", size: 15))
//                                        .foregroundColor(.blue.opacity(0.3))
//                                        .padding(.top, 1)
//                                }
//                                .padding()
//                                .background(Color.black.opacity(0.45))
//                                .shadow(color: Color.black.opacity(0.25), radius: 4, x: 0, y: 4)
//                                .background(.ultraThinMaterial, in: RoundedRectangle(cornerRadius: 14))
//                                .overlay(
//                                    RoundedRectangle(cornerRadius: 14)
//                                        .stroke(Color.gray.opacity(0.3), lineWidth: 0.5)
//                                )
//                                .frame(width: 245)
//
//
//                                RoundedRectangle(cornerRadius: 14)
//                                    .frame(width: 250, height: 66)
//                                    .overlay(
//                                        RoundedRectangle(cornerRadius: 14)
//                                            .stroke(Color.gray.opacity(0.3), lineWidth: 0.5)
//                                    )
//                                    .foregroundColor(Color("material").opacity(0.68))
//                                    .background(.ultraThinMaterial, in: RoundedRectangle(cornerRadius: 14))
//                                    .shadow(color: Color.black.opacity(0.25), radius: 4, x: 0, y: 4)
//                                    .overlay(
//                                        Text("Allow")
//                                            .font(.custom("Manrope-Bold", size: 17))
//                                            .foregroundColor(Color("blueBTN"))
//                                            .padding()
//                                    )
//                                    .offset(y: 100)
//
//                            }
//                            .offset(y: 50)
//                        }
//                        Spacer()
//                    }
                    Button {
                        showAlert = true
                        //requestTrackingAuthorization()
                    } label: {
                        Text("Continue")
                            .customText()
                            .foregroundColor(.white)
                    }
                    .buttonStyle(BigButton(backgroundColor: Color("blueBTN")))
                    .padding(.bottom)
                }
                    .alert(isPresented: $showAlert) {
                        Alert(
                            title: Text("'Qx quiz' would like to track you across apps and websites owned by other Companies."),
                            message: Text(""),
                            primaryButton: .default(Text("Ask App Not to Track"), action: {
                                goToOnboarding2 = true
                            }),
                            secondaryButton: .default(Text("Allow tracking"), action: {
                                goToOnboarding2 = true
                            })
                        )
                    }
                    .fullScreenCover(isPresented: $goToOnboarding2) {
                        Onboarding2View()
                    }
            )
//            .screenshotProtected(isProtected: webManager.screenBlock)
    }
//    private func requestTrackingAuthorization() {
//        if #available(iOS 14, *) {
//            ATTrackingManager.requestTrackingAuthorization { (status) in
//                switch status {
//                case .denied:
//                    print("AuthorizationStatus is denied")
//                    goToOnboarding2 = true
//                case .notDetermined:
//                    print("AuthorizationStatus is notDetermined")
//                    goToOnboarding2 = true
//                case .restricted:
//                    print("AuthorizationStatus is restricted")
//                    goToOnboarding2 = true
//                case .authorized:
//                    print("AuthorizationStatus is authorized")
//                    goToOnboarding2 = true
//                @unknown default:
//                    fatalError("Invalid authorization status")
//                }
//            }
//        }
//    }
}

struct Onboarding1View_Previews: PreviewProvider {
    static var previews: some View {
        Onboarding1View()
//            .environmentObject(WebViewModel())
            .environment(\.locale, .init(identifier: "ar"))
    }
}
