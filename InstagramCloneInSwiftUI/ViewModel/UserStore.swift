//
//  UserStore.swift
//  InstagramCloneInSwiftUI
//
//  Created by 정석호 on 2024/03/18.
//

import Foundation


class UserStore: ObservableObject {
    
    @Published var dummy: [User] = [
        User(id: "333", name: "pepe", profileImageURL: "https://i.postimg.cc/cLpfbVZM/pepe.jpg",
             feed: [
                "f333"
             ],
//             saveFeed: [
//                "f333"
//             ],
             story: [
                "s333"
             ],
             liveState: false),
        
        
        User(id: "111", name: "pooh", profileImageURL: "https://i.postimg.cc/pTxz2zmm/pooh.jpg",
             feed: [
                "f111"
             ],
             story: [
                "s111"
             ],
             liveState: true),
        
        
        User(id: "123", name: "santa", profileImageURL: "https://i.postimg.cc/P5pmKtG5/santa.jpg",
             feed: [
                "f123"
             ],
             story: [
               "s123"
             ],
             liveState: false)
    ]
    
    func userSavedFeed(userId: String, feedId: String) {
        
        guard let index = dummy.firstIndex(where: { $0.id == userId }) else { return }
        
        if let feedIndex = dummy[index].saveFeed.firstIndex(where: { $0 == feedId }) {
            dummy[index].saveFeed.remove(at: feedIndex)
        } else {
            dummy[index].saveFeed.append(feedId)
        }
    }
    
}
