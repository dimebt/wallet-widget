//
//  Constants.swift
//  WalletApp
//
//  Created by Dimitar Stefanovski on 8/3/20.
//

import SwiftUI

struct Colors {
    
    static let background = Color(#colorLiteral(red: 1, green: 1, blue: 1, alpha: 1))
    static let separator = Color(#colorLiteral(red: 0, green: 0, blue: 0, alpha: 0.1))
    
    struct Text {
        static let primary = Color(#colorLiteral(red: 0, green: 0, blue: 0, alpha: 1))
        static let secondary1 = Color(#colorLiteral(red: 0, green: 0, blue: 0, alpha: 0.5))
        static let secondary2 = Color(#colorLiteral(red: 0.5, green: 0.5, blue: 0.5, alpha: 1))
    }
    
    struct Transaction {
        static let text = Color(#colorLiteral(red: 1, green: 1, blue: 1, alpha: 1))
        static let positive = Color(#colorLiteral(red: 0, green: 0.8291666507720947, blue: 0.6301666498184204, alpha: 1))
        static let negative = Color(#colorLiteral(red: 0.9411764740943909, green: 0.3921568691730499, blue: 0.2862745225429535, alpha: 1))
        static let backgroundList = Color(#colorLiteral(red: 0.9568627451, green: 0.9568627451, blue: 0.9568627451, alpha: 1))
    }
}

struct Fonts {
    static let headingRegular = Font.system(size: 12, weight: .regular)
    static let headingMedium = Font.system(size: 12, weight: .medium)
    static let headingLight = Font.system(size: 10, weight: .light)
    static let subtitleSemiBold = Font.system(size: 10, weight: .semibold)
    static let captionRegular = Font.system(size: 8, weight: .regular)
    static let captionLight = Font.system(size: 9, weight: .light)
    static let transactionSmall = Font.system(size: 10, weight: .semibold)
    static let transaction = Font.system(size: 18, weight: .bold)
    static let balance = Font.system(size: 18, weight: .ultraLight)
    static let cardName = Font.system(size: 15, weight: .semibold)
    static let cardHolder = Font.system(size: 8, weight: .semibold)
    static let cardHolderName = Font.system(size: 12, weight: .medium)
}
