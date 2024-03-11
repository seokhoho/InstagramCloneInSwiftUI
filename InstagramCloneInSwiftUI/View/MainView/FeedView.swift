//
//  FeedView.swift
//  InstagramCloneInSwiftUI
//

import SwiftUI

struct FeedView: View {
    
    // 피드 데이터
    let store: Store
    
    var body: some View {
        VStack(spacing: 0) {
            
            // 피드 데이터 나열
            ForEach(store.dummyFeed) { feed in
                
                // 피드 셀에 데이터 넣기
                FeedCell(feed: feed, user: store.dummy.first { $0.id == feed.userId }!)
                
                Divider()
            }
        }
    }
}

#Preview {
    FeedView(store: Store())
}
