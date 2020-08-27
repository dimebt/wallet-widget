//
//  ContentView.swift
//  Shared
//
//  Created by Dimitar Stefanovski on 8/2/20.
//

import SwiftUI

struct ContentView: View {
    
    @State var transactionId: String = "Not set yet!"
    
    var body: some View {
        NavigationView {
            WWidgetPreview(transaction: Helper.getTransaction(from: transactionId))
                .onOpenURL(perform: { (transactionId) in
                    self.transactionId = transactionId.absoluteString
                })
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
