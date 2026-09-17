//
//  TransactionPage.swift
//  TransactionDemo
//
//  Created by Bhushan Sangale on 12/08/26.
//

import Foundation

struct TransactionPage:Codable{
    let page:Int
    let pageSize:Int
    let totalPages:Int
    let transactions:[Transaction]
}
