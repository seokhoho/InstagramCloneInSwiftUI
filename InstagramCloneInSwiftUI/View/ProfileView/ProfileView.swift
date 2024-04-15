//
//  ProfileView.swift
//  InstagramCloneInSwiftUI
//
//  Created by 정석호 on 2024/03/28.
//

import SwiftUI

struct ProfileView: View {
    
    var user: User
    @ObservedObject var feedStore: FeedStore
    @ObservedObject var userStore: UserStore
    @State var showUploadSheet: Bool = false
    @State var showShareFullSheet: Bool = false
    @State var profileTag: ProfileTag = .feed
    @State var followPlusTapped: Bool = false
    @State var frameSize: CGFloat = 0
    
    enum ProfileTag: CaseIterable{
        case feed
        case reels
        case tags
    }
    
    var body: some View {
        
        NavigationStack {
            ScrollView {
                
                // ProfileTextView를 다른 사람의 프로필에 들어갈 때도 재사용하기 위해 뷰를 나누었다.
                ProfileTextView(user: user)
                
                //-------------------
                
                // 프로필 편집, 프로필 공유 (팔로우추가 버튼)
                HStack {
                    
                    NavigationLink {
                        
                        Text("프로필 편집 네비게이션 뷰")
                        
                    } label: {
                        Spacer()
                        
                        Text("프로필 편집")
                            .fontWeight(.semibold)
                            .font(.system(size: 18))
                            .foregroundStyle(Color.black)
                        
                        Spacer()
                    }
                    .buttonStyle(.bordered)
                    
                    Button {
                        
                        showShareFullSheet.toggle()
                        
                    } label: {
                        Spacer()
                        
                        Text("프로필 공유")
                            .fontWeight(.semibold)
                            .font(.system(size: 18))
                            .foregroundStyle(Color.black)
                        
                        Spacer()
                    }
                    .buttonStyle(.bordered)
                    
                    Button {
                        
                        // 사람 찾아보기 버튼 누르면 프로필들이 하단에 생성됨
                        followPlusTapped.toggle()
                        
                    } label: {
                        
                        Image("plusperson")
                            .resizable()
                            .aspectRatio(contentMode: .fit)
                            .frame(width: 22)
                            .padding(.vertical, 2.5)
                    }
                    .buttonStyle(.bordered)
                }
                .padding(.horizontal, 16)
                .padding(.top, 15)
                
                // -----------------
                
                // 팔로우 추가 공간에 대한 뷰 (데이터 연동하기)
                if followPlusTapped {
                    HStack {
                        VStack(alignment: .leading) {
                            
                            HStack {
                                
                                Text("사람 찾아보기")
                                    .fontWeight(.semibold)
                                    .font(.system(size: 18))
                                
                                Spacer()
                                
                                NavigationLink {
                                    
                                    Text("사람 찾아보기 뷰")
                                    
                                } label: {
                                    
                                    Text("모두 보기")
                                    
                                }
                                
                            }
                            .padding(.horizontal)
                            .padding(.top)
                            
                            ScrollView(.horizontal, showsIndicators: false) {
                                FollowAddView(user: user, userStore: userStore)
                            }
                        }
                    }
                }
                // ------------------
                
                // 위로 계속 드래그했을 때 카테고리가 최 상단으로 유지 되어야한다.
                ProfileCategoryView(profileTag: $profileTag)
                    .padding(.vertical, 12)
                    .padding(.horizontal, 10)
                // ------------------
                
                // 피드
                TabView(selection: $profileTag) {
                    ProfileFeedPreView(user: user, feedStore: feedStore)
                        .tag(ProfileTag.feed)
                    
                    Text("릴스탭")
                        .tag(ProfileTag.reels)
                    
                    Text("태그탭")
                        .tag(ProfileTag.tags)

                }
                .tabViewStyle(.page(indexDisplayMode: .never))
                // 각 뷰의 사이즈에 맞는 상하의 사이즈가 필요한데 이걸 어떻게 구하지?
                .frame(height: frameSize)
                
                // 탭뷰가 바뀔 때 즉 피드와 릴스로 넘어갈 때마다 반복해야한다
                .onAppear {
                    
                    // 피드, 태그일 때 릴스일 때 피드 태그 125 릴스 그 이상
                    var temp = 0
                    
                    if profileTag == .feed {
                        temp = feedStore.dummyFeed.filter { $0.userId == user.id }.count / 3
                        if feedStore.dummyFeed.filter({ $0.userId == user.id }).count % 3 > 0 {
                            temp += 1
                        }
                        // 기본 화면사이즈보다 작으면 기본 화면사이즈까지만?
                        frameSize = CGFloat(12 + (temp * 125))
                    } else if profileTag == .feed {
                        // reels의 갯수를 찾아 사이즈를 구하기
//                        frameSize = CGFloat(12 + (temp * 180))
                    } else {
                        // 태그된 게시글
                        //frameSize = CGFloat(12 + (temp * 125))
                    }
                }
                
            } // ScrollView
            .toolbar {
                ToolbarItem(placement: .topBarLeading) {
                    Button {
                        
                        // 새 계정 만들기
                        
                    } label: {
                        
                        HStack(spacing: 3) {
                            Text("\(user.name)")
                                .font(.largeTitle)
                                .fontWeight(.bold)
                            
                            Image("account")
                                .frame(width: 10, height: 9)
                                .padding(.top, 6)
                        }
                        .foregroundStyle(Color.black)
                        
                    }
                }
                
                ToolbarItem(placement: .topBarTrailing) {
                    Button {
                        showUploadSheet.toggle()
                    } label: {
                        Image("upload")
                    }
                }
                
                ToolbarItem(placement: .topBarTrailing) {
                    NavigationLink {
                        
                    } label: {
                        Image("menu")
                    }
                }
            }
            
        } // NavigationStack
        
        .sheet(isPresented: $showUploadSheet) {
            Text("업로드 시트 절반만 보임")
                .presentationDetents([.medium])
                .presentationDragIndicator(.visible)
        }
        
        .fullScreenCover(isPresented: $showShareFullSheet) {
            Text("프로필 공유 풀커버 시트")
            Button {
                showShareFullSheet.toggle()
            } label: {
                Text("취소")
            }
        }
        
        
        
    }
}

#Preview {
    ProfileView(user: User(id: "333", name: "pooh", profileImageURL: "https://i.postimg.cc/pTxz2zmm/pooh.jpg", story: [], liveState: false), feedStore: FeedStore(), userStore: UserStore())
}
