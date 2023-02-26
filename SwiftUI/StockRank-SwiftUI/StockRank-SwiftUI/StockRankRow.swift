//
//  StockRankRow.swift
//  StockRank-SwiftUI
//
//  Created by idghst on 2023/02/25.
//

import SwiftUI

struct StockRankRow: View {
    
    @Binding var stock: StockModel
    
    var body: some View {
        HStack{
            Text("\(stock.rank)")
                .font(.system(size: 20, weight: .bold))
                .frame(width: 30)
                .foregroundColor(.blue)
            Image("\(stock.imageName)")
                .resizable()
                .aspectRatio(contentMode: .fit)
                .frame(width: 40, height: 40)
            VStack(alignment: .leading, spacing: 5){
                Text("\(stock.name)")
                    .font(.system(size: 12))
                HStack{
                    Text("\(stock.price) 원")
                        .font(.system(size: 12))
                        .foregroundColor(.gray)
                    Text("\(stock.diff * 100, specifier: "%.2f") %")
                        .font(.system(size: 12))
                        .foregroundColor(stock.diff > 0 ? .red : .blue)
                }
            }
            Spacer()
            Image(systemName: "heart.fill")
                .resizable()
                .renderingMode(.template)
                .aspectRatio(contentMode: .fit)
                .frame(width: 30, height: 30)
                .foregroundColor(.gray)
            
        }
        .foregroundColor(.white)
        .padding()
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .background(.black)
    }
}

struct StockRankRow_Previews: PreviewProvider {
    static var previews: some View {
        StockRankRow(stock: .constant(StockModel.list[1]))
    }
}
