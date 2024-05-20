//
//  CommentSheetView.swift
//  InstagramCloneInSwiftUI
//
//  Created by 정석호 on 2024/03/28.
//

import SwiftUI

struct CommentSheetView: View {
    
    @State var chat: String = ""
    
    var body: some View {
        
        VStack(spacing: 0) {
            HStack {
                
                Spacer()
                
                Text("댓글")
                    .bold()
                    .padding(.vertical)
                
                Spacer()
                
                
            }
            Divider()
            
            // 댓글이 많을 경우를 위해 한번에 호출하지않도록 바꾸기
            ScrollView {
                
                ForEach(0...5, id: \.self) { _ in
                    
                    HStack(alignment: .top) {
                        URLImage(url: URL(string: "https://i.postimg.cc/P5pmKtG5/santa.jpg")!, size: CGSize(width: 45, height: 45))
                            .clipShape(Circle())
                            .padding(.leading, 10)
                            
                        
                        VStack(alignment: .leading) {
                            
                            HStack {
                                Text("UserName")
                                    .fontWeight(.semibold)
                                    
                                Text("4일")
                                    .foregroundStyle(Color(hexCode: "C8C8C8"))
                            }
                            .font(.callout)
                            
                            Text("본문 아브라카다브라 모두 다 이루어져라 아틸리사인")
                                .padding(.bottom, 5)
                            
                            Button {
                                // 하단 텍스트 필드가 동작하면서 키보드가 올라옴
                            } label: {
                                Text("답글 달기")
                                    .fontWeight(.semibold)
                                    .font(.callout)
                                    .foregroundStyle(Color(hexCode: "C8C8C8"))
                            }
                        }
                        
                        
                        Spacer()
                        
                        VStack(alignment: .center, spacing: 4) {
                            Button {
                                
                            } label: {
                                // 하트 눌림, 개수 기능 구현하기
                                Image(systemName: "heart")
                            }
                            .padding(.top)

                            
                            NavigationLink {
                                Text("좋아요 누른사람 목록 뷰")
                            } label: {
                                Text("1")
                            }
                        }
                        .foregroundStyle(Color(hexCode: "C8C8C8"))
                    } // HStack
                    .padding(.vertical, 10)
                    .padding(.trailing)
                    
                    
                } // ForEach
                
            } // ScrollView
            
            Divider()
            
            HStack {
                URLImage(url: URL(string: "https://i.postimg.cc/cLpfbVZM/pepe.jpg")! , size: CGSize(width: 50, height: 50))
                    .clipShape(Circle())
                    .overlay {
                        RoundedRectangle(cornerRadius: 50)
                            .stroke(Color(hexCode: "C8C8C8") ,lineWidth: 1.0)
                    }
                
                HStack {
                    
                    TextField(text: $chat) {
                        Text("댓글 달기...")
                    }
                    
                    Spacer()
                    
                    if chat.isEmpty {
                        
                        Button {
                            
                            // GIF를 여는 버튼
                            
                        } label: {
                            Text("GIF")
                                .foregroundStyle(.black)
                                .bold()
                                .padding(5)
                                .border(.black, width: 3)
                                .cornerRadius(3)
                        }
                        .padding(.trailing, 10)

                    } else {
                        
                        Button {
                                
                            // 댓글 목록에 댓글 등록 기능 버튼
                            
                        } label: {
                            
                            Capsule()
                                .frame(width: 60, height: 40)
                                .overlay {
                                    Image(systemName: "arrow.up")
                                        .bold()
                                        .foregroundStyle(.white)
                                }
                        }
                        
                    }
                }
                .padding(.leading)
                .padding(.trailing, 5)
                .overlay {
                    Capsule()
                        .strokeBorder(.black)
                        .foregroundStyle(.clear)
                        .frame(height: 50)
                }
                
            }
            .padding(.top)
            .padding(.horizontal)
        }
        
        
    }
}

#Preview {
    NavigationStack {
        CommentSheetView()
    }
}
