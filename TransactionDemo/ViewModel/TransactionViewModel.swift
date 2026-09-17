//
//  TransactionViewModel.swift
//  TransactionDemo
//
//  Created by Bhushan Sangale on 12/08/26.
//

import Foundation
import Combine


@MainActor
final class TransactionViewModel:ObservableObject{
    @Published private(set) var transactions: [Transaction] = []
    @Published private(set) var isLoading = false
    @Published private(set) var isErrorMsg:String?
    
    
    private let repo:TransactionRepository
    
    private var currentPage  = 0
    private var totalPage = 1
    
    
    @Published var filter : TransactionFilter = .all
    
    init(repo:TransactionRepository){
        self.repo = repo
    }
    
    func load() async{
        var chache: [Transaction] = []
        do {
             chache =  try await repo.cachedTransactions()
        } catch {
            // error
        }
        
        if !chache.isEmpty {
            transactions = chache
        }
       await reload()
    }
    
    func reload() async {
        currentPage = 0
        totalPage = 1
        if transactions.isEmpty {
            isLoading = true
        }
        isErrorMsg = nil
        
        defer {
            isLoading = false
        }
        do{
            let result = try await repo.fetchTransactions(page: currentPage, filter: filter)
            
            transactions = result.transactions
            currentPage = result.page
            totalPage = result.totalPages
        }catch{
           // error
        }
    }
}
