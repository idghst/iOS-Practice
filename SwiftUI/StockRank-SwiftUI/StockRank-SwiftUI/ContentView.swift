//
//  ContentView.swift
//  StockRank-SwiftUI
//
//  Created by idghst on 2023/02/25.
//

import SwiftUI

struct ContentView: View {
    
    @State var list = StockModel.list
    
    var body: some View {
        List(list) { stock in
            StockRankRow(stock: stock)
                .listRowInsets(EdgeInsets(top: 0, leading: 0, bottom: 0, trailing: 0))
                .listRowSeparator(.hidden)
                .frame(height: 80)
        }
        .listStyle(.plain)
        .background(.black)
        
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
