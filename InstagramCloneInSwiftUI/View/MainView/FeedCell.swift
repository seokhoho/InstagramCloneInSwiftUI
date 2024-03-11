//
//  FeedCell.swift
//  InstagramCloneInSwiftUI
//


import SwiftUI

struct FeedCell: View {

    // 피드
    let feed: Feed
    let user: User
    
    private let gridItems: [GridItem] = [
        .init(.flexible(minimum: 375, maximum: 375))
    ]
    
    var body: some View {
        
        VStack(alignment: .leading, spacing: 0) {
            // 킹피셔
            // 프로필 사진, 이름, 주소, 인증, 더보기
            HStack(spacing: 0) {
                
                ZStack {
                    
                    Image(user.profileImage)
                        .resizable()
                        .aspectRatio(contentMode: .fill)
                        .clipShape(Circle())
                        .frame(width: 32, height: 32)
                        .padding(.horizontal, 10)
                        .padding(.vertical, 11)
                    
                    Circle()
                        .strokeBorder(.gray, lineWidth: 1)
                        .frame(width: 32, height: 32)
                        .opacity(0.1)
                    
                }
                
                VStack(alignment: .leading) {
                    Text(user.name)
                        .font(.system(size: 13))
                        .fontWeight(.semibold)
                    // 주소가 있다면? 없다면
                    if let address = feed.address {
                        Text(address)
                            .font(.system(size: 11))
                    }
                }
                
                Spacer()
                Button {
                    
                    // 더보기
                    
                } label: {
                    Image("dot")
                        .frame(width: 14, height: 3)
                        .padding(.trailing, 15)
                        .padding(.vertical, 25.5)
                }
                
            } // 프로필 HStack
                    
            
            // 좌우에 맞게 이미지, 이미지 갯수에 맞게 스크롤 되야함, 인디게이터 생성해야함
            ScrollView(.horizontal) {
                LazyHGrid(rows: gridItems) {
                    ForEach (feed.feedImage, id: \.self) { image in
                        Image(image)
                            .resizable()
                            .aspectRatio(contentMode: .fill)
                            .frame(width: 375, height: 375)
                            .clipped()
                        // 이미지를 어떻게 설정할 것인지
                    }
                }
            }
            HStack {
                
                Button {
                    
                } label: {
                    Image("heart")
                        
                }
                .padding(.leading, 14)
                
                Button {
                    
                } label: {
                    Image("comment")
                }
                .padding(.horizontal, 13)
                
                Button {
                    
                } label: {
                    Image("messanger")
                }
               
                Spacer()
                
                // 배너 인디게이터, 하나일 때 여러개일 때
                
                
                
                Button {
                    
                } label: {
                    Image("save")
                }
                .padding(.trailing, 15)
                
            }
            .padding(.vertical, 13)
            
            // 좋아요를 누른 사람 이미지, 이름, 그리고 몇명 분기
            // 목록 누르면 좋아요 누른사람 목록 뜨게 네비게이션
            
            
            // 유저 네임과 내용이 한줄로 나와야하는데 내용이 여러줄이면 따로 놀게 된다 한줄에서
            HStack(spacing: 2) {
                Text(user.name)
                    .fontWeight(.semibold)
                
                Text(feed.text)
                
            }
            .font(.system(size: 13))
            .padding(.leading, 15)
            .padding(.bottom, 15)
            
            // 댓글 미리보기, 댓글 클릭시 comment 이미지 처럼 댓글창 모달 활성화
        }
        .padding(.bottom, 13)
    }
}

#Preview {
    FeedCell(feed: Feed(id: "f333",
                        userId: "333",
                        address: "서울",
                        feedImage: ["why", "stop"],
                        text: "나한태 왜..."),
             user: User(id: "333", name: "santa", profileImage: "santa", liveState: false)
                            
    )
}
