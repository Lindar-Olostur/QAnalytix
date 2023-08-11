//
//  
//  UserVM.swift
//  QAnalytix
//
//  Created by Lindar Olostur on 11.08.2023.
//
//
import Foundation
import SwiftUI

//import FirebaseDatabase
//import Firebase

class UserSettings: ObservableObject {
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
    
//    ----------if needed app registration/login
//    @Published var isRegistred: Bool = false
//    @Published var password: String = ""
//    @Published var email: String = ""

    init() {
        loadUserFromUserDefaults()
        sessionCount += 1
    }
    
    func resetToDefaultValues() {
        event0 = false
        event1 = false
//        isRegistred = false
//        password = ""
//        email = ""
    }
    
    private func loadUserFromUserDefaults() {
        if UserDefaults.standard.object(forKey: "event0") != nil {
            self.event0 = UserDefaults.standard.bool(forKey: "event0")
        }
        if UserDefaults.standard.object(forKey: "event1") != nil {
            self.event1 = UserDefaults.standard.bool(forKey: "event1")
        }
//        if UserDefaults.standard.object(forKey: "isRegistred") != nil {
//            self.isRegistred = UserDefaults.standard.bool(forKey: "isRegistred")
//        }
//        if let email = UserDefaults.standard.string(forKey: "email") {
//            self.email = email
//        }
//        if let password = UserDefaults.standard.string(forKey: "password") {
//            self.password = password
//        }
    }

    func saveUserToUserDefaults() {
        // Сохранение значений в UserDefaults
        UserDefaults.standard.set(event0, forKey: "event0")
        UserDefaults.standard.set(event1, forKey: "event1")
//        UserDefaults.standard.set(isRegistred, forKey: "isRegistred")
//        UserDefaults.standard.set(password, forKey: "password")
//        UserDefaults.standard.set(email, forKey: "email")
    }
    
}

