//
//  TransactionRepository.swift
//  TransactionDemo
//
//  Created by Bhushan Sangale on 12/08/26.
//

import Foundation

protocol TransactionRepository{
    func fetchTransactions(page:Int, filter: TransactionFilter) async throws -> TransactionPage
    func cachedTransactions() async throws -> [Transaction]
    func save(_ transaction:[Transaction]) async
}
