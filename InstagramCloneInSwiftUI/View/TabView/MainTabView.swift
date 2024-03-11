//
//  MainTabView.swift
//  InstagramCloneInSwiftUI
//


import SwiftUI

struct MainTabView: View {
    
    var store = Store()
    
    var body: some View {
        TabView {
            
            MainView(userStore: store)
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
