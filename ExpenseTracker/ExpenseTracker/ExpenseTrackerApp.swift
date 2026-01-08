//
//  ExpenseTrackerApp.swift
//  ExpenseTracker
//
//  Created by Chirag V on 29/12/25.
//

import SwiftUI

@main
struct ExpenseTrackerApp: App {
    @StateObject var transactionListVM = TransactionListViewModel()
    
    var body: some Scene {
        WindowGroup {
            TransactionHomeView()
                .environmentObject(transactionListVM)
        }
    }
}
