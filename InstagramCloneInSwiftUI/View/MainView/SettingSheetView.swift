//
//  SettingSheetView.swift
//  InstagramCloneInSwiftUI
//
//  Created by 정석호 on 2024/03/28.
//

import SwiftUI

struct SettingSheetView: View {
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
                            Image(systemName: "qrcode.viewfinder")
                                .resizable()
                                .aspectRatio(contentMode: .fit)
                                .frame(width: 24)
                            Text("QR 코드")
                                .font(.caption)
                        }
                        Spacer()
                    }
                    .padding(.vertical, 10)
                }
                
                .buttonStyle(.bordered)
            }
            .padding(.horizontal)
            
            
            VStack(alignment: .leading, spacing: 2) {
                
                Button {
                    
                } label: {
                    HStack {
                        Image(systemName: "star")
                            .resizable()
                            .aspectRatio(contentMode: .fit)
                            .frame(width: 20)
                            .padding(.horizontal, 5)
                        Text("즐겨찾기에 추가")
                        
                        Spacer()
                    }
                    .padding(.vertical, 5)
                }
                
                
                Button {
                    
                } label: {
                    HStack {
                        Image(systemName: "person.badge.minus")
                            .resizable()
                            .aspectRatio(contentMode: .fit)
                            .frame(width: 20)
                            .padding(.horizontal, 5)
                        Text("팔로우 취소")
                        Spacer()
                    }
                    .padding(.vertical, 5)
                }
            }
            
            .padding(.horizontal)
            .padding(.vertical, 10)
            
            VStack(alignment: .leading, spacing: 2) {
                
                Button {
                    
                } label: {
                    HStack {
                        Image(systemName: "person.crop.circle")
                            .resizable()
                            .aspectRatio(contentMode: .fit)
                            .frame(width: 20)
                            .padding(.horizontal, 5)
                        Text("이 계정 정보")
                        
                        Spacer()
                    }
                    .padding(.vertical, 5)
                }
                
                
                Button {
                    
                } label: {
                    HStack {
                        Image(systemName: "info.circle")
                            .resizable()
                            .aspectRatio(contentMode: .fit)
                            .frame(width: 20)
                            .padding(.horizontal, 5)
                        Text("이 게시물이 표시되는 이유")
                        Spacer()
                    }
                    .padding(.vertical, 5)
                }
                
                Button {
                    
                } label: {
                    HStack {
                        
                        Image(systemName: "eye.slash")
                            .resizable()
                            .aspectRatio(contentMode: .fit)
                            .frame(width: 20)
                            .padding(.horizontal, 5)
                        
                        Text("숨기기")
                        Spacer()
                    }
                    .padding(.vertical, 5)
                }
                
                Button {
                    
                } label: {
                    HStack {
                        
                        Image(systemName: "exclamationmark.bubble")
                            .resizable()
                            .aspectRatio(contentMode: .fit)
                            .frame(width: 20)
                            .padding(.horizontal, 5)

                        Text("신고")
                        Spacer()
                    }
                    .padding(.vertical, 5)
                    .foregroundStyle(.red)
                }
            }
            
            .padding(.horizontal)
            
            
            
            
            
        }
        .buttonStyle(.bordered)
        .foregroundStyle(Color.black)
    }
}

#Preview {
    SettingSheetView()
}
