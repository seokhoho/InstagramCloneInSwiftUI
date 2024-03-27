//
//  FeedView.swift
//  InstagramCloneInSwiftUI
//

import SwiftUI

struct FeedView: View {
    
    // 피드 데이터 // 옵져브드 오브젝트, 이노베이먼트?
    @ObservedObject var feedStore: FeedStore
    @ObservedObject var userStore: UserStore
    
    var body: some View {
        VStack(spacing: 0) {
            
            // 피드 데이터 나열
            ForEach(feedStore.dummyFeed) { feed in
                
                // 피드 셀에 데이터 넣기
                FeedCell(feedId: feed.id, feed: feed, user: userStore.dummy.first { $0.id == feed.userId }!, feedStore: feedStore, userStore: userStore)
                
                Divider()
            }
        }
    }
}

#Preview {
    FeedView(feedStore: FeedStore(), userStore: UserStore())
}
