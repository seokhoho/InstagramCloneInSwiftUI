//
//  FeedCell.swift
//  InstagramCloneInSwiftUI
//


import SwiftUI
import BriefPagingControl

struct FeedCell: View {
    
    // 피드
    let feedId: String
    @State var feed: Feed
    @State var user: User
    @ObservedObject var feedStore: FeedStore
    @ObservedObject var userStore: UserStore
    @State var showCommentSheet: Bool = false
    @State var showShareSheet: Bool = false
    @State var showSaveFeedSheet: Bool = false
    @State var showSettingSheet: Bool = false
    @State var showMySettingSheet: Bool = false
    @State var feedIndex: Int = 0
    
    var body: some View {
        
        NavigationStack {
            
            VStack(alignment: .leading, spacing: 0) {
                
                // 프로필 사진, 이름, 주소, 인증, 더보기 기능동작 필요
                HStack {
                    NavigationLink {
                        
                        // 프로필에 있는 유저의 프로필 뷰로 이동
                        Text("프로필 뷰")
                        
                    } label: {
                        
                        HStack(spacing: 0) {
                            
                            ZStack {
                                URLImage(url: URL(string: user.profileImageURL)!, size: CGSize(width: 32, height: 32))
                                    .clipShape(Circle())
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
                                
                                
                                if let address = feed.address {
                                    
                                    NavigationLink {
                                        
                                        // 적혀있는 주소를 지도로 표시하는 뷰
                                        Text("지도 뷰")
                                        
                                    } label: {
                                        Text(address)
                                            .font(.system(size: 11))
                                    }
                                    
                                }
                            }
                            .foregroundStyle(Color.black)
                            
                        } // HStack
                        
                    } // NavigationLink
                    
                    Spacer()
                    
                    Button {
                        
                        // 피드의 종류에 따라 시트가 달라져서 올라온다. 피드/릴스, 나의피드/
                        // 피드의 유저아이디로 나의 피드 다른 유저의 피드를 나누어 띄우기
                        // 하지만 현재 유저가 누구인지 모른다 그냥 유저로 가면 안된다.
                        // userStore.dummy[0].feed?.contain으로 분기를 주었는데 전부 true로 값이 나왔다 하지만 first로 하니 분기가 제대로 작동했다. contain이 문자열 중 문자 하나라도 겹치면 작동하는 것 같다.
                        
                        // 설정
                        
                        if let _ =  userStore.dummy[0].feed?.first(where: {$0 == feedId}) {
                            showMySettingSheet.toggle()
                        } else {
                            showSettingSheet.toggle()
                        }
                        
                    } label: {
                        Image("dot")
                            .frame(width: 14, height: 3)
                            .padding(.trailing, 15)
                            .padding(.vertical, 25.5)
                    }
                    
                } // 프로필 HStack
                
                // 3개의 페이지 표시
                TabView(selection: $feedIndex) {
                    ForEach (feed.feedImageURL.indices, id:
                                \.self) { index in
                        URLImage(url: URL(string: feed.feedImageURL[index])!, size: CGSize(width: UIScreen.main.bounds.width, height: UIScreen.main.bounds.width))
                            .clipped()
                            
                        // 이미지를 어떻게 설정할 것인지
                    }
                } // TabView
                .tabViewStyle(.page(indexDisplayMode: .never))
                .frame(width: UIScreen.main.bounds.width, height: UIScreen.main.bounds.width)
                
                HStack {
                    
                    Button {
                        // 하트버튼
                        // 현재 누르는 유저의 id가 들어가야한다. (지금은 이 피드를 만든 유저의 정보가 들어가버린다)
                        feedStore.heartPress(feedId: feed.id, userId: user.id)
                        
                    } label: {
                        
                        if let feed = feedStore.dummyFeed.first(where: { $0.id == feedId }),
                           feed.heartPressList.contains(user.id) {
                            Image("heartfill")
                                .padding(.trailing, 1)
                        } else {
                            Image("heart")
                        }
                        
                    }
                    .padding(.leading, 14)
                    
                    Button {
                        // 댓글버튼
                        showCommentSheet.toggle()
                        
                    } label: {
                        Image("comment")
                    }
                    .padding(.horizontal, 13)
                    
                    Button {
                        // 공유버튼
                        showShareSheet.toggle()
                        
                    } label: {
                        Image("messanger")
                    }
                    
                    Spacer()
                    
                    // 배너 인디게이터, 하나일 때 여러개일 때
                    
                    
                    //
                    
                    Button {
                        // 저장버튼 현재 유저의 아이디를 넘겨야한다.
                        userStore.userSavedFeed(userId: user.id, feedId: feedId)
                        feedStore.feedSavedUser(userId: user.id, feedId: feedId)
                        
                        // 유저의 저장된 피드의 컬렉션을 만들었다면 시트가 뜨게해야한다
                        showSaveFeedSheet.toggle()
                        
                    } label: {
                        
                        if let userSaveFeed = userStore.dummy.first(where: { $0.id == user.id })?.saveFeed, userSaveFeed.contains(feedId) {
                            Image("savefill")
                        } else {
                            Image("save")
                        }
                        
                    }
                    .padding(.trailing, 15)
                    
                }
                .padding(.vertical, 13)
                .overlay {
                    BriefPagingControl(numberOfPages: feed.feedImageURL.count, currentPage: $feedIndex) { config in
                        
                        config.indicatorSize = 6
                        config.spacing = 4
                        config.currentIndicatorColor = Color.init(hexCode: "3897F0")
                        config.indicatorColor = Color.init(hexCode: "D9D9D9")
                        config.numberOfMainIndicators = .three
                        config.hidesForSinglePage = true
                        config.animation = .snappy
                    }
                }
                
                
                
                
                NavigationLink {
                    
                    // 좋아요 누른 사람 목록으로 가는 네비게이션 뷰
                    Text("좋아요 목록 뷰")
                    
                } label: {
                    
                    if let feed = feedStore.dummyFeed.first(where: { $0.id == feedId }), feed.heartCount != 0, let userId = feed.heartPressList.randomElement(), let user = userStore.dummy.first(where: {$0.id == userId })  {
                        // 랜덤으로 유저 정보를 가져와 이미지, 이름
                        HStack(spacing: 2) {
                            
                            // 이미지
                            URLImage(url: URL(string:user.profileImageURL)!, size: CGSize(width: 17, height: 17))
                                .clipShape(Circle())
                                .padding(.trailing, 4)
                            
                            Text("Liked by")
                            
                            Text("\(user.name)")
                                .fontWeight(.semibold)
                            
                            Text("and")
                            
                            Text("\(feed.heartCount) others")
                                .fontWeight(.semibold)
                            
                        }
                        .foregroundStyle(Color.black)
                        .font(.system(size: 13))
                        .padding(.leading, 15)
                        .padding(.bottom, 5)
                    }
                }
                
                // 유저 네임과 내용이 한줄로 나와야하는데 내용이 여러줄이면 따로 놀게 된다 한줄에서 나오게 구현하기
                HStack(spacing: 2) {
                    Text(user.name)
                        .fontWeight(.semibold)
                    
                    Text(feed.text)
                    
                }
                .font(.system(size: 13))
                .padding(.leading, 15)
                .padding(.bottom, 15)
                
                // 댓글 미리보기, 댓글 클릭시 comment 이미지 처럼 댓글창 모달 활성화
                
            } // VStack
            .padding(.bottom, 13)
            
        } // NavigationStack
        .sheet(isPresented: $showMySettingSheet) {
            
            MyFeedSettingSheetView()
                .presentationDetents([
                    .custom(CustomDetent.self)
                ])
                .presentationDragIndicator(.visible)
            
        }
        
        .sheet(isPresented: $showSettingSheet) {
            
            SettingSheetView()
                .presentationDetents([
                    .height(UIScreen.main.bounds.height / 1.9)
                ])
                .presentationDragIndicator(.visible)
        }
    
        .sheet(isPresented: $showCommentSheet) {
            
            // 처음 큰화면 + 키보드 활성화
            
            CommentSheetView()
                .presentationDetents([
                    .height(UIScreen.main.bounds.height / 1.5),
                    .custom(CustomDetent.self)
                ])
        }
        .sheet(isPresented: $showShareSheet) {
            ShareSheetView(user: user, userStore: userStore)
                .presentationDetents([
                    .medium,
                    .custom(CustomDetent.self)
                    
                ])
        }
        .sheet(isPresented: $showSaveFeedSheet) {
            
            
            HStack {
                URLImage(url: URL(string: feed.feedImageURL[0])!, size: CGSize(width: 70, height: 70))
                    .cornerRadius(10)
                    .padding(.trailing, 6)
                
                VStack(alignment: .leading, spacing: 3) {
                    if let userSaveFeed = userStore.dummy.first(where: { $0.id == user.id })?.saveFeed, userSaveFeed.contains(feedId) {
                        Text("저장됨")
                            .font(.headline)
                    } else {
                        Text("저장")
                            .font(.headline)
                    }
                        
                    Text("공개")
                        .font(.subheadline)
                        .foregroundStyle(Color(hexCode: "C8C8C8"))
                }
                
                Spacer()
                
                Button {
                    
                    userStore.userSavedFeed(userId: user.id, feedId: feedId)
                    feedStore.feedSavedUser(userId: user.id, feedId: feedId)
                    
                    DispatchQueue.main.asyncAfter(deadline: .now() + 0.5) {
                        showSaveFeedSheet.toggle()
                    }
                    
                } label: {
                    
                    if let userSaveFeed = userStore.dummy.first(where: { $0.id == user.id })?.saveFeed, userSaveFeed.contains(feedId) {
                        Image("savefill")
                    } else {
                        Image("save")
                    }
                    
                }
                
            }
            .padding(.horizontal)
                .presentationDetents([
                    .height(UIScreen.main.bounds.height / 2.5),
                    .custom(CustomDetent.self)
                ])
        }
        
    }
}




#Preview {
    
    FeedCell(feedId: "", feed: Feed(id: "f333",
                                    userId: "333",
                                    address: "서울",
                                    feedImageURL: ["https://i.postimg.cc/8PK0bxvj/why.jpg",  "https://i.postimg.cc/zXXQKqVs/stop.jpg"],
                                    text: "나한태 왜...", heartPressList: ["333"]),
             user: User(id: "333", name: "pepe", profileImageURL: "https://i.postimg.cc/cLpfbVZM/pepe.jpg", saveFeed: ["f333"], liveState: false)
             ,feedStore: FeedStore()
             ,userStore: UserStore())
    
    
}
