//
//  Coin.swift
//  CriptoProject
//
//  Created by Kaua Miguel on 02/08/24.
//

import Foundation


struct Coin : Codable, Identifiable{
    let id : String
    let symbol : String
    let name : String
    let currentPrice : Double
    let marketCapRank : Int
    
    
    enum CodingKeys : String, CodingKey {
        case id, symbol, name
        case currentPrice = "current_price"
        case marketCapRank = "market_cap_rank"
    }
}
