//
//  StockDetailView.swift
//  StockRank-SwiftUI
//
//  Created by idghst on 2023/02/27.
//

import SwiftUI

struct StockDetailView: View {
    
    @Binding var stock: StockModel
    
    var body: some View {
        VStack(spacing: 40) {
            Image(stock.imageName)
                .resizable()
                .aspectRatio(contentMode: .fit)
                .frame(width: 120, height: 120)
            Text(stock.name)
                .font(.system(size: 30, weight: .bold))
            Text("\(stock.price) 원")
                .font(.system(size: 20, weight: .bold))
                .foregroundColor(stock.diff > 0 ? .red : .blue)
        }
        .padding()
    }
}

struct StockDetailView_Previews: PreviewProvider {
    static var previews: some View {
        StockDetailView(stock: .constant(StockModel.list[0]))
            .preferredColorScheme(.dark)
    }
}
