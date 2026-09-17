//
//  TransactionRepo.swift
//  TransactionDemo
//
//  Created by Bhushan Sangale on 12/08/26.
//

import Foundation

final class TransactionRepoDefault:TransactionRepository{

    private let api:TransactionAPI
    private let cache:TransactionCache
    
    init(api:TransactionAPI,cache:TransactionCache){
        self.api = api
        self.cache = cache
    }

    
    func fetchTransactions(page: Int, filter: TransactionFilter) async throws -> TransactionPage {
        let result = try await api.fetchTransactions(page: page, pageSize: 10, type: filter)
        
        await cache.save(result.transactions)
         print(result)
        return result
    }
    
    func cachedTransactions() async throws -> [Transaction] {
        await cache.load()
    }
    
    func save(_ transaction: [Transaction]) async {
        await cache.save(transaction)
    }
    
}
