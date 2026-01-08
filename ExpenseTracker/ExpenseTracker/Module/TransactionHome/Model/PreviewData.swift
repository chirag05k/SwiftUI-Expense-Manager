//
//  PreviewData.swift
//  ExpenseTracker
//
//  Created by Chirag V on 29/12/25.
//

import Foundation

var transactionPrevoiewData = Transaction(id: 1,
                                          date: "01/24/2022",
                                          institution: "ICICI",
                                          account: "VISA",
                                          merchant: "Apple",
                                          amount: 11.50,
                                          type: TransactionType.debit.rawValue,
                                          categoryId: 11,
                                          category: TransactionCategory.sofwtare.rawValue,
                                          isPending: false,
                                          isTransfer: false,
                                          isExpense: true,
                                          isEdited: false)

var transactionListPreviewData = [Transaction](repeating: transactionPrevoiewData, count: 10)
