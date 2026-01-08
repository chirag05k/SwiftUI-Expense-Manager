//
//  ContentView.swift
//  ExpenseTracker
//
//  Created by Chirag V on 29/12/25.
//

import SwiftUI
import SwiftUICharts

struct TransactionHomeView: View {
    @EnvironmentObject var transactionListVM: TransactionListViewModel
    //    var demoData: [Double] = [8,2,4,6,12,9,2]
    
    var body: some View {
        VStack {
            NavigationView {
                ScrollView {
                    VStack(alignment: .leading, spacing: 24) {
                        Text("Overview")
                            .font(.title2)
                            .bold()
                        
                        // Chart
                        let data = transactionListVM.accumulateTransaction()
                        if !data.isEmpty {
                            let totalExpense = data.last?.1 ?? 0
                            
                            CardView {
                                VStack(alignment: .leading) {
                                    ChartLabel(totalExpense.formatted(.currency(code: "USD")), type: .title, format: "$%.02f")
                                    LineChart()
                                }
                                .background(Color.systemBackground)
                            }
                            .data(data)
                            .chartStyle(ChartStyle(backgroundColor: Color.systemBackground, foregroundColor: ColorGradient(Color.icon.opacity(0.4), Color.icon)))
                            .frame(height: 300)
                        }
                        
                        //Transaction List
                        RecentTransactionListView()
                    } // VStack
                    .padding()
                    .frame(maxWidth: .infinity)
                } // ScrollView
                .background(Color.background)
                .navigationBarTitleDisplayMode(.inline)
                .toolbar {
                    ToolbarItem {
                        Image(systemName: "bell.badge")
                            .symbolRenderingMode(.palette)
                            .foregroundStyle(Color.icon, .primary)
                    }
                }
            } // NavigationView
            .navigationViewStyle(.stack)
            .accentColor(.primary)
        }
    }
}

#Preview {
    let transactionListVM: TransactionListViewModel = {
        let transactionListVM = TransactionListViewModel()
        transactionListVM.transactions = transactionListPreviewData
        return transactionListVM
    }()
    
    TransactionHomeView()
        .environmentObject(transactionListVM)
}
