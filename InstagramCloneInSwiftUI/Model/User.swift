//
//  Data.swift
//  InstagramCloneInSwiftUI
//


import Foundation


// 메인뷰의 스토리 목록 데이터

struct User: Identifiable {
    let id: String
    var name: String
    var profileImage: String // Assets더미로 진행 후 url 변경
    var feed: [String]?
    var story: [Story]?
    var liveState: Bool
}

struct Feed: Identifiable {
    let id: String
    let userId: String // 만든 유저 아이디
    var address: String?
    var feedImage: [String] // Assets더미로 진행 후 url 변경
    var text: String
    var heartPressList: [String] = [] // User.id를 넣어 판단하게 하기
    var heartCount: Int = 0 // = self.heartPressList.count
    // Date
}

struct Story {
    let storyId: String
    let userId: String
    let storyImage: String
    var storyViewList: [String] = [] // User.id를 넣어 판단하게 하기
    // Date
}

// 옵져버블 퍼블리쉬 en
class Store {
    var dummy: [User] = [
        User(id: "333", name: "pepe", profileImage: "pepe",
             feed: [
                "f333"
             ],
             story: [
                Story(storyId: UUID().uuidString,
                      userId: "333",
                      storyImage: "")
             ],
             liveState: false),
        
        
        User(id: "111", name: "pooh", profileImage: "pooh",
             feed: [
                "f111"
             ],
             story: [
                Story(storyId: UUID().uuidString,
                      userId: "111",
                      storyImage: "")
             ],
             liveState: true),
        
        
        User(id: "123", name: "santa", profileImage: "santa",
             feed: [
                "f123"
             ],
             story: [
                Story(storyId: UUID().uuidString,
                      userId: "123",
                      storyImage: "")
             ],
             liveState: false)
    ]
    
    var dummyFeed = [
        Feed(id: "f333",
             userId: "333",
             address: "서울, 대한민국",
             feedImage: ["why", "stop"],
             text: "나한태 왜..."),
        Feed(id: "f111",
             userId: "111",
             feedImage: ["coding"],
             text: "그만 일어나.."),
        Feed(id: "f123",
             userId: "123",
             address: "샌프란시스코, 미국",
             feedImage: ["can"],
             text: "할 수 있을까? 허허")
    
    ]
}

// UUID().uuidString
