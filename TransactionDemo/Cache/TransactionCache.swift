//
//  TransactionCache.swift
//  TransactionDemo
//
//  Created by Bhushan Sangale on 12/08/26.
//

import Foundation
actor TransactionCache {
    private var transactions:[Transaction] = []
    
    func save(_ newTransaction:[Transaction]){
        transactions = newTransaction
    }
    func load() -> [Transaction]{
       transactions
    }
}
