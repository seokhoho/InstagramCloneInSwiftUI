//
//  Data.swift
//  InstagramCloneInSwiftUI
//


import Foundation


// 메인뷰의 스토리 목록 데이터

struct User: Identifiable {
    let id: String
    var name: String
    var profileImageURL: String
    var feed: [String]?
    var saveFeed: [String] = []
    var story: [String]?
    var liveState: Bool
    // 팔로우, 팔로워, 프로필 상태 메세지 프로퍼티 필요함
}






// UUID().uuidString
