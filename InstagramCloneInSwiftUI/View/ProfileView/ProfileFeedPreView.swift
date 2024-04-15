//
//  ProfileFeedPreView.swift
//  InstagramCloneInSwiftUI
//
//  Created by 정석호 on 2024/04/02.
//

import SwiftUI

struct ProfileFeedPreView: View {
    
    var user: User
    @ObservedObject var feedStore: FeedStore
    
    private let gridItems: [GridItem] = [
        .init(.flexible(), spacing: 1),
        .init(.flexible(), spacing: 1),
        .init(.flexible(), spacing: 1)
    ]
        
    var body: some View {
        
        LazyVGrid(columns: gridItems, spacing: 1) {
            ForEach(feedStore.dummyFeed.filter { $0.userId == user.id }) { feed in
                
                // 누른 피드부터 아래로 이전 피드, 위로는 다음 피드가 순차적으로 나온다.
                // 피드를 새로만들어야할까?
                NavigationLink {
                    
                    URLImage(url: URL(string:feed.feedImageURL[0])!)
                    
                } label: {
                    // 사진의 사이즈를 두게되면 전 기기에 대응하지 못한다.
                    URLImage(url: URL(string:feed.feedImageURL[0])!, size: CGSize(width: 125, height: 125))
                        .clipped()
                        .overlay {
                            // 여러장 또는 영상일 때, 영상은 어떻게 확인하지 확인할 방법이 필요하다 피드에 프로퍼티 추가해야한다.
                            if feed.feedImageURL.count > 1 {
                                VStack {
                                    HStack {
                                        Spacer()
                                        Image("gallery")
                                            .padding(.top, 8)
                                            .padding(.trailing, 8)
                                    }
                                    Spacer()
                                }
                            } 
                            // 비디오 일 때
                            
                        }
                }
            }
        }
        .frame(height: UIScreen.main.bounds.height)
        
        
    }
}

#Preview {
    ProfileFeedPreView(user: User(id: "333", name: "pooh", profileImageURL: "https://i.postimg.cc/pTxz2zmm/pooh.jpg", story: [], liveState: false),feedStore: FeedStore())
}
