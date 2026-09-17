//
//  TransactionDemoApp.swift
//  TransactionDemo
//
//  Created by Bhushan Sangale on 12/08/26.
//

import SwiftUI

@main
struct TransactionDemoApp: App {
    var body: some Scene {
        WindowGroup {
            TransactionView(viewModel: makeViewModel())
        }
    }
    
    private func makeViewModel() -> TransactionViewModel {
        let api: TransactionAPI = try! TransactionAPILocal()
       
        
       let cache = TransactionCache()
        
     let repo = TransactionRepoDefault(api: api, cache: cache)
        return TransactionViewModel(repo: repo)
    }
}
