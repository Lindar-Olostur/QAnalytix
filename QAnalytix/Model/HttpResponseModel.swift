//
//  
//  HttpResponseModel.swift
//  QAnalytix
//
//  Created by Lindar Olostur on 11.08.2023.
//
//

import Foundation

struct EventResponse: Decodable {
    let registration: Bool
    let firstReplenishment: Bool
}
struct Response: Codable {
    let value: Int
}
