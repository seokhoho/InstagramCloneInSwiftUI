//
//  StoryCell.swift
//  InstagramCloneInSwiftUI
//


import SwiftUI

struct StoryCell: View {
    
    // 유저 데이터
    var user: User
    
    var body: some View {
        VStack(spacing: 0) {
            
            // 테두리 색상을 읽음 유무에 따라 변환 해야함
         
            ZStack {
             
                URLImage(url: URL(string: user.profileImageURL)!, size: CGSize(width: 56, height: 56))
                    .clipShape(Circle())
                    
                Image("cover")
                    .frame(width: 63, height: 63)
                
                if user.liveState {
                    Image("live")
                        .offset(y: 29)
                }
            }
                
            Text(user.name) 
                .font(.system(size: 12))
                .padding(.top, 5)
                .foregroundStyle(Color.black)
        }
    }
}

#Preview {
    StoryCell(user: User(id: UUID().uuidString, name: "pepe", profileImageURL: "https://i.postimg.cc/P5pmKtG5/santa.jpg", liveState: true))
}
