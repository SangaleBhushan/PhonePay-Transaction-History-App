//
//  TransactionView.swift
//  TransactionDemo
//
//  Created by Bhushan Sangale on 12/08/26.
//

import SwiftUI

struct TransactionView: View {

    @StateObject private var viewModel:TransactionViewModel
    
    init(viewModel:TransactionViewModel){
        _viewModel = StateObject(wrappedValue: viewModel)
    }
    
    var body: some View {
        VStack{
            Picker("Filter",selection: $viewModel.filter){
                Text("ALL").tag(TransactionFilter.all)
                 
                Text("Sent")
                    .tag(TransactionFilter.sent)
                Text("Received")
                    .tag(TransactionFilter.received)
            }.pickerStyle(.segmented)
            .padding(16)
            transactionList
        }.navigationTitle("Transactions History")
         .task {
            await viewModel.load()
         }
      
    }
    
    private var transactionList:some View{
        ScrollView{
            
        }
    }
}


