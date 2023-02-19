//
//  ContentView.swift
//  DataFlow-SwiftUI
//
//  Created by idghst on 2023/02/19.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        PlayerView(episode: Episode.list[0])
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
