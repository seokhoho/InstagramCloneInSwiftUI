//
//  Feed.swift
//  InstagramCloneInSwiftUI
//
//  Created by 정석호 on 2024/03/18.
//

import Foundation

struct Feed: Identifiable {
    let id: String
    let userId: String // 만든 유저 아이디
    var address: String?
    var feedImageURL: [String]
    var text: String
    var savePressList: [String] = []
    var heartPressList: [String] = [] // User.id를 넣어 판단하게 하기
    var heartCount: Int {
        get {
            return heartPressList.count
        }
    } // 좋아요 버튼 누른게 성공했을 때
    // Date
}
