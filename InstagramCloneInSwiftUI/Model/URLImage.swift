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
                // 이미지 로딩 중에 표시할 임시 이미지
                // https://github.com/Juanpe/SkeletonView
                // https://github.com/facebookarchive/Shimmer
            }
            .fade(duration: 0.25) // 이미지 로드가 되면 페이드 인 효과로 이미지 표시
            .resizable()
            .aspectRatio(contentMode: .fill)
            .frame(width: size?.width, height: size?.height)
        
    }
}
