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
}






// UUID().uuidString
