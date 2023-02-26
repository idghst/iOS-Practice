//
//  FrameworkCell.swift
//  AppleFramework-SwiftUI
//
//  Created by idghst on 2023/02/27.
//

import SwiftUI

struct FrameworkCell: View {
    
    var framework: AppleFramework
    
    var body: some View {
        VStack {
            Image(framework.imageName)
                .resizable()
                .aspectRatio(contentMode: .fit)
            
            Spacer()
            
            Text(framework.name)
                .font(.system(size: 16, weight: .bold))
            
            Spacer()
        }
    }
}

struct FrameworkCell_Previews: PreviewProvider {
    static var previews: some View {
        FrameworkCell(framework: AppleFramework.list[5])
            .previewLayout(.fixed(width: 160, height: 200))
    }
}
