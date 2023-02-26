//
//  ContentView.swift
//  AppleFramework-SwiftUI
//
//  Created by idghst on 2023/02/27.
//

import SwiftUI

struct FrameworkListView: View {
    
    @State var list: [AppleFramework] = AppleFramework.list
    
    let layout: [GridItem] = [
        GridItem(.fixed(50)), // 고정 크기로 넣기
        GridItem(.flexible()), // 그리드 아이템의 1/n 크기로 1개 넣기
        GridItem(.adaptive(minimum: 50)),
        /// 해당 영역에서 최소 크기로 들어갈 수 있는 개수 파악 후 flexible 크기로 넣기
        /// .. 해당 예제에서는 3번째 남은 영역에서 50 크기로 들어갈 수 있는 개수를 (2개) 파악 후
        /// .. 2개를 넣는다. 넣을 때 크기는 나누는 50이 아닌 자동 계산하여 flexible 로 동일한 크기로 넣는다
    ]
    
    var body: some View {
        NavigationView {
            ScrollView {
                LazyVGrid(columns: layout) {
                    ForEach(list) { item in
                        FrameworkCell(framework: item)
                    }
                }
                .padding([.top, .leading, .trailing], 16.0)
            }
            .navigationTitle("☀️ Apple Framework")
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        FrameworkListView()
    }
}
