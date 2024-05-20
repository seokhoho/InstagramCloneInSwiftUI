//
//  MyFeedSettingSheetView.swift
//  InstagramCloneInSwiftUI
//
//  Created by 정석호 on 2024/04/23.
//

import SwiftUI

struct MyFeedSettingSheetView: View {
    var body: some View {
        VStack(spacing: 0) {
            HStack {
                
                Button {
                    
                } label: {
                    HStack {
                        Spacer()
                        VStack {
                            Image("save")
                            
                            Text("저장")
                                .font(.caption)
                        }
                        Spacer()
                    }
                    .padding(.vertical, 10)
                }
                .buttonStyle(.bordered)
                
                Button {
                    
                } label: {
                    HStack {
                        Spacer()
                        VStack {
                            Image(systemName: "plus.viewfinder")
                                .resizable()
                                .aspectRatio(contentMode: .fit)
                                .frame(width: 24)
                            Text("리믹스")
                                .font(.caption)
                            
                        }
                        Spacer()
                    }
                    .padding(.vertical, 10)
                }
                
                .buttonStyle(.bordered)
            }
            .padding(.horizontal)
            
            
            Button {
                
            } label: {
                HStack {
                    Image(systemName: "scissors")
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                        .frame(width: 18)
                        .padding(.horizontal, 5)
                    
                    Text("컷아웃 스티커 만들기")
                    
                    Spacer()
                }
                .padding(.vertical, 10)
            }
            .buttonStyle(.bordered)
            .padding(.horizontal)
            .padding(.vertical, 8)
            
            VStack(alignment: .leading, spacing: 2) {
                
                Button {
                    
                } label: {
                    HStack {
                        Image(systemName: "multiply.circle")
                            .resizable()
                            .aspectRatio(contentMode: .fit)
                            .frame(width: 18)
                            .padding(.horizontal, 5)
                        
                        Text("다시 사용 해제")
                        
                        Spacer()
                    }
                    .padding(.vertical, 10)
                }
                .buttonStyle(.bordered)
                
                Button {
                    
                } label: {
                    HStack {
                        Image(systemName: "clock.arrow.circlepath")
                            .resizable()
                            .aspectRatio(contentMode: .fit)
                            .frame(width: 18)
                            .padding(.horizontal, 5)
                        
                        Text("보관")
                        
                        Spacer()
                    }
                    .padding(.vertical, 10)
                }
                .buttonStyle(.bordered)
                
                Button {
                    
                } label: {
                    HStack {
                        Image(systemName: "heart")
                            .resizable()
                            .aspectRatio(contentMode: .fit)
                            .frame(width: 18)
                            .padding(.horizontal, 5)

                        Text("좋아요 수 숨기기")
                        
                        Spacer()
                    }
                    .padding(.vertical, 10)
                }
                .buttonStyle(.bordered)
                
                Button {
                    
                } label: {
                    HStack {
                        Image(systemName: "bubble.right")
                            .resizable()
                            .aspectRatio(contentMode: .fit)
                            .frame(width: 18)
                            .padding(.horizontal, 5)

                        Text("댓글 기능 설정")
                        
                        Spacer()
                    }
                    .padding(.vertical, 10)
                }
                .buttonStyle(.bordered)
                
                Button {
                    
                } label: {
                    HStack {
                        Image(systemName: "pencil")
                            .resizable()
                            .aspectRatio(contentMode: .fit)
                            .frame(width: 18)
                            .padding(.horizontal, 5)
                        
                        Text("수정")
                        
                        Spacer()
                    }
                    .padding(.vertical, 10)
                }
                .buttonStyle(.bordered)
                
                Button {
                    
                } label: {
                    HStack {
                        Image(systemName: "pin")
                            .resizable()
                            .aspectRatio(contentMode: .fit)
                            .frame(width: 18)
                            .padding(.horizontal, 5)

                        Text("내 프로필에 고정")
                        
                        Spacer()
                    }
                    .padding(.vertical, 10)
                }
                .buttonStyle(.bordered)
                
                Button {
                    
                } label: {
                    HStack {
                        Image(systemName: "f.cursive.circle")
                            .resizable()
                            .aspectRatio(contentMode: .fit)
                            .frame(width: 18)
                            .padding(.horizontal, 5)
                        
                        Text("Facebook에 공유")
                        
                        Spacer()
                    }
                    .padding(.vertical, 10)
                }
                .buttonStyle(.bordered)
                
                Button {
                    
                } label: {
                    HStack {
                        Image(systemName: "qrcode.viewfinder")
                            .resizable()
                            .aspectRatio(contentMode: .fit)
                            .frame(width: 18)
                            .padding(.horizontal, 5)
                        
                        Text("QR 코드")
                        
                        Spacer()
                    }
                    .padding(.vertical, 10)
                }
                .buttonStyle(.bordered)
                
                Button {
                    
                } label: {
                    HStack {
                        Image(systemName: "trash")
                            .resizable()
                            .aspectRatio(contentMode: .fit)
                            .frame(width: 18)
                            .padding(.horizontal, 5)

                        Text("삭제")
                        
                        Spacer()
                    }
                    .padding(.vertical, 10)
                    .foregroundStyle(.red)
                }
                .buttonStyle(.bordered)
                
                
            }
            .padding(.horizontal)
            
        }
        .foregroundStyle(.black)
    }
}

#Preview {
    MyFeedSettingSheetView()
}
