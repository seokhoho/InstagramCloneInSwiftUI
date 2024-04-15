//
//  FollowAddView.swift
//  InstagramCloneInSwiftUI
//
//  Created by 정석호 on 2024/04/05.
//

import SwiftUI

struct FollowAddView: View {
    
    var user: User
    @ObservedObject var userStore: UserStore
    
    var body: some View {
        HStack(spacing: 0) {
            
            // 전체 유저에서 나를 팔로우한 사람>나의팔로우가 팔로우한 사람>전체 순서로 정렬해야한다
            ForEach(/*0...5, id: \.self*/userStore.dummy.filter( { $0.id != user.id })) { user in
                
                FollowAddCell(user: user)
                    .padding(.leading, 5)
            }
        }
        .padding(.leading, 5)
    }
}

#Preview {
    FollowAddView(user: User(id: "333", name: "pooh", profileImageURL: "https://i.postimg.cc/pTxz2zmm/pooh.jpg", story: [], liveState: false), userStore: UserStore())
}
