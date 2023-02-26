//
//  StockRank_SwiftUIApp.swift
//  StockRank-SwiftUI
//
//  Created by idghst on 2023/02/25.
//

import SwiftUI

@main
struct StockRank_SwiftUIApp: App {
    var body: some Scene {
        WindowGroup {
            StockRankView()
                .preferredColorScheme(.dark) // 무조건 다크모드
        }
    }
}
