//
//  Models.swift
//  QAnalytix
//
//  Created by Lindar Olostur on 14.08.2023.
//

import Foundation

struct EventResponse: Decodable {
    let registration: Bool
    let firstReplenishment: Bool
}
struct Response: Codable {
    let value: Int
}

struct GnLUser: Hashable, Codable {
    let portrait: String
    let isGainer: Bool
    let name: String
    let isMale: Bool
    let pair: String
    let flags: String
    let money: Double
    let percent: String
}

struct Signal: Hashable, Codable, Identifiable {
    var id = UUID()
    let pair: String
    let flags: String
    let time: Date
    let isSell: Bool
}
