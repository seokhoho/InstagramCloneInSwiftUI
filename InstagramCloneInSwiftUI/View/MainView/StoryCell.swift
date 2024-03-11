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
            
            // 킹피셔, 라이브 처리 zstack으로 오프셋이동
            // 테두리 색상을 읽음 유무에 따라 변환 해야함
         
            ZStack {
                Image(user.profileImage) // 유저 이미지
                    .resizable()
                    .aspectRatio(contentMode: .fill)
                    .clipShape(Circle())
                    .frame(width: 56, height: 56)

                
                Circle() // 테두리
                    .strokeBorder(Color.orange, lineWidth: 2) // 컬러 변환
                    .frame(width: 63, height: 63)
                
                
                // 라이브 유무에 따른 Live 표시 live는 assets에
                if user.liveState {
                    Image("live")
                        .offset(y: 28)
                }
            }
                
            Text(user.name) // 유저 이름
                .font(.system(size: 12))
                .padding(.top, 5)
                .foregroundStyle(Color.black)
                
        }
    }
}

#Preview {
    StoryCell(user: User(id: UUID().uuidString, name: "santa", profileImage: "santa", liveState: false))
}
