//
//  WWidgetMedium.swift
//  WalletApp
//
//  Created by Dimitar Stefanovski on 8/3/20.
//

import SwiftUI
import WidgetKit

struct WWidgetMedium: View {
    
    var transactions: [Transaction]

    init(transactions: [Transaction] = mockLast2Transactions) {
        self.transactions = transactions
    }
    
    var body: some View {
        
        ZStack(alignment: .top) {
            
            // App icon
            VStack {
                Image(uiImage: #imageLiteral(resourceName: "netcetera_logo"))
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .frame(width: 26, height: 26)
                    .clipShape(RoundedRectangle(cornerRadius: 6))
            }
            .frame(maxWidth: .infinity, alignment: .topTrailing)
            
            VStack(alignment: .leading) {
                
                HStack {
                    // Last transaction
                    Text("Last transactions")
                        .font(Fonts.headingMedium)
                        .foregroundColor(Colors.Text.secondary1)
                }
                .frame(maxWidth: .infinity, alignment: .leading)                
                
                Spacer()
                
                ForEach(self.transactions, id: \.self) { transaction in
                    Link(destination: URL(string: transaction.stringId)!) {
                        VStack {
                            HStack {
                                
                                //Line
                                RoundedRectangle(cornerRadius: 1)
                                    .fill(Colors.Transaction.positive)
                                    .frame(width: 2, height: 34)
                                
                                VStack(alignment: .leading) {
                                    HStack {
                                        
                                        //Card logo
                                        Image(uiImage: UIImage(named: transaction.card.cardImage)!)
                                            .resizable()
                                            .aspectRatio(contentMode: .fill)
                                            .frame(width: 28, height: 18)
                                            .clipped()
                                        
                                        //Card name
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
                        }
                    }
                    // Separator
                    Rectangle()
                        .fill(Colors.separator)
                        .frame(height: 1.0)
                }
            }
            
        }
        .padding(16)
        
    }
}

struct WWidgetMedium_Previews: PreviewProvider {
    static var previews: some View {
        WWidgetMedium()
            .previewContext(WidgetPreviewContext(family: .systemMedium))
            .previewDevice(PreviewDevice(rawValue: "iPhone X"))
            .previewDisplayName("iPhone X")
    }
}
