//
//  GDAXMarginProfileUpdate.swift
//  GDAXSocketSwift
//
//  Created by Hani Shabsigh on 10/29/17.
//  Copyright © 2017 Hani Shabsigh. All rights reserved.
//

import Foundation

open class GDAXMarginProfileUpdate: GDAXProductMessage {
    
    open let timestamp: Date
    open let userId: String
    open let profileId: String
    open let nonce: Int
    open let position: String
    open let positionSize: Double
    open let positionCompliment: Double
    open let positionMaxSize: Double
    open let callSide: GDAXSide
    open let callPrice: Double
    open let callSize: Double
    open let callFunds: Double
    open let covered: Bool
    open let nextExpireTime: Date
    open let baseFunding: Double
    open let quoteBalance: Double
    open let quoteFunding: Double
    open let privateUpdate: Bool
    
    public required init(json: [String: Any]) throws {
        
        guard let timestamp = (json["timestamp"] as? String)?.dateFromISO8601 else {
            throw GDAXError.responseParsingFailure("timestamp")
        }
        
        guard let userId = json["user_id"] as? String else {
            throw GDAXError.responseParsingFailure("user_id")
        }
        
        guard let profileId = json["profile_id"] as? String else {
            throw GDAXError.responseParsingFailure("profile_id")
        }
        
        guard let nonce = json["nonce"] as? Int else {
            throw GDAXError.responseParsingFailure("nonce")
        }
        
        guard let position = json["position"] as? String else {
            throw GDAXError.responseParsingFailure("position")
        }
        
        guard let positionSize = Double(json["position_size"] as? String ?? "") else {
            throw GDAXError.responseParsingFailure("position_size")
        }
        
        guard let positionCompliment = Double(json["position_compliment"] as? String ?? "") else {
            throw GDAXError.responseParsingFailure("position_compliment")
        }
        
        guard let positionMaxSize = Double(json["position_max_size"] as? String ?? "") else {
            throw GDAXError.responseParsingFailure("position_max_size")
        }
        
        guard let callSide = GDAXSide(rawValue: json["call_side"] as? String ?? "") else {
            throw GDAXError.responseParsingFailure("call_side")
        }
        
        guard let callPrice = Double(json["call_price"] as? String ?? "") else {
            throw GDAXError.responseParsingFailure("call_price")
        }
        
        guard let callSize = Double(json["call_size"] as? String ?? "") else {
            throw GDAXError.responseParsingFailure("call_size")
        }
        
        guard let callFunds = Double(json["call_funds"] as? String ?? "") else {
            throw GDAXError.responseParsingFailure("call_funds")
        }
        
        guard let covered = json["covered"] as? Bool else {
            throw GDAXError.responseParsingFailure("covered")
        }
        
        guard let nextExpireTime = (json["next_expire_time"] as? String)?.dateFromISO8601 else {
            throw GDAXError.responseParsingFailure("next_expire_time")
        }
        
        guard let baseFunding = Double(json["base_funding"] as? String ?? "") else {
            throw GDAXError.responseParsingFailure("base_funding")
        }
        
        guard let quoteBalance = Double(json["quote_balance"] as? String ?? "") else {
            throw GDAXError.responseParsingFailure("quote_balance")
        }
        
        guard let quoteFunding = Double(json["quote_funding"] as? String ?? "") else {
            throw GDAXError.responseParsingFailure("quote_funding")
        }
        
        guard let privateUpdate = json["private"] as? Bool else {
            throw GDAXError.responseParsingFailure("private")
        }
        
        self.timestamp = timestamp
        self.userId = userId
        self.profileId = profileId
        self.nonce = nonce
        self.position = position
        self.positionSize = positionSize
        self.positionCompliment = positionCompliment
        self.positionMaxSize = positionMaxSize
        self.callSide = callSide
        self.callPrice = callPrice
        self.callSize = callSize
        self.callFunds = callFunds
        self.covered = covered
        self.nextExpireTime = nextExpireTime
        self.baseFunding = baseFunding
        self.quoteBalance = quoteBalance
        self.quoteFunding = quoteFunding
        self.privateUpdate = privateUpdate
        
        try super.init(json: json)
    }
}
