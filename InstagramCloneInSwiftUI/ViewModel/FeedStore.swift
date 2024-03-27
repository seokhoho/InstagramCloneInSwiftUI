//
//  FeedStore.swift
//  InstagramCloneInSwiftUI
//
//  Created by 정석호 on 2024/03/18.
//

import Foundation

class FeedStore: ObservableObject {
    
    @Published var dummyFeed = [
        Feed(id: "f333",
             userId: "333",
             address: "서울, 대한민국",
             feedImageURL: ["https://i.postimg.cc/gkBVvxT7/why.jpg", "https://i.postimg.cc/mr77f8gx/stop.jpg"],
             text: "나한태 왜..."),
        Feed(id: "f111",
             userId: "111",
             feedImageURL: ["https://i.postimg.cc/hPwD8nbs/coding.jpg"],
             text: "그만 일어나..",
             heartPressList: ["333", "123", "111"]),
        Feed(id: "f123",
             userId: "123",
             address: "샌프란시스코, 미국",
             feedImageURL: ["https://i.postimg.cc/qMgBCqng/can.jpg"],
             text: "할 수 있을까? 허허")
    
    ]
    
    
    func heartPress(feedId: String, userId: String) {
        
        guard let index = dummyFeed.firstIndex(where: { $0.id == feedId }) else { return }
        
        if let userIndex = dummyFeed[index].heartPressList.firstIndex(where: { $0 == userId }) {
            dummyFeed[index].heartPressList.remove(at: userIndex)
        } else {
            dummyFeed[index].heartPressList.append(userId)
        }
    
    }
    
    func feedSavedUser(userId: String, feedId: String) {
        
        guard let index = dummyFeed.firstIndex(where: { $0.id == feedId }) else { return }
        
        dummyFeed[index].savePressList.append(userId)
        
        if let userIndex = dummyFeed[index].savePressList.firstIndex(where: { $0 == userId }) {
            dummyFeed[index].savePressList.remove(at: userIndex)
        } else {
            dummyFeed[index].savePressList.append(userId)
        }
    }
}
