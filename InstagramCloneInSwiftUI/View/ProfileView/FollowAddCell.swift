//
//  FollowAddCell.swift
//  InstagramCloneInSwiftUI
//
//  Created by 정석호 on 2024/04/05.
//

import SwiftUI

struct FollowAddCell: View {
    
    var user: User
    
    var body: some View {
    
        VStack {
            
            NavigationLink {
                
                // 선택한 유저 피드로 이동 네비게이션
                Text("선택한 유저의 프로필 탭")
                
            } label: {
                VStack {
                    URLImage(url: URL(string: user.profileImageURL)!, size: CGSize(width: 86, height: 86))
                        .clipShape(Circle())
                        .padding(.top, 10)
                    
                    Text(user.name)
                        .foregroundStyle(Color.black)
                        .fontWeight(.semibold)
                        .font(.system(size: 18))
                }
            }
            
            
            // 팔로우 상태에 따라 다르게 문구 바꾸기
            Text("회원님을 팔로우 합니다")
                .font(.system(size: 15))
            // 누구님 외 n명이 팔로우합니다
            
            Spacer()
            
            Button {
                
                // 팔로우 기능
                
            } label: {
                // 팔로우 상태에 따라 다르게 문구 바꾸기
                Spacer()
                Text("팔로우")
                Spacer()
                // 맞팔로우 하기
            }
            .buttonStyle(.borderedProminent)
            .padding(.horizontal, 13)
            .padding(.bottom, 10)
        }
        .frame(width: 160, height: 220)
        .background(Color.init(hexCode: "F4F4F4"))
        .cornerRadius(8)
        .overlay {
            VStack {
                HStack {
                    Spacer()
                    Button {
                        
                        // 버튼을 누르면 목록에서 삭제되게 구현
                        
                    } label: {
                        Image(systemName: "xmark")
                            .foregroundStyle(Color.black)
                            .font(.system(size: 14))
                            .bold()
                    }
                    .padding(.trailing, 8)
                    .padding(.top, 8)
                }
                Spacer()
            }
            
        }
    }
}

#Preview {
    FollowAddCell(user: User(id: "333", name: "pooh", profileImageURL: "https://i.postimg.cc/pTxz2zmm/pooh.jpg", story: [], liveState: false))
}
