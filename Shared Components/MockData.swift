//
//  MockData.swift
//  WalletApp
//
//  Created by Dimitar Stefanovski on 8/4/20.
//

import Foundation

struct Card {
    let name: String
    let cardImage: String
    let number: String
    let account: String
    let balance: Double
    let cardHolder: String
    
    var stringBalance: String {
        return Helper.formatAmount(value: balance)
    }
}

struct Transaction: Hashable, Identifiable {
    var id: UUID = UUID()
    var stringId: String
    let card: Card
    let amount: Double
    let currency: String
    let timestamp: String
    
    static func == (lhs: Transaction, rhs: Transaction) -> Bool {
        return lhs.id == rhs.id
    }
    
    func hash(into hasher: inout Hasher) {
        hasher.combine(id)
    }
    
    var stringAmount: String {
        return Helper.formatAmount(value: amount)
    }

}

struct Helper {
    
    static func formatAmount(value: Double) -> String {
        let amountFormatter = NumberFormatter()
        amountFormatter.currencySymbol = "€"
        amountFormatter.alwaysShowsDecimalSeparator = true
        amountFormatter.decimalSeparator = ","
        amountFormatter.maximumFractionDigits = 2
        amountFormatter.numberStyle = .currencyAccounting
        amountFormatter.locale = Locale(identifier: "de")
        amountFormatter.positivePrefix = "+ "
        amountFormatter.negativePrefix = "- "
    
        return String(amountFormatter.string(from: NSNumber(value: value))!)
    }
    
    static func getTransaction(from stringId: String) -> Transaction {
        for transaction in mockTransactions {
            if transaction.stringId == stringId {
                return transaction
            }
        }
        return zeroTransaction
    }
}


let visa = Card(name: "Visa",
                cardImage: "visa",
                number: "**** **** **** **11",
                account: "6236782353 EUR",
                balance: 13356.00,
                cardHolder: "MARIJA STOJANOVSKA")

let masterCard = Card(name: "MasterCard",
                      cardImage: "mastercard1",
                      number: "**** **** **** **22",
                      account: "885654454115 MKD",
                      balance: 23662.00,
                      cardHolder: "DAVID TRAJKOVSKI")

let masterCardPay = Card(name: "MasterCard Debit paypass",
                         cardImage: "mastercard2",
                         number: "**** **** **** **41",
                         account: "34478765446 EUR",
                         balance: 69458.00,
                         cardHolder: "DIMITAR STEFANOVSKI")

let maestro = Card(name: "Maestro",
                   cardImage: "maestro",
                   number: "**** **** **** **74",
                   account: "684454388923 MKD",
                   balance: 5841.00,
                   cardHolder: "MICHAEL OWEN")



let trx1 = Transaction(stringId: "0",
                       card: visa,
                       amount: 5.00,
                       currency: "EUR",
                       timestamp: "Today at 10:13")

let trx2 = Transaction(stringId: "1",
                       card: maestro,
                       amount: -67.00,
                       currency: "EUR",
                       timestamp: "Today at 23:54")

let trx3 = Transaction(stringId: "2",
                       card: masterCard,
                       amount: 230.00,
                       currency: "EUR",
                       timestamp: "Yesterday at 13:04")

let zeroTransaction = Transaction(stringId: "3",
                                  card: masterCard,
                                  amount: 0.00,
                                  currency: "EUR",
                                  timestamp: "Yesterday at 00:00")

let mockTransactions = [trx1, trx2, trx3]
let mockLast2Transactions = [trx2, trx3]
