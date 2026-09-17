//
//  TransactionAPI.swift
//  TransactionDemo
//
//  Created by Bhushan Sangale on 12/08/26.
//

import Foundation

protocol TransactionAPI{
    func fetchTransactions(page:Int,pageSize:Int,type:TransactionFilter) async throws -> TransactionPage
}
