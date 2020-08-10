//
//  WWidgetLarge.swift
//  WalletApp
//
//  Created by Dimitar Stefanovski on 8/3/20.
//

import SwiftUI
import WidgetKit

struct WWidgetLarge: View {
    
    var transactions: [Transaction]
    var card: Card
    
    init(transactions: [Transaction] = mockTransactions,
         card: Card = masterCardPay) {
        self.transactions = transactions
        self.card = card
    }
    
    var body: some View {
        
        ZStack(alignment: .top) {
                        
            VStack(alignment: .leading) {
                
                VStack(alignment: .leading) {
                    VStack(alignment: .leading) {
                        
                        Text("CURRENT ACCOUNT BALANCE")
                            .font(.system(size: 10, weight: .semibold))
                            .foregroundColor(Color(#colorLiteral(red: 0.62, green: 0.62, blue: 0.62, alpha: 1)))
                        
                        HStack {
                            Image(uiImage: #imageLiteral(resourceName: "mastercard1"))
                                .resizable()
                                .aspectRatio(contentMode: .fill)
                                .frame(width: 107, height: 70)
                                .clipped()
                                .frame(width: 107, height: 70)
                            
                            VStack(alignment: .leading) {
                                // Card balance
                                Text(card.stringBalance)
                                    .font(Fonts.balance)
                                //Card name
                                Text(card.name)
                                    .font(Fonts.cardName)
                                //Card number
                                Text(card.number)
                                    .font(Fonts.headingRegular)
                                    .foregroundColor(Color(#colorLiteral(red: 0, green: 0, blue: 0, alpha: 0.3)))
                                //Card holder
                                Text("CARD HOLDER")
                                    .font(Fonts.cardHolder)
                                    .foregroundColor(Color(#colorLiteral(red: 0.62, green: 0.62, blue: 0.62, alpha: 1)))
                                //Card holder name
                                Text(card.cardHolder)
                                    .font(Fonts.cardHolderName)
                                    .foregroundColor(Color(#colorLiteral(red: 0.62, green: 0.62, blue: 0.62, alpha: 1)))
                            }
                        }
                    }
                    
                    .padding(.top, 16)
                    .padding(.leading, 16)
   
                    // Separator
                    Rectangle()
                        .fill(Colors.separator)
                        .frame(height: 2.0)
                }
                .frame(maxWidth: .infinity)
                .background(Color(.white))
                
                VStack {
                    
                    HStack {
                        // Transaction list
                        Text("Transaction list")
                            .font(Fonts.headingMedium)
                            .foregroundColor(Colors.Text.secondary1)
                    }
                    .frame(maxWidth: .infinity, alignment: .leading)
                    
                    ForEach(self.transactions, id: \.self) { transaction in
                        VStack {
                            HStack {
                                
                                //Line
                                RoundedRectangle(cornerRadius: 1)
                                    .fill(Colors.Transaction.positive)
                                    .frame(width: 2, height: 34)
                                
                                VStack(alignment: .leading) {
                                    HStack {
                                        
                                        //Credit card
                                        Image(uiImage: UIImage(named: transaction.card.cardImage)!)
                                            .resizable()
                                            .aspectRatio(contentMode: .fill)
                                            .frame(width: 28, height: 18)
                                            .clipped()
                                        
                                        //Credit card logo
                                        Text(transaction.card.name)
                                            .font(Fonts.headingRegular)
                                    }
                                    
                                    //Card number
                                    Text(transaction.card.number)
                                        .font(Fonts.headingRegular)
                                        .foregroundColor(Colors.Text.secondary2)
                                }
                                .frame(width: 120.0, alignment: .leading)
                                
                                Spacer()
                                    .frame(width: 10.0)
                                
                                // Transaction amount
                                ZStack {
                                    
                                    //Transaction Background
                                    RoundedRectangle(cornerRadius: 3)
                                        .fill(transaction.amount > 0 ? Colors.Transaction.positive : Colors.Transaction.negative)
                                        .frame(width: 68, height: 18)
                                        .shadow(color: Color(#colorLiteral(red: 0, green: 0, blue: 0, alpha: 0.25)), radius: 8, x: 2, y: 2)
                                    
                                    //Transaction amount €
                                    Text(transaction.stringAmount)
                                        .font(Fonts.subtitleSemiBold)
                                        .foregroundColor(Colors.Transaction.text)
                                        .multilineTextAlignment(.center)
                                }
                                .frame(alignment: .trailing)
                                
                                // Timestamp
                                Text(transaction.timestamp)
                                    .font(Fonts.captionLight)
                                    .foregroundColor(Colors.Text.secondary2)
                                    .frame(alignment: .trailing)
                            }
                            .frame(maxWidth: .infinity, alignment: .leading)
                            
                            // Separator
                            Rectangle()
                                .fill(Colors.separator)
                                .frame(height: 1.0)
                        }
                        
                    }
                    
                }
                .padding([.leading, .bottom, .trailing], 16)
            }
            
            // App icon
            VStack {
                Image(uiImage: #imageLiteral(resourceName: "netcetera_logo"))
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .frame(width: 26, height: 26)
                    .clipShape(RoundedRectangle(cornerRadius: 6))
            }
            .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .topTrailing)
            .padding(16)
            
        }
        .background(Colors.Transaction.backgroundList)
        
    }
}

struct WWidgetLarge_Previews: PreviewProvider {
    static var previews: some View {
        WWidgetLarge()
            .previewContext(WidgetPreviewContext(family: .systemLarge))
            .previewDevice(PreviewDevice(rawValue: "iPhone X"))
            .previewDisplayName("iPhone X")
    }
}
