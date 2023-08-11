//
//  SettingsView.swift
//  QAnalytix
//
//  Created by Lindar Olostur on 12.08.2023.
//

import SwiftUI

struct SettingsView: View {
    init(userSettings: UserSettings) {
        self.userSettings = userSettings
        //Use this if NavigationBarTitle is with Large Font
        UINavigationBar.appearance().largeTitleTextAttributes = [.foregroundColor: UIColor.white]
        
        //Use this if NavigationBarTitle is with displayMode = .inline
        UINavigationBar.appearance().titleTextAttributes = [.foregroundColor: UIColor.white]
    }
    @ObservedObject var userSettings: UserSettings
    @Environment(\.presentationMode) var presentationMode
    var body: some View {
        Color("bg")
            .ignoresSafeArea()
            .overlay(
                VStack(alignment: .leading) {
                    VStack(spacing: -6) {
                        HStack {
                            Text("Settings")
                                .customText(style: .bold, size: 24, color: .white)
                            Spacer()
                            Button {
                                //
                            } label: {
                                Image("gear")
                                    .resizable()
                                    .scaledToFit()
                                    .frame(width: 24, height: 24)
                            }
                            .disabled(true)
                        }
                        .padding(16)
                        Button {
                            if let url = URL(string: "https://www.freeprivacypolicy.com/live/6a9f3f22-b052-4b0f-88dd-ac7b78eb55dc") {
                                UIApplication.shared.open(url)
                            }
                        } label: {
                            HStack {
                                Image("policy")
                                    .resizable()
                                    .scaledToFit()
                                    .frame(height: 22)
                                Text("Privacy Policy")
                                    .padding(.horizontal)
                                Spacer()
                            }
                        }
                        .frame(maxWidth: .infinity)
                        .padding()
                        .foregroundColor(.white)
                        .background(Color(red: 0.21, green: 0.23, blue: 0.3))
                        .cornerRadius(8)
                        .overlay(
                            RoundedRectangle(cornerRadius: 10)
                                .stroke(Color("OutlinePrimary"), lineWidth: 1)
                        )
                        .padding(.horizontal)
                        .padding(.top)
                        
                        Button {
                            if let url = URL(string: "https://forms.gle/NR6ss9ak5JrHds679") {
                                UIApplication.shared.open(url)
                            }
                        } label: {
                            HStack {
                                Image("support")
                                    .resizable()
                                    .scaledToFit()
                                    .frame(height: 22)
                                Text("Support")
                                    .padding(.horizontal)
                                Spacer()
                            }
                        }
                        .frame(maxWidth: .infinity)
                        .padding()
                        .foregroundColor(.white)
                        .background(Color(red: 0.21, green: 0.23, blue: 0.3))
                        .cornerRadius(8)
                        .overlay(
                            RoundedRectangle(cornerRadius: 10)
                                .stroke(Color("OutlinePrimary"), lineWidth: 1)
                        )
                        .padding(.horizontal)
                        .padding(.top)
                        
                    }
                    .background(Color("BackgroundQuaternary"))
                    .cornerRadius(15)
                    .padding(.vertical)
                    Spacer()
                    Button {
                        self.presentationMode.wrappedValue.dismiss()
                    } label: {
                        Text("Back")
                            .foregroundColor(.white)
                    }
                    .buttonStyle(BigButton(backgroundColor: Color("blueBTN")))
                    .padding(16)
                }
                    .navigationBarTitle(Text("Settings"))
            )
    }
}

struct SettingsView_Previews: PreviewProvider {
    static var previews: some View {
        SettingsView(userSettings: UserSettings())
            .environment(\.locale, .init(identifier: "ar"))
    }
}
