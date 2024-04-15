//
//  URLImage.swift
//  InstagramCloneInSwiftUI
//
//  Created by 정석호 on 2024/03/12.
//

import SwiftUI
import Kingfisher

struct URLImage {
    var url: URL
    var size: CGSize?
}

extension URLImage: View {
    var body: some View {
        KFImage(url)
            .placeholder {
                Color.gray
                    .opacity(0.2)
            }
            .fade(duration: 0.25) 
            .resizable()
            .aspectRatio(contentMode: .fill)
            .frame(width: size?.width, height: size?.height)
        
    }
}
