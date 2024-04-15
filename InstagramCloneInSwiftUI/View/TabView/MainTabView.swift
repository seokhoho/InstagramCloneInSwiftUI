//
//  MainTabView.swift
//  InstagramCloneInSwiftUI
//


import SwiftUI

struct MainTabView: View {
    
    @ObservedObject var feedStore = FeedStore()
    @ObservedObject var userStore = UserStore()
    @ObservedObject var storyStore = StoryStore()
    
    var body: some View {
        TabView {
            
            MainView(feedStore: feedStore, userStore: userStore, storyStore: storyStore)
                .tabItem {
                    Image("home")
                }
            
            Text("서치뷰")
                .tabItem {
                    Image("search")
                }
            
            Text("게시뷰")
                .tabItem {
                    Image("upload")
                }
            
            Text("하트뷰")
                .tabItem {
                    Image("heart")
                }
            
            // 현재유저의 정보가 들어가야한다.
            ProfileView(user: userStore.dummy[0], feedStore: feedStore, userStore: userStore)
                .tabItem {
                    // 킹피셔의 이미지가 안들어가는 이유가 뭘까?
//                    URLImage(url: URL(string: userStore.dummy[0].profileImageURL)!, size: CGSize(width: 23, height: 23))
//                        .clipShape(Circle())
                    Image("profile")
                }
            
        }
        
    }
}

#Preview {
    MainTabView()
}
