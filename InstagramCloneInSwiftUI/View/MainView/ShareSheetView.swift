//
//  ShareSheetView.swift
//  InstagramCloneInSwiftUI
//
//  Created by 정석호 on 2024/03/28.
//

import SwiftUI

struct ShareSheetView: View {
    
    @State var user: User
    @ObservedObject var userStore: UserStore
    @State var searchText: String = ""
    @State var messageText: String = ""
    @State var newGroupText: String = ""
    @State var otherPeopleFullscreen: Bool = false
    @State var searchFullscreen: Bool = false
    @State var isSelectedUser: [String] = []
    @State var isSelectedGroupUser: [String] = []
    
    let gridItems: [GridItem] = [
        .init(.flexible()),
        .init(.flexible()),
        .init(.flexible())
    ]
    
    func selectUser(userId: String) {
        if let index = isSelectedUser.firstIndex(of: userId) {
            isSelectedUser.remove(at: index)
        } else {
            isSelectedUser.append(userId)
        }
    }
    
    func selectGroupUser(userId: String) {
        if let index = isSelectedGroupUser.firstIndex(of: userId) {
            isSelectedGroupUser.remove(at: index)
        } else {
            isSelectedGroupUser.append(userId)
        }
    }
    
    func checkSelectedUser(userId: String) -> Bool {
        return isSelectedUser.contains(userId)
    }
    
    func checkGroupMember(userId: String) -> Bool {
        return isSelectedGroupUser.contains(userId)
    }
    
    var body: some View {
        
        VStack {
            HStack {
                
                Image(systemName: "magnifyingglass")
                    .padding(.leading)
                
                Button {
                    
                    searchFullscreen.toggle()
                    
                } label: {
                    Text("검색")
                        .foregroundStyle(Color(hexCode: "C8C8C8"))
                    Spacer()
                }
                
                
                Button {
                    isSelectedUser = []
                    otherPeopleFullscreen.toggle()
                } label: {
                    Image(systemName: "person.2")
                        .foregroundStyle(.black)
                }
                .padding()
                
            }
            .background(Color(hexCode: "#FAFAFA"))
            .cornerRadius(8)
            .padding(.horizontal)
            
            ScrollView {
                
                LazyVGrid(columns: gridItems) {
                    // 현재 사용자 제외, 공유 눌린 피드의 사용자부터 팔로우한 유저 순으로, 클릭이 되면 체크표시
                    /*
                     현재유저+팔로우에 대한 정의가 안되어있음으로
                     현재유저가 공유 버튼을 누른 피드를 쓴 유저가 되어있다.
                     정의가 되면 각 ForEach문에 넣어 목록을 재설정해야한다.
                    */
                    
                    ForEach(userStore.dummy.filter({ $0.id != user.id })) { follow in
                        
                        Button {
                            selectUser(userId: follow.id)
                        } label: {
                            VStack {
                                ZStack {
                                    URLImage(url: URL(string: follow.profileImageURL)!, size: CGSize(width: 75, height: 75))
                                        .clipShape(Circle())
                                        .overlay {
                                            RoundedRectangle(cornerRadius: 50)
                                                .stroke(Color(hexCode: "C8C8C8") ,lineWidth: 1.0)
                                            if checkSelectedUser(userId: follow.id) {
                                                Image(systemName: "checkmark.circle.fill")
                                                    .resizable()
                                                    .aspectRatio(contentMode: .fit)
                                                    .frame(width: 22)
                                                    .background(.white)
                                                    .cornerRadius(50)
                                                    .overlay {
                                                        RoundedRectangle(cornerRadius: 50)
                                                            .stroke(.white, lineWidth: 2)
                                                        
                                                        
                                                    }
                                                    .padding(.trailing, 2)
                                                    .offset(x: 28, y: 28)
                                            }
                                        }
                                    }
                                
                                Text(follow.name)
                                    .foregroundStyle(.black)
                            }
                        }
                        .padding(12)
                    }
                }
                .padding(.horizontal, 16)
            }
            
            Divider()
            
            if isSelectedUser.isEmpty {
                ShareIconsView
            } else {
                SendMessageView
            }
            
        }
        .padding(.top)
        .toolbar {
            ToolbarItem(placement: .status) {
                ScrollView(.horizontal) {
                    ForEach(0...5, id: \.self) { index in
                        Circle()
                    }
                }
            }
            
        }
        .fullScreenCover(isPresented: $searchFullscreen, content: {
            VStack {
                HStack {
                    HStack {
                        
                        Image(systemName: "magnifyingglass")
                            .padding(.leading, 10)
                        
                        TextField(text: $searchText) {
                            
                            Text("검색")
                            Spacer()
                        }
                        
                        
                        
                    }
                    .padding(.vertical, 12)
                    .background(Color(hexCode: "#FAFAFA"))
                    .cornerRadius(8)
                    .padding(.leading)
                    
                    Button {
                        
                        searchFullscreen.toggle()
                        searchText = ""
                        
                    } label: {
                        Text("취소")
                            .foregroundStyle(.black)
                    }
                    .padding(.trailing)
                }
            
                ScrollView {
                    ForEach(searchText.isEmpty ? userStore.dummy.filter({$0.id != user.id}) : userStore.dummy.filter({
                        
                        ($0.name.contains(searchText.lowercased()) || searchText.lowercased().contains($0.name)) &&
                        $0.id != userStore.dummy[0].id
                            
                        
                    })) { follow in
                        Button {
                            
                            selectUser(userId: follow.id)
                            // 약 1 - 2초 딜레이하고 내려가게 조정해보자
                            
                            // 비동기 처리를 해서 메인스레드로 보내는 것
                            DispatchQueue.main.asyncAfter(deadline: .now() + 0.5) {
                                searchFullscreen.toggle()
                                searchText = ""
                            }
                        } label: {
                            HStack {
                                URLImage(url: URL(string: follow.profileImageURL)!, size: CGSize(width: 50, height: 50))
                                    .clipShape(Circle())
                                    .overlay {
                                        RoundedRectangle(cornerRadius: 50)
                                            .stroke(Color(hexCode: "C8C8C8"), lineWidth: 1)
                                    }
                                
                                Text(follow.name)
                                    .foregroundStyle(.black)
                                    .fontWeight(.semibold)
                                
                                Spacer()
                                
                                Image(systemName: checkSelectedUser(userId: follow.id) ? "checkmark.circle.fill" : "circlebadge")
                                    .resizable()
                                    .aspectRatio(contentMode: .fit)
                                    .frame(width: 25)
                                    .foregroundStyle(checkSelectedUser(userId: follow.id) ? .blue : .gray)
                                
                            }
                        }
                        .padding(.vertical, 7)
                        .padding(.horizontal)
                        
                        
                    }
                }
            }
            
        })
        .fullScreenCover(isPresented: $otherPeopleFullscreen, content: {
            OtherPeopleView
        })
    }
}

extension ShareSheetView {
    
    var OtherPeopleView: some View {
        
        VStack {
            HStack(spacing: 0) {
                Button {
                    isSelectedGroupUser = []
                    otherPeopleFullscreen.toggle()
                } label: {
                    Text("취소")
                        .foregroundStyle(.black)
                }
                .padding(.leading)

                Spacer()
                
                Text("새 그룹")
                    .fontWeight(.semibold)
                
                Spacer()
            
                Text("      ")
                    .padding(.trailing)
            }
            Divider()
            
            HStack {
                TextField(text: $newGroupText) {
                    Text("새 그룹(선택 사항)")
                }
                
                if !newGroupText.isEmpty {
                    Button {
                        newGroupText = ""
                    } label: {
                        Image(systemName: "x.circle.fill")
                            .foregroundStyle(Color.init(hexCode: "C8C8C8"))
                    }
                }
                
            }
            .padding(.vertical, 8)
            .padding(.horizontal)
            
            VStack {
                HStack {
                    Text("받는 사람")
                        .bold()
                    
                    Spacer()
                    
                }
                
                HStack {
                    ScrollView(.horizontal) {
                        HStack(spacing: 5) {
                            ForEach(userStore.dummy.filter({checkGroupMember(userId: $0.id)})) { user in
                                Button {
                                    selectGroupUser(userId: user.id)
                                } label: {
                                    Text(user.name)
                                        .foregroundStyle(.white)
                                        .padding(.vertical, 10)
                                        .padding(.horizontal, 15)
                                        .background(.blue)
                                        .cornerRadius(25)
                                }
                                
                            }
                        }
                        
                    } // ScrollView
                    .scrollIndicators(.hidden)
                    // 이름이 길 때 대응할 수 있도록 구현되야한다.
                    .frame(width: (75 * CGFloat(isSelectedGroupUser.count)) >= 220 ? 220 : 75 * CGFloat(isSelectedGroupUser.count))
                    
                    
                    TextField(text: $searchText) {
                        if isSelectedUser.isEmpty {
                            Text("검색")
                        }
                    }
                }
                .frame(height: 30)
                .padding(isSelectedUser.isEmpty ? .horizontal : .trailing)
               
                
            }
            .padding(.leading)
            
            ScrollView {
                HStack {
                    Text("추천")
                        .bold()
                    
                    Spacer()
                }
                if searchText.isEmpty {
                    ForEach(userStore.dummy.filter({ $0.id != user.id})) { user in
                        
                        Button {
                            
                            selectGroupUser(userId: user.id)
                            
                        } label: {
                            HStack {
                                
                                URLImage(url: URL(string: user.profileImageURL)!, size: CGSize(width: 60, height: 60))
                                    .clipShape(Circle())
                                    .overlay {
                                        RoundedRectangle(cornerRadius: 100)
                                            .stroke(Color(hexCode: "C8C8C8"), lineWidth: 1)
                                    }
                                
                                Text(user.name)
                                    .fontWeight(.semibold)
                                    .foregroundStyle(.black)
                                
                                Spacer()
                                
                                if checkGroupMember(userId: user.id) {
                                    Image(systemName: "checkmark.circle.fill")
                                        .resizable()
                                        .aspectRatio(contentMode: .fit)
                                        .frame(width: 25)
                                } else {
                                    Image(systemName: "circle")
                                        .resizable()
                                        .aspectRatio(contentMode: .fit)
                                        .frame(width: 25)
                                        .foregroundStyle(Color(hexCode: "C8C8C8"))
                                }
                                
                            }
                        }
                        .padding(.vertical, 5)
                    }
                   
                    
                } else {
                    
                    // 검색 조건
                    // 글자 속에 이름이 있거나 ex) pepe를 shpepesh일 때
                    // 한 글자일 때도 첫글자 대문자일 때도 ex) pepe를 P를 p
                    // 현재 유저로 설정한 userStore.dummy[0] 유저가 안나오게 설정
                    
                    ForEach(userStore.dummy.filter({
                        
                        ($0.name.contains(searchText.lowercased()) || searchText.lowercased().contains($0.name)) &&
                        $0.id != userStore.dummy[0].id
                            
                        
                    })) { user in
                            
                            Button {
                                
                                selectGroupUser(userId: user.id)
                                searchText = ""
                                
                            } label: {
                                HStack {
                                    
                                    URLImage(url: URL(string: user.profileImageURL)!, size: CGSize(width: 60, height: 60))
                                        .clipShape(Circle())
                                        .overlay {
                                            RoundedRectangle(cornerRadius: 100)
                                                .stroke(Color(hexCode: "C8C8C8"), lineWidth: 1)
                                        }
                                    
                                    Text(user.name)
                                        .fontWeight(.semibold)
                                        .foregroundStyle(.black)
                                    
                                    Spacer()
                                    
                                    if checkGroupMember(userId: user.id) {
                                        Image(systemName: "checkmark.circle.fill")
                                            .resizable()
                                            .aspectRatio(contentMode: .fit)
                                            .frame(width: 25)
                                    } else {
                                        Image(systemName: "circle")
                                            .resizable()
                                            .aspectRatio(contentMode: .fit)
                                            .frame(width: 25)
                                            .foregroundStyle(Color(hexCode: "C8C8C8"))
                                    }
                                    
                                }
                            }
                            .padding(.vertical, 5)
                            
                    } // ForEach
                    
                }
                
            } // ScrollView
            .padding(.horizontal)

            Divider()
            VStack {
                
                Button {
                    
                    // 그룹으로 메세지를 보내는 기능 버튼
                    
                } label: {
                    RoundedRectangle(cornerRadius: 8)
                        .opacity(isSelectedGroupUser.count > 1 ? 1 : 0.7)
                        .frame(width: 360, height: 50)
                }
                .overlay {
                    Text("그룹에 보내기")
                        .font(.headline)
                        .foregroundStyle(.white)
                }
                .disabled(isSelectedGroupUser.count > 1 ? false : true)
               
            }
            
        }
        
    }
    
    var SendMessageView: some View {
        VStack {
           
            TextField(text: $messageText) {
                Text("메시지 작성...")
            }
            .padding(.horizontal)
            .padding(.vertical, 9)
            
            Divider()
            Button {
                
                // 선택 된 유저에게 메세지 전송 기능 버튼
                
            } label: {
                HStack {
                    Spacer()
                    Text("보내기")
                    Spacer()
                }
                .padding(.vertical, 7)
            }
            .buttonStyle(.borderedProminent)
            .padding(.horizontal)
            .padding(.top, 7)
        }
        
    }
    
    var ShareIconsView: some View {
        
        
        ScrollView(.horizontal){
            
            HStack {
                
                Button {
                    
                } label: {
                    VStack {
                        Image("addstory")
                            .resizable()
                            .aspectRatio(contentMode: .fit)
                            .frame(width: 50)
                        Text("스토리에 추가")
                    }
                }
                .frame(width: 70)
                
                Button {
                    
                } label: {
                    VStack {
                        Image("linkcopy")
                            .resizable()
                            .aspectRatio(contentMode: .fit)
                            .frame(width: 50)
                        Text("링크 복사")
                    }
                }
                .frame(width: 70)
                
                
                Button {
                    
                } label: {
                    VStack {
                        Image("othershare")
                            .resizable()
                            .aspectRatio(contentMode: .fit)
                            .frame(width: 50)
                        Text("공유 대상...")
                    }
                }
                .frame(width: 70)
                
                
                Button {
                    
                } label: {
                    VStack {
                        Image("message")
                            .resizable()
                            .aspectRatio(contentMode: .fit)
                            .frame(width: 50)
                        Text("메시지")
                    }
                }
                .frame(width: 70)
                
                
                Button {
                    
                } label: {
                    VStack {
                        Image("messagen")
                            .resizable()
                            .aspectRatio(contentMode: .fit)
                            .frame(width: 50)
                        Text("Messenger")
                    }
                }
                .frame(width: 70)
                
                
                Button {
                    
                } label: {
                    VStack {
                        Image("threads")
                            .resizable()
                            .aspectRatio(contentMode: .fit)
                            .frame(width: 50)
                        Text("Threads")
                    }
                }
                .frame(width: 70)
                
                
                Button {
                    
                } label: {
                    VStack {
                        Image("snapchat")
                            .resizable()
                            .aspectRatio(contentMode: .fit)
                            .frame(width: 50)
                        Text("Snapchat")
                    }
                }
                .frame(width: 70)
                
                
                Button {
                    
                } label: {
                    VStack {
                        Image("xicon")
                            .resizable()
                            .aspectRatio(contentMode: .fit)
                            .frame(width: 50)
                        Text("X")
                    }
                }
                .frame(width: 70)
                
                
                Button {
                    
                } label: {
                    VStack {
                        Image("whatsapp")
                            .resizable()
                            .aspectRatio(contentMode: .fit)
                            .frame(width: 50)
                        Text("WhatsApp")
                    }
                }
                .frame(width: 70)
                
                Button {
                    
                } label: {
                    VStack {
                        Image("facebookicon")
                            .resizable()
                            .aspectRatio(contentMode: .fit)
                            .frame(width: 50)
                        Text("Facebook")
                    }
                }
                .frame(width: 70)
            }
            .padding(.horizontal, 10)
            
            
        }
        .padding(.top)
        .font(.caption)
        .foregroundStyle(.black)
        .scrollIndicators(.hidden)
    }
}

#Preview {
    ShareSheetView(user: User(id: "222", name: "pepe", profileImageURL: "https://i.postimg.cc/cLpfbVZM/pepe.jpg", saveFeed: ["f333"], liveState: false), userStore: UserStore())
}
