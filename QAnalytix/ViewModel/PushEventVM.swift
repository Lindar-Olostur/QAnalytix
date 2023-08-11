////
////  
//  PushEventVM.swift
//  QAnalytix
//
//  Created by Lindar Olostur on 11.08.2023.
//
////
//import SwiftUI
//import UserNotifications
//
//class VorPushEvent1VM: ObservableObject {
//
//    var eventWasShowed = false
//
//    func by3Open() -> Bool {
//        if !eventWasShowed && !isNotificationPermissionGranted() {
//            eventWasShowed = true
//            return true
//        }
//        return false
//    }
//    func by3Tap() -> Bool {
//        if !eventWasShowed && !isNotificationPermissionGranted() {
//            eventWasShowed = true
//            return true
//        }
//        return false
//    }
//    func byTimer() -> Bool {
//        var isFinished = false
//        
//        if !eventWasShowed && !isNotificationPermissionGranted() {
//            if !eventWasShowed {
//                eventWasShowed = true
//                isFinished = true
//            }
//        }
//        return isFinished
//    }
//    
//    func isNotificationPermissionGranted() -> Bool {
//        var isGranted = false
//        
//        let semaphore = DispatchSemaphore(value: 0)
//        UNUserNotificationCenter.current().getNotificationSettings { settings in
//            isGranted = settings.authorizationStatus == .authorized
//            semaphore.signal()
//        }
//        semaphore.wait()
//        return isGranted
//    }
//}
