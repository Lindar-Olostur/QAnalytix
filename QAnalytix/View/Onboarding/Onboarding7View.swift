//
//  Onboarding7View.swift
//  QAnalytix
//
//  Created by Lindar Olostur on 12.08.2023.
//

import SwiftUI
import StoreKit
//import ScreenshotPreventingSwiftUI

struct Onboarding7View: View {
//    @EnvironmentObject var webManager: WebViewModel
    @State private var goToOnboarding8 = false
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
                            Text("Help us to improve the app")
                                .customText(style: .bold, size: 24, color: .white)
                                .padding(.top, 42)
                            Text("Leave a comment to improve our application")
                                .customText(style: .medium, size: 16, color: Color("grayText"))
                        }
                        Spacer()
                    }
                    Spacer()
                    VStack(alignment: .leading, spacing: 12) {
                        HStack {
                            Image("indus")
                                .resizable()
                                .frame(width: 56, height: 54)
                                .clipShape(Circle())
                            VStack(alignment: .leading) {
                                Text("Rahulkumar Tevany")
                                    .customText(style: .bold, size: 18, color: .white)
                                Text("March, 2023")
                                    .customText(style: .medium, size: 16, color: Color("grayText"))
                            }
                            .padding(.leading, 8)
                        }
                        HStack {
                            ForEach(1...5, id: \.self) { index in
                                Image("star")
                                    .resizable()
                                    .frame(width: 24, height: 24)
                            }
                        }
                        Text("I love this platform. it’s easy to use, fast and accurate. Try the demo first... see for your self!")
                            .customText(style: .medium, size: 18, color: .white)
                            .padding(.top, 5)
                    }
                    .padding(24)
                    .frame(width: 320, alignment: .topLeading)
                    .background(Color(red: 0.21, green: 0.23, blue: 0.3))
                    .cornerRadius(20)
                    .shadow(color: Color(red: 0.21, green: 0.23, blue: 0.3).opacity(0.4), radius: 20, x: 0, y: 12)
                    Spacer()
                    Button {
                        goToOnboarding8 = true
                    } label: {
                        Text("Continue")
                            .font(.custom("Manrope-Regular", size: 16))
                            .foregroundColor(.white)
                    }
                    .buttonStyle(BigButton(backgroundColor: Color("blueBTN")))
                    .padding(.bottom)
                }
                    .padding(.horizontal, 16)
                    .fullScreenCover(isPresented: $goToOnboarding8) {
                        Onboarding8View()
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


struct Onboarding7View_Previews: PreviewProvider {
    static var previews: some View {
        Onboarding7View()
//            .environmentObject(WebViewModel())
            .environment(\.locale, .init(identifier: "ar"))
    }
}
