//
//  WWidget.swift
//  WalletApp
//
//  Created by Dimitar Stefanovski on 8/3/20.
//

import SwiftUI
import WidgetKit

struct WWidgetSmall: View {
    
    var transaction: Transaction

    init(transaction: Transaction = mockTransactions.last!) {
        self.transaction = transaction
    }
    
    var body: some View {
        
        VStack(alignment: .leading) {
            
            HStack {
                
                VStack(alignment: .leading) {
                    // Last transaction
                    Text("Last transaction")
                        .font(Fonts.headingMedium)
                        .foregroundColor(Colors.Text.secondary1)
                    
                    // Transaction date
                    Text(transaction.timestamp)
                        .font(Fonts.headingLight)
                        .foregroundColor(Colors.Text.secondary2)
                }
                
                // App icon
                Image(uiImage: #imageLiteral(resourceName: "netcetera_logo"))
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .frame(width: 26, height: 26)
                    .clipShape(RoundedRectangle(cornerRadius: 6))
            }
            
            VStack {
                HStack {
                    
                    //Line
                    RoundedRectangle(cornerRadius: 1)
                        .fill(Colors.Transaction.positive)
                        .frame(width: 2, height: 37)
                    
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
                    }
                }
            }
            
            ZStack {
                
                //Transaction Background
                RoundedRectangle(cornerRadius: 7)
                    .fill(transaction.amount > 0 ? Colors.Transaction.positive : Colors.Transaction.negative)
                    .frame(width: 129, height: 36)
                    .shadow(color: Color(#colorLiteral(red: 0, green: 0, blue: 0, alpha: 0.25)), radius: 8, x: 2, y: 2)
                
                //Transaction amount
                Text(transaction.stringAmount).font(Fonts.transaction)
                    .foregroundColor(Colors.Transaction.text)
                    .multilineTextAlignment(.center)
            }
            
            
            
        }
        .padding(16)
        
    }
}

struct WWidget_Previews: PreviewProvider {
    static var previews: some View {
        WWidgetSmall()
            .previewContext(WidgetPreviewContext(family: .systemSmall))
            .previewDevice(PreviewDevice(rawValue: "iPhone X"))
            .previewDisplayName("iPhone X")
    }
}
