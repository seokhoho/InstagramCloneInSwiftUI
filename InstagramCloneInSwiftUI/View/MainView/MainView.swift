//
//  MainView.swift
//  InstagramCloneInSwiftUI
//


import SwiftUI

struct MainView: View {
    
    var userStore: Store
    
    var body: some View {
        NavigationStack {
            ScrollView {
                
                StoryView(userStore: userStore)
            
                Divider()
            
                FeedView(store: userStore)
                
            } // ScrollView
            
            .toolbar {
                ToolbarItem(placement: .topBarLeading) {
                    NavigationLink {
                        
                        // 카메라
                        
                    } label: {
                        Image("carmera")
                    }
                }
                
                ToolbarItem(placement: .topBarLeading) {
                    
                    Image("navigationLogo")
                        .padding(.leading, 79)
                }
                
                ToolbarItem(placement: .topBarTrailing) {
                    NavigationLink {
                        
                        // 메세지 뷰
                        
                    } label: {
                        Image("messanger")
                    }
                }
            }
            
            
        } // NavigationStack
        
        
    }
}

#Preview {
    MainView(userStore: Store())
}
