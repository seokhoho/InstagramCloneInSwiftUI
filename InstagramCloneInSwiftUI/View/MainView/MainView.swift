//
//  MainView.swift
//  InstagramCloneInSwiftUI
//


import SwiftUI

struct MainView: View {
    
    @ObservedObject var feedStore: FeedStore
    @ObservedObject var userStore: UserStore
    @ObservedObject var storyStore: StoryStore
    
    var body: some View {
        NavigationStack {
            ScrollView {
                
                StoryView(userStore: userStore, storyStore: storyStore)
            
                Divider()
            
                FeedView(feedStore: feedStore, userStore: userStore)
                
            } // ScrollView
            
            .toolbar {
                ToolbarItem(placement: .navigation) {
                    VStack {
                        HStack {
                            Button {
                                
                                // 카메라
                                
                            } label: {
                                Image("carmera")
                                    .padding(.horizontal)
                            }
                            
                            Spacer()
                            
                            Image("navigationLogo")
                                
                            Spacer()
                            
                            NavigationLink {
                                
                                // 메세지 뷰
                                
                            } label: {
                                Image("messanger")
                                    .padding(.leading)
                            }
                        }
                        .frame(width: UIScreen.main.bounds.width)
                    }
                }
            }
            // 화이트 모드를 위해 흰색 배경
            .background(Color.white)
        } // NavigationStack
        
        
    }
}

#Preview {
    MainView(feedStore: FeedStore(), userStore: UserStore(), storyStore: StoryStore())
}
