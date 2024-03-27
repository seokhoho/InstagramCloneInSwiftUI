//
//  StoryView.swift
//  InstagramCloneInSwiftUI
//

import SwiftUI

struct StoryView: View {
    
    @ObservedObject var userStore: UserStore
    @ObservedObject var storyStore: StoryStore
    @State var showStorySheet: Bool = false
    
    private let gridItems: [GridItem] = [
        .init(.flexible())
    ]

    var body: some View {
        ScrollView(.horizontal) {
            LazyHGrid(rows: gridItems) {
                
                // 스토리의 첫번째는 현재 유저가 되어야한다.
                ForEach(storyStore.dummyStory) { story in
                    Button {
                        
                        // 스토리 내용이 보여지는 뷰
                        // 뷰안에서 클릭시 다음 이미지 또는 다음 유저의 스토리로 넘어가야한다.
                        showStorySheet.toggle()
                        
                    } label: {
                        
                        StoryCell(user: userStore.dummy.first(where: { $0.id == story.userId })!)
                            .padding(.horizontal, 5)
                    }
                }
            } // LazyHGrid
            .padding(.top, 9)
        } // ScrollView
        .fullScreenCover(isPresented: $showStorySheet) {
            
            Text("스토리 이미지 및 내용")
            Button {
                showStorySheet.toggle()
            } label: {
                Text("취소")
            }

        }
    }
}

#Preview {
    StoryView(userStore: UserStore(), storyStore: StoryStore())
}
