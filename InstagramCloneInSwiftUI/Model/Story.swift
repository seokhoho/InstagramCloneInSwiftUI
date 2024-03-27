//
//  Story.swift
//  InstagramCloneInSwiftUI
//
//  Created by 정석호 on 2024/03/22.
//

import Foundation

struct Story: Identifiable {
    let id: String
    let userId: String
    let storyImage: String
    var storyViewList: [String] = [] // User.id를 넣어 판단하게 하기
    // Date
}
