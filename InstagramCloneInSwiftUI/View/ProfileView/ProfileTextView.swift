//
//  ProfileTextView.swift
//  InstagramCloneInSwiftUI
//
//  Created by 정석호 on 2024/04/02.
//

import SwiftUI

struct ProfileTextView: View {
    
    var user: User
    
    var body: some View {
        
        VStack {
            // 프로필 이미지, 파란 +버튼으로 스토리, 게시물 개수(버튼: 게시물화면으로 이동), (네비게이션: 팔로워 수, 팔로잉 수)
            // 9696? 왼쪽에서 오른쪽으로 네비게이션 액션
            // 게시물, 팔로워, 팔로잉 숫자 포멧 필요함
            HStack {
                
                NavigationLink {
                
                    Text("스토리 추가하는 뷰")
                    Text("왼쪽에서 오른쪽으로 네비게이션 액션")
                    
                    Text("스토리 있으면 풀커버")
                    
                } label: {
                    ZStack {
                        
                        URLImage(url: URL(string: user.profileImageURL)!, size: CGSize(width: 86, height: 86))
                            .clipShape(Circle())
                        
                        
                        Image(user.story!.isEmpty ? "stroke" : "cover")
                            .resizable()
                            .frame(width: 96, height: 96)
                            
                    }
                    // 스토리 추가 버튼 (파란+)
                    
                }
                .padding(.leading, 11)
                .padding(.trailing, 20)
                
                Spacer()
                
                Button {
                    
                    // 게시물이 시작하는 곳으로 이동
                    
                } label: {
                    VStack {
                        Text("\(user.feed?.count ?? 0)")
                            .fontWeight(.semibold)
                        
                        Text("게시물")
                    }
                }
                
                Spacer()
                
                NavigationLink {
                    
                    Text("나를 팔로우하는 사람 목록")
                    
                } label: {
                    
                    VStack {
                        Text("0")
                            .fontWeight(.semibold)
                        
                        Text("팔로워")
                    }
                }
                
                Spacer()
                
                NavigationLink {
                    
                    Text("내가 팔로우하는 사람 목록")
                    
                } label: {
                    
                    VStack {
                        Text("0")
                            .fontWeight(.semibold)
                        
                        Text("팔로잉")
                    }
                }
                
                Spacer()
            }
            .foregroundStyle(Color.black)
            .padding(.top, 11)
            
            //-------------------
            
            
            // 사용자 상태 메세지
            HStack {
                VStack(alignment: .leading) {
                    Text("안녕 나는 페페야")
                    
                }
                .padding(.leading, 16)
                Spacer()
            }
        }
    }
}

#Preview {
    ProfileTextView(user: User(id: "111", name: "pooh", profileImageURL: "https://i.postimg.cc/pTxz2zmm/pooh.jpg", feed: [], saveFeed: [], story: ["s111"], liveState: true))
}
