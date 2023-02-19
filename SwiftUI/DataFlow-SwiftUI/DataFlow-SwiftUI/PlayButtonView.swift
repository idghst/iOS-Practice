//
//  PlayingButtonView.swift
//  DataFlow-SwiftUI
//
//  Created by idghst on 2023/02/19.
//

import SwiftUI

struct PlayButtonView: View {
    @Binding var isPlaying: Bool
    
    var body: some View {
        Button {
            self.isPlaying.toggle()
        } label: {
            Image(systemName: isPlaying ? "pause.circle" : "play.circle")
                .resizable()
                .aspectRatio(contentMode: .fit)
                .frame(height: 80)
                .foregroundColor(.primary)
        }
    }
}
