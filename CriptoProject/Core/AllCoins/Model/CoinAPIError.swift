//
//  CoinAPIError.swift
//  CriptoProject
//
//  Created by Kaua Miguel on 02/08/24.
//

import Foundation


enum CoinAPIError : Error{
    case invalidData
    case jsonParsingFailure
    case requestFailed(description: String)
    case invalidStatusCode(statusCode : Int)
    case unknownError(error : Error)
    
    var customDescription : String{
        switch self {
        case .invalidData:
            return "Invalid Data"
        case .jsonParsingFailure:
            return "Failed to parse json"
        case .requestFailed(let description):
            return "Request Failed \(description)"
        case .invalidStatusCode(let statusCode):
            return "Invalid status code: \(statusCode)"
        case .unknownError(let error):
            return "An unknown error: \(error.localizedDescription)"
        }
    }
}
