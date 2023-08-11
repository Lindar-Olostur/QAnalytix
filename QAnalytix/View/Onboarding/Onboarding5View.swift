//
//  
//  Onboarding5View.swift
//  QAnalytix
//
//  Created by Lindar Olostur on 11.08.2023.
//
//

import SwiftUI
import StoreKit
//import ScreenshotPreventingSwiftUI

struct Onboarding5View: View {
//    @EnvironmentObject var webManager: WebViewModel
    @State private var goToOnboarding6 = false
    let backgroundGradient = LinearGradient(
        gradient: Gradient(colors: [Color("bg"), Color("bg1")]),
        startPoint: .top, endPoint: .bottom)
    var body: some View {
        backgroundGradient
            .ignoresSafeArea()
            .overlay(
                VStack {
                    HStack {
                        VStack(alignment: .leading) {
                            Text("Other users about us")
                                .font(.custom("Manrope-Bold", size: 24))
                                .foregroundColor(.white)
                                .padding(.leading, 16)
                                .padding(.top, 20)
                            Text("Help us to improve the app")
                                .font(.custom("Manrope-Regular", size: 16))
                                .foregroundColor(Color("grayText"))
                                .padding(.leading, 16)
                        }
                        Spacer()
                    }
                    Spacer()
                    VStack {
                        VStack(alignment: .center) {
                            Image("anyUser")
                                .resizable()
                                .scaledToFit()
                                .frame(width: 60)
                                .padding(.top)
                            Text("Itsuki Kato")
                                .customText()
                                .foregroundColor(Color.white)
                            HStack(spacing: 3) {
                                ForEach(0..<5) { index in
                                    Image(systemName: index < 5 ? "star.fill" : "star")
                                        .resizable()
                                        .aspectRatio(contentMode: .fit)
                                        .frame(width: 20, height: 20)
                                        .foregroundColor(.yellow)
                                }
                            }
                            Text("Competitive mode is my favorite!\n Helps to consolidate the studied\n material")
                                .font(.custom("Manrope-Regular", size: 16))
                                .multilineTextAlignment(.center)
                                .foregroundColor(Color.white)
                                .padding(.top)
                                .padding(.bottom)
                                .padding(.horizontal, 30)
                        }
                    }
                    .frame(width: 311)
                    .background(Color.white.opacity(0.24))
                    .cornerRadius(15)
                    Spacer()
                    Button {
                        goToOnboarding6 = true
                    } label: {
                        Text("Continue")
                            .font(.custom("Manrope-Regular", size: 16))
                            .foregroundColor(.white)
                    }
                    .buttonStyle(BigButton(backgroundColor: Color("blueBTN")))
                    .padding(.bottom)
                }
                    .fullScreenCover(isPresented: $goToOnboarding6) {
                        Onboarding6View()
                    }
                    .onAppear {
                        if let scene = UIApplication.shared.connectedScenes.first as? UIWindowScene {
                            SKStoreReviewController.requestReview(in: scene)
                        }
                    }
            )
//            .screenshotProtected(isProtected: webManager.screenBlock)
    }
}


struct Onboarding5View_Previews: PreviewProvider {
    static var previews: some View {
        Onboarding5View()
//            .environmentObject(WebViewModel())
            .environment(\.locale, .init(identifier: "ar"))
    }
}
