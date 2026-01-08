//
//  RecentTransactionListView.swift
//  ExpenseTracker
//
//  Created by Chirag V on 31/12/25.
//

import SwiftUI

struct RecentTransactionListView: View {
    @EnvironmentObject var transactionListVM: TransactionListViewModel
    
    var body: some View {
        VStack {
            HStack {
                // Header Title
                Text("Recent Transactions")
                    .bold()
                
                Spacer()
                
                // Header Link
                NavigationLink {
                    TransactionList()
                } label: {
                    HStack(spacing: 4) {
                        Text("Sell All")
                        Image(systemName: "chevron.right")
                    }
                    .foregroundStyle(.text)
                }
            } //HStack
            .padding(.top)
            
            // Recent Transaction List
            ForEach(Array(transactionListVM.transactions.prefix(5).enumerated()), id: \.element) { index, transaction in
                TransactionRow(transaction: transaction)
                Divider()
                    .opacity(index == 4 ? 0: 1)
            }
        } // VStack
        .padding()
        .background(Color.systemBackground)
        .clipShape(RoundedRectangle(cornerRadius: 20, style: .continuous))
        .shadow(color: .primary.opacity(0.2), radius: 10, x: 0, y: 5)
    }
}

#Preview {
    let transactionListVM: TransactionListViewModel = {
        let transactionListVM = TransactionListViewModel()
        transactionListVM.transactions = transactionListPreviewData
        return transactionListVM
    }()
    
    RecentTransactionListView()
        .environmentObject(transactionListVM)
}
