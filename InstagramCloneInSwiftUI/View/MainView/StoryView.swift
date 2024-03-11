//
//  StoryView.swift
//  InstagramCloneInSwiftUI
//

import SwiftUI

struct StoryView: View {
    
    var userStore: Store
    
    private let gridItems: [GridItem] = [
        .init(.flexible())
    ]

    var body: some View {
        ScrollView(.horizontal) {
            LazyHGrid(rows: gridItems) {
                
                // 스토리의 첫번째는 현재 유저가 되어야한다.
                ForEach(userStore.dummy) { user in
                    Button {
                        
                    } label: {
                        StoryCell(user: user)
                            .padding(.horizontal, 5)
                    }
                }
            } // LazyHGrid
            .padding(.top, 9)
        } // ScrollView
    }
}

#Preview {
    StoryView(userStore: Store())
}
