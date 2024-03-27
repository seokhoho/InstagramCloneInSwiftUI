//
//  StoryStore.swift
//  InstagramCloneInSwiftUI
//
//  Created by 정석호 on 2024/03/22.
//

import Foundation

class StoryStore: ObservableObject {
    
    @Published var dummyStory: [Story] = [
    
        Story(id: "s333", userId: "333", storyImage: ""),
        Story(id: "s111", userId: "111", storyImage: ""),
        Story(id: "s123", userId: "123", storyImage: "")
    
    ]
    
    
}
