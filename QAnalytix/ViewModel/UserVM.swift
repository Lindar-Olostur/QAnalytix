//
//  UserVM.swift
//  QAnalytix
//
//  Created by Lindar Olostur on 11.08.2023.
//

import Foundation
import SwiftUI

//import FirebaseDatabase
//import Firebase

class UserSettings: ObservableObject {
    @Published var newsView = MyWidgetWebView(htmlString: """
                                <!-- TradingView Widget BEGIN -->
                                <div class="tradingview-widget-container">
                                  <div class="tradingview-widget-container__widget"></div>
                                  <div class="tradingview-widget-copyright"><a href="https://www.tradingview.com/" rel="noopener nofollow" target="_blank"><span class="blue-text">Track all markets on TradingView</span></a></div>
                                  <script type="text/javascript" src="https://s3.tradingview.com/external-embedding/embed-widget-timeline.js" async>
                                  {
                                  "feedMode": "all_symbols",
                                  "colorTheme": "dark",
                                  "isTransparent": true,
                                  "displayMode": "regular",
                                  "width": "100%",
                                  "height": "100%",
                                  "locale": "en"
                                }
                                  </script>
                                </div>
                                <!-- TradingView Widget END -->
                            """)
    @Published var isOnboardingCompleted = UserDefaults.standard.bool(forKey: "isOnboardingCompleted")
    @Published var sessionCount = UserDefaults.standard.integer(forKey: "sessionCount") {
        didSet {
            UserDefaults.standard.set(sessionCount, forKey: "sessionCount")
        }
    }
    
    @Published var selectedTab = 0
    
//    @Published var fbManager = FirebaseManager()
    @Published var event0 = false
    @Published var event1 = false
    
    @Published var showErrorAlert = false
    @Published var alertTitle = ""
    @Published var alertMessage = ""
    
//    ----------users
    @Published var gainers: [GnLUser] = []
    @Published var losers: [GnLUser] = []
    
    @Published var currentValues: [Double] = [79.6, 11.6, 71.5, 66.6, 88.9, 37.1, 18.9, 59.74]
    @Published var lastValues: [Double] = [89.4, 11.6, 50.5, 11.1, 90.8, 37.1, 23.3, 44.4]
    
    @Published var signals: [Signal] = []
    
    init() {
        loadUserFromUserDefaults()
        sessionCount += 1
        checkFor24Hours()
    }
    
    deinit {
        saveUserToUserDefaults()
    }
    
    func resetToDefaultValues() {
        event0 = false
        event1 = false
        gainers = []
        losers = []
        currentValues = [79.6, 11.6, 71.5, 66.6, 88.9, 37.1, 18.9, 59.74]
        lastValues = [89.4, 11.6, 50.5, 11.1, 90.8, 37.1, 23.3, 44.4]
        signals = []
    }
    
    private func loadUserFromUserDefaults() {
        if UserDefaults.standard.object(forKey: "event0") != nil {
            self.event0 = UserDefaults.standard.bool(forKey: "event0")
        }
        if UserDefaults.standard.object(forKey: "event1") != nil {
            self.event1 = UserDefaults.standard.bool(forKey: "event1")
        }
        if let gainersData = UserDefaults.standard.data(forKey: "gainers") {
            do {
                gainers = try JSONDecoder().decode([GnLUser].self, from: gainersData)
            } catch {
                print("not loaded gainers")
            }
        }
        if let losersData = UserDefaults.standard.data(forKey: "losers") {
            do {
                losers = try JSONDecoder().decode([GnLUser].self, from: losersData)
            } catch {
                print("not loaded losers")
            }
        }
        if let currentValuesData = UserDefaults.standard.data(forKey: "currentValues") {
            do {
                currentValues = try JSONDecoder().decode([Double].self, from: currentValuesData)
            } catch {
                print("not loaded currentValues")
            }
        }
        if let lastValuesData = UserDefaults.standard.data(forKey: "lastValues") {
            do {
                lastValues = try JSONDecoder().decode([Double].self, from: lastValuesData)
            } catch {
                print("not loaded lastValues")
            }
        }
        if let signalsData = UserDefaults.standard.data(forKey: "signals") {
            do {
                signals = try JSONDecoder().decode([Signal].self, from: signalsData)
            } catch {
                print("not loaded signals")
            }
        }
    }

    func saveUserToUserDefaults() {
        // Сохранение значений в UserDefaults
        UserDefaults.standard.set(event0, forKey: "event0")
        UserDefaults.standard.set(event1, forKey: "event1")
        do {
                let gainersData = try JSONEncoder().encode(gainers)
                UserDefaults.standard.set(gainersData, forKey: "gainers")
            } catch {
                print("not saved gainers")
            }
        do {
                let losersData = try JSONEncoder().encode(losers)
                UserDefaults.standard.set(losersData, forKey: "losers")
            } catch {
                print("not saved losers")
            }
        do {
                let currentValuesData = try JSONEncoder().encode(currentValues)
                UserDefaults.standard.set(currentValuesData, forKey: "currentValues")
            } catch {
                print("not saved currentValues")
            }
        do {
                let lastValuesData = try JSONEncoder().encode(lastValues)
                UserDefaults.standard.set(lastValuesData, forKey: "lastValues")
            } catch {
                print("not saved lastValues")
            }
        do {
                let signalsData = try JSONEncoder().encode(signals)
                UserDefaults.standard.set(signalsData, forKey: "signals")
            } catch {
                print("not saved signals")
            }
    }
    func checkFor24Hours() {
        let userDefaults = UserDefaults.standard
        
        if let lastExecutionDate = userDefaults.value(forKey: "lastExecutionDate") as? Date {
            let currentDate = Date()
            let timeInterval = currentDate.timeIntervalSince(lastExecutionDate)
            if timeInterval >= 24 * 60 * 60 {
                updateGainersNLosers()
                updateSignals()
                userDefaults.setValue(currentDate, forKey: "lastExecutionDate")
            }
        } else {
            updateGainersNLosers()
            updateSignals()
            userDefaults.setValue(Date(), forKey: "lastExecutionDate")
        }
    }
    
    func updateSignals() {
        signals = []
        var pairs = ["AUD/JPY", "AUD/USD", "CAD/CHF", "EUR/AUD", "EUR/USD", "GBP/JPY", "GBP/USD", "USD/JPY", "EUR/GBP", "USD/CAD"]
        for _ in 1...8 {
            pairs.shuffled()
            let pair = pairs.popLast() ?? "EUR/USD"
            let flag = pair.replacingOccurrences(of: "/", with: "")
            var randomTime: Date {
                let randomHour = Int(arc4random_uniform(24))
                let randomMinute = Int(arc4random_uniform(6)) * 10
                let randomDate = Calendar.current.date(bySettingHour: randomHour, minute: randomMinute, second: 0, of: Date()) ?? Date()
                return randomDate
            }
            
            let newSignal = Signal(pair: pair, flags: flag, time: randomTime, isSell: Bool.random())
            signals.append(newSignal)
        }
    }
    
    func updateGainersNLosers() {
        gainers = []
        losers = []
        var nameList = ["Kenny", "Mike", "Kris", "Jin", "Reina", "Amir", "Sasha", "Lucy", "Chan", "Yuri", "Aron", "Lina", "Donie", "Peter", "Arno", "Olema", "Mary", "Stacy", "Billy", "Molly"]
        let pairs = ["AUD/JPY", "AUD/USD", "CAD/CHF", "EUR/AUD", "EUR/USD", "GBP/JPY", "GBP/USD", "USD/JPY", "EUR/GBP", "USD/CAD"]
        // gainers
        for _ in 1...8 {
            nameList.shuffled()
            let name = nameList.popLast() ?? "Alan"
            let currency = pairs.shuffled().first
            let sex = Bool.random()
            let portrait = sex ? "male" : "female"
            let money = Double.random(in: 1...20)
            let percent = "+\(String(format: "%.2f", Double.random(in: 1...70.99)))%"
            let flags = currency?.replacingOccurrences(of: "/", with: "") ?? "EURUSD"
            let newUser = GnLUser(portrait: "\(portrait)\(Int.random(in: 1...5))", isGainer: true, name: name, isMale: sex, pair: currency ?? "EUR/USD", flags: flags, money: money, percent: percent)
            gainers.append(newUser)
        }
        // losers
        for _ in 1...8 {
            nameList.shuffled()
            let name = nameList.popLast() ?? "Abby"
            let currency = pairs.shuffled().first
            let sex = Bool.random()
            let portrait = sex ? "male" : "female"
            let money = Double.random(in: 1...20)
            let percent = "-\(String(format: "%.2f", Double.random(in: 1...70.99)))%"
            let flags = currency?.replacingOccurrences(of: "/", with: "") ?? "EURUSD"
            let newUser = GnLUser(portrait: "\(portrait)\(Int.random(in: 1...5))", isGainer: false, name: name, isMale: sex, pair: currency ?? "EUR/USD", flags: flags, money: money, percent: percent)
            losers.append(newUser)
        }
    }
}
