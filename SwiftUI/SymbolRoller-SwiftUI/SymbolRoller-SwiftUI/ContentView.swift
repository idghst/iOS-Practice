//
//  ContentView.swift
//  SymbolRoller-SwiftUI
//
//  Created by idghst on 2023/02/25.
//

import SwiftUI

struct ContentView: View {
    
    let symbols: [String] = [
        "sun.min",
        "moon",
        "cloud",
        "wind",
        "snowflake",
    ]
    
    @State var imageName: String = "moon"
    
    var body: some View {
        VStack {
            
            Spacer()
            
            Image(systemName: imageName)
                .renderingMode(.template)
                .resizable()
                .aspectRatio(contentMode: .fit)
                .padding()
            
            Spacer()
            
            Text(imageName)
                .font(.system(size: 40, weight: .bold))
            
            Button {
                imageName = symbols.randomElement()!
            } label: {
                HStack{
                    Image(systemName: "arrow.3.trianglepath")
                    VStack{
                        Text("Reload")
                            .font(.system(size: 30, weight: .bold, design: .default))
                        Text("click me to reload")
                    }
                }
                .foregroundColor(.white)
                
            }
            .frame(maxWidth: .infinity, minHeight: 80)
            .background(.pink)
            .clipShape(Capsule()) // 좌우를 무조건 둥글게 // 그 외 커스텀은 cornerRadius 사용
            .padding()
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
