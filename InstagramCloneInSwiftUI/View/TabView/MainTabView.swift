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
            
            Text("프로필뷰")
                .tabItem {
                    Image("profile")
                }
            
        }
        
    }
}

#Preview {
    MainTabView()
}
