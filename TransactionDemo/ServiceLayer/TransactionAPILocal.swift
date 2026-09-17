//
//  TransactionAPIService.swift
//  TransactionDemo
//
//  Created by Bhushan Sangale on 12/08/26.
//

import Foundation

final class TransactionAPILocal: TransactionAPI {
    private let transactionsPage:TransactionPage
    private let transactions:[Transaction]
    
    init()throws{
        guard let url = Bundle.main.url(forResource:"transaction",withExtension: "json") else{
            print("error")
            throw URLError(.badURL)
            
        }
        let data = try Data(contentsOf:url)
        
        transactionsPage = try JSONDecoder().decode(TransactionPage.self, from: data)
        transactions = transactionsPage.transactions
    }
    
    func fetchTransactions(page:Int,pageSize:Int,type:TransactionFilter) async throws -> TransactionPage{
        let filtered:[Transaction]
        
        switch type{
        case .all:
            filtered = transactions
        case .sent:
            filtered = transactions.filter({$0.type == .debit})
        case .received:
            filtered = transactions.filter({$0.type == .credit})
        }
        
        let tpages = Int(ceil(Double(filtered.count) / Double(pageSize)))
        
        let start = (page - 1) * pageSize
        let end = min(start + pageSize , filtered.count)
        
        guard start < end else {
            return TransactionPage(
                page: page,
                pageSize:pageSize,
                totalPages: tpages,
                transactions: filtered
            )
        }
        
        return TransactionPage(
            page: page,
            pageSize:pageSize,
            totalPages: tpages,
            transactions: filtered
        )
    }
    
}
