//
//  ContentView.swift
//  StockRank-SwiftUI
//
//  Created by idghst on 2023/02/25.
//

import SwiftUI

struct StockRankView: View {
    
    @State var list = StockModel.list
    
    var body: some View {
        NavigationView {
            List($list) { $list in
                ZStack {
                    NavigationLink {
                        StockDetailView(stock: $list)
                    } label: {
                        EmptyView()
                    }
                    StockRankRow(stock: $list)
                }
                .listRowInsets(EdgeInsets())
                .listRowSeparator(.hidden)
                .frame(height: 80)
            }
            .listStyle(.plain)
            .navigationTitle("Stock Rank")
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        StockRankView()
    }
}
