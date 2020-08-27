//
//  WWidgetPreview.swift
//  WalletApp
//
//  Created by Dimitar Stefanovski on 8/27/20.
//

import SwiftUI

struct WWidgetPreview: View {
    
    var transaction: Transaction
    
    init(transaction: Transaction) {
        self.transaction = transaction
    }
    
    var body: some View {
        
        ZStack(alignment: .top) {
            
            VStack(alignment: .leading) {
                
                VStack {
                    
                    HStack {
                        // Transaction list
                        Text("Transaction")
                            .font(Fonts.headingMedium)
                            .foregroundColor(Colors.Text.secondary1)
                    }
                    .frame(maxWidth: .infinity, alignment: .leading)
                    
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

struct WWidgetPreview_Previews: PreviewProvider {
    static var previews: some View {
        WWidgetPreview(transaction: mockTransactions.first!)
    }
}
