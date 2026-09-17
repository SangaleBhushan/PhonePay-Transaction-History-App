//
//  Transaction.swift
//  TransactionDemo
//
//  Created by Bhushan Sangale on 12/08/26.
//

import Foundation

struct Transaction:Identifiable , Codable , Hashable{
    
    let id:String
    let name:String
    let type: TransactionType
    let amount:Decimal
    let currency:String
    let status:TransactionStatus
    let not:String?
    let instrument:String
    let timestamp:String
    let avatarUrl:URL?
}


enum TransactionType:String ,Codable{
    case debit =  "DEBIT"
    case credit = "CREDIT"
}
enum TransactionStatus:String , Codable{
    case success = "SUCCESS"
    case failed = "FAILED"
    case pending = "PENDING"
}
enum PaymentInstrument:String , Codable{
    case upi = "UPI"
    case card = "CARD"
    case wallet = "WALLET"
}

enum TransactionFilter{
    case all
    case sent
    case received
    
    var value:String{
        switch self{
        case .all:
            return "ALL"
        case .received:
            return "RECEIVED"
        case .sent:
            return "SENT"
        }
    }
}
