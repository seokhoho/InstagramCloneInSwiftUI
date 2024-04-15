//
//  ProfileCategoryView.swift
//  InstagramCloneInSwiftUI
//
//  Created by 정석호 on 2024/04/05.
//

import SwiftUI

struct ProfileCategoryView: View {
    
    @Binding var profileTag: ProfileView.ProfileTag
    @Namespace var animation
    
    var body: some View {
        
        GeometryReader { proxy in
            
            HStack {
                
                Spacer()
                VStack {
                    Button {
                        
                        profileTag = .feed
                        
                    } label: {
                        Image(profileTag == .feed ? "gridb" : "gridg")
                        
                    }
                    
                    if profileTag == .feed {
                        Capsule()
                            .foregroundStyle(.black)
                            .frame(width: proxy.size.width / 3 ,height: 2)
                            .matchedGeometryEffect(id: "Choice", in: animation)
                    } else {
                        Capsule()
                            .foregroundStyle(.clear)
                            .frame(width: proxy.size.width / 3 ,height: 2)
                    }
                    
                }
                
                Spacer()
                
                VStack {
                    Button {
                        
                        profileTag = .reels
                        
                    } label: {
                        Image(profileTag == .reels ? "reelsb" : "reelsg")
                    }
                    
                    if profileTag == .reels {
                        Capsule()
                            .foregroundStyle(.black)
                            .frame(width: proxy.size.width / 3 ,height: 2)
                            .matchedGeometryEffect(id: "Choice", in: animation)
                    } else {
                        Capsule()
                            .foregroundStyle(.clear)
                            .frame(width: proxy.size.width / 3 ,height: 2)
                    }
                }
                Spacer()
                
                VStack {
                    Button {
                        
                        profileTag = .tags
                        
                    } label: {
                        Image(profileTag == .tags ? "tagb" : "tagg")
                    }
                    
                    if profileTag == .tags {
                        Capsule()
                            .foregroundStyle(.black)
                            .frame(width: proxy.size.width / 3 ,height: 2)
                            .matchedGeometryEffect(id: "Choice", in: animation)
                    } else {
                        Capsule()
                            .foregroundStyle(.clear)
                            .frame(width: proxy.size.width / 3 ,height: 2)
                    }
                    
                }
                
                Spacer()
            }
            
            .frame(width: proxy.size.width)
        }
    }
}

#Preview {
    ProfileCategoryView(profileTag: .constant(.tags))
}
