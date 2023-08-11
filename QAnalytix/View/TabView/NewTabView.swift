//
//  
//  NewTabView.swift
//  QAnalytix
//
//  Created by Lindar Olostur on 11.08.2023.
//
//

import SwiftUI
//import AppsFlyerLib
//import Firebase
//import FirebaseAnalytics
//import OneSignal

struct NewTabView: View {
    @State var selectedTab = 0
//    @State var learnTapCount = 0 {
//        didSet {
//            if learnTapCount == 3 && !vorEvent1Checker.eventWasShowed {
//                showVorEvent1View = vorEvent1Checker.by3Tap()
//            }
//        }
//    }// 1/3 триггеров на события воронки (3 taps)
//    @EnvironmentObject private var appDelegateObserver: AppDelegateObserver
//    @EnvironmentObject var vorEvent1Checker: VorPushEvent1VM
    @EnvironmentObject var userSettings: UserSettings
//    @EnvironmentObject var webManager: WebViewModel
    @Environment(\.scenePhase) var scenePhase // для остановки опроса в background
    
    // все необходимые события
    @State private var showEvent0View = false
    @State private var showEvent1View = false
    @State private var showVorEvent1View = false
    @State private var showVorEvent2View = false
    @State private var showVorEvent3View = false
    
    private let tabs = [
        TabItem(icon: "fightIcon", text: LocalizedStringKey("Fight")),
        TabItem(icon: "learnIcon", text: LocalizedStringKey("Learn")),
        TabItem(icon: "topIcon", text: LocalizedStringKey("Top")),
        TabItem(icon: "personIcon", text: LocalizedStringKey("Profile"))
    ]
    var body: some View {
        VStack {
            Color("bg")
                .ignoresSafeArea()
                .overlay(
                    Group {
                        VStack {
                            if selectedTab == 0 {
                                VStack {
//                                    FightViewAlt(view: webManager.view)
                                }
                            }
                            if selectedTab == 1 {
//                                LearnView()
                            }
                            if selectedTab == 2 {
//                                TopView()
                            }
                            if selectedTab == 3 {
//                                ProfileView()
                            }
                        }.padding(.bottom, -8)
                    }
                )
            VStack(spacing: 0) {
                Divider().background(Color("OutlinePrimary"))
                
                HStack(spacing: 0) {
                    ForEach(0..<4) { index in
                        Button(action: {
                            changeTab(index: index)
                        }) {
                            VStack(spacing: 5) {
                                
                                if index == selectedTab {
                                    Rectangle()
                                        .foregroundColor(.blue)
                                        .frame(width: 50, height: 2)
                                        .offset(y: -6)
                                }
                                if index == selectedTab {
                                    Image("na" + tabs[index].icon)
                                        .resizable()
                                        .aspectRatio(contentMode: .fit)
                                        .frame(width: 26, height: 26)
                                } else {
                                    Image(tabs[index].icon)
                                        .resizable()
                                        .aspectRatio(contentMode: .fit)
                                        .frame(width: 26, height: 26)
                                }
                                
                                Text(tabs[index].text)
                                    .font(.custom("Manrope-Regular", size: 12))
                                    .foregroundColor(index == selectedTab ? Color("blueBTN") : Color("OutlinePrimary"))
                            }
                            .padding()
                            .padding(.top, -10)
                            .frame(maxWidth: .infinity)
                        }
                    }
                }
            }
        }
        .background(Color("bg"))
        // для показа всех алертов
        .alert(isPresented: $userSettings.showErrorAlert) {
            Alert(
                title: Text(NSLocalizedString(userSettings.alertTitle, comment: "")),
                message: Text(NSLocalizedString(userSettings.alertMessage, comment: ""))
            )
        }
        .onDisappear {
            userSettings.saveUserToUserDefaults()
        }
//        .onAppear {
//            // 2/3 триггера для события воронки (every 3 open)
//            if userSettings.sessionCount % 3 == 0 {
//                showVorEvent1View = vorEvent1Checker.by3Open()
//            }
//            // 3/3 триггера для события воронки (таймер 2 минуты)
//            DispatchQueue.main.asyncAfter(deadline: .now() + 120) {
//                showVorEvent1View = vorEvent1Checker.byTimer()
//            }
//        }
        
//        .onReceive(webManager.$event0, perform: { value in
//            print("Recieved event0 - \(value)")
//            showEvent0View = checkEvents(value: value, event: 0)
//        })
//        .onReceive(webManager.$event1, perform: { value in
//            print("Recieved event1 - \(value)")
//            showEvent1View = checkEvents(value: value, event: 1)
//        })
//        // реакция воронки на пуш 2
//        .onReceive(NotificationCenter.default.publisher(for: Notification.Name("showEvent2"))) { notification in
//            if let showEvent2 = notification.object as? Bool {
//                self.appDelegateObserver.showEvent2 = showEvent2
//                showVorEvent2View = showEvent2
//            }
//        }
//        // реакция воронки на пуш 3
//        .onReceive(NotificationCenter.default.publisher(for: Notification.Name("showEvent3"))) { notification in
//            if let showEvent3 = notification.object as? Bool {
//                self.appDelegateObserver.showEvent3 = showEvent3
//                showVorEvent3View = showEvent3
//            }
//        }
        // для переключения таба извне
        .onReceive(userSettings.$selectedTab, perform: { value in
            selectedTab = value
        })
//        // логика опроса при состояних прилы
//        .onChange(of: scenePhase) { newPhase in
//                        if newPhase == .active {
//                            print("Active")
//                            webManager.resumePolling()
//                            webManager.num = webManager.isNotFirstLaunch ? 20 : 40
//                        } else if newPhase == .inactive {
//                            userSettings.saveUserToUserDefaults()
//                            print("Inactive")
//                        } else if newPhase == .background {
//                            print("Goes to Background")
//                            userSettings.saveUserToUserDefaults()
//                            webManager.pausePolling()
//                        }
//                    }
//        //все табы событий
//        .fullScreenCover(isPresented: $showEvent0View) {
//            SuccessRegistrationView()
//        }
//        .fullScreenCover(isPresented: $showEvent1View) {
//            SuccessDView()
//        }
//        .fullScreenCover(isPresented: $showVorEvent1View) {
//            PushSubEventView()
//        }
//        .fullScreenCover(isPresented: $showVorEvent2View) {
//            PushEvent1View()
//        }
//        .fullScreenCover(isPresented: $showVorEvent3View) {
//            PushEvent2View_()
//        }
    }
//    // чек показа для событий r/d
//    func checkEvents(value: Bool, event: Int) -> Bool {
//        var result = false
//
//        if event == 0 {
//            print("userSettings.event0 - \(userSettings.event0)")
//            if userSettings.event0 == false {
//                if value == false {
//                    result = false
//                }
//                if value == true {
//                    result = true
//                }
//            } else {
//                result = false
//            }
//        }
//        if event == 1 {
//            print("userSettings.event1 - \(userSettings.event1)")
//            if userSettings.event1 == false {
//                if value == false {
//                    result = false
//                }
//                if value == true {
//                    result = true
//                }
//            } else {
//                result = false
//            }
//        }
//        return result
//    }
    func changeTab(index: Int) {
        selectedTab = index
        switch index {
        case 0: break
        case 1:
            learnTapCount += 1
            AppsFlyerLib.shared().logEvent("Learn_tab", withValues: nil)
            Analytics.logEvent("Learn_tab", parameters: nil)
        case 2:
            AppsFlyerLib.shared().logEvent("Top_tab", withValues: nil)
            Analytics.logEvent("Top_tab", parameters: nil)
        case 3:
            AppsFlyerLib.shared().logEvent("Profile_tab", withValues: nil)
            Analytics.logEvent("Profile_tab", parameters: nil)
        default:
            break
        }
    }
}

struct NewTabView_Previews: PreviewProvider {
    static var previews: some View {
        NewTabView(selectedTab: 0)
            .environmentObject(UserSettings())
//            .environmentObject(WebViewModel())
//            .environmentObject(VorPushEvent1VM())
//            .environmentObject(AppDelegateObserver())
            .environment(\.locale, .init(identifier: "ar"))
    }
}
