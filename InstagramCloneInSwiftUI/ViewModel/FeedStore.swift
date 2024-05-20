//
//  FeedStore.swift
//  InstagramCloneInSwiftUI
//
//  Created by 정석호 on 2024/03/18.
//

import Foundation

class FeedStore: ObservableObject {
    
    @Published var dummyFeed = [
        Feed(id: "f222",
             userId: "222",
             address: "대구, 대한민국",
             feedImageURL: ["https://i.postimg.cc/6QQvnd9K/LFn52-RECt4.jpg"],
             text: "야레야레~"),
        Feed(id: "f333",
             userId: "333",
             address: "서울, 대한민국",
             feedImageURL: ["https://i.postimg.cc/gkBVvxT7/why.jpg", "https://i.postimg.cc/mr77f8gx/stop.jpg"],
             text: "나한태 왜..."),
        Feed(id: "f111",
             userId: "111",
             feedImageURL: ["https://i.postimg.cc/hPwD8nbs/coding.jpg"],
             text: "그만 일어나..",
             heartPressList: ["333", "123", "111"]),
        Feed(id: "f123",
             userId: "123",
             address: "샌프란시스코, 미국",
             feedImageURL: ["https://i.postimg.cc/qMgBCqng/can.jpg"],
             text: "할 수 있을까? 허허"),
        Feed(id: "f334",
             userId: "333",
             feedImageURL: ["https://i.postimg.cc/K8zd9thT/again.jpg"],
             text: "다시 잘 해보자"),
        Feed(id: "f335",
             userId: "333",
             feedImageURL: ["https://i.postimg.cc/28jJ6n6t/anoing.png"],
             text: "째증나는군요"),
        Feed(id: "f336",
             userId: "333",
             feedImageURL: ["https://i.postimg.cc/QtLwxP9g/money.jpg"],
             text: "돈이 최고야"),
        Feed(id: "f337",
             userId: "333",
             feedImageURL: ["https://i.postimg.cc/63dS70nk/no.jpg"],
             text: "이건 명언이지.."),
        Feed(id: "f338",
             userId: "333",
             feedImageURL: ["https://i.postimg.cc/rsjPjwhg/ok.jpg"],
             text: "괜찮아!!"),
        Feed(id: "f339",
             userId: "333",
             feedImageURL: ["https://i.postimg.cc/bwB44dqB/proud.jpg"],
             text: "괜찮아!!"),
        Feed(id: "f340",
             userId: "333",
             feedImageURL: ["https://i.postimg.cc/XNkm4sVF/tear.jpg"],
             text: "눈물이 흐른다.."),
        Feed(id: "f341",
             userId: "333",
             feedImageURL: ["https://i.postimg.cc/fyDPY9vJ/tired.jpg"],
             text: "매우 피곤하군요"),
        
        Feed(id: "f342",
             userId: "333",
             feedImageURL: ["https://i.postimg.cc/K8zd9thT/again.jpg"],
             text: "다시 잘 해보자"),
        Feed(id: "f343",
             userId: "333",
             feedImageURL: ["https://i.postimg.cc/28jJ6n6t/anoing.png"],
             text: "째증나는군요"),
        Feed(id: "f344",
             userId: "333",
             feedImageURL: ["https://i.postimg.cc/QtLwxP9g/money.jpg"],
             text: "돈이 최고야"),
        Feed(id: "f345",
             userId: "333",
             feedImageURL: ["https://i.postimg.cc/63dS70nk/no.jpg"],
             text: "이건 명언이지.."),
        Feed(id: "f346",
             userId: "333",
             feedImageURL: ["https://i.postimg.cc/rsjPjwhg/ok.jpg"],
             text: "괜찮아!!"),
        Feed(id: "f347",
             userId: "333",
             feedImageURL: ["https://i.postimg.cc/bwB44dqB/proud.jpg"],
             text: "괜찮아!!"),
        Feed(id: "f348",
             userId: "333",
             feedImageURL: ["https://i.postimg.cc/XNkm4sVF/tear.jpg"],
             text: "눈물이 흐른다.."),
        Feed(id: "f349",
             userId: "333",
             feedImageURL: ["https://i.postimg.cc/fyDPY9vJ/tired.jpg"],
             text: "매우 피곤하군요")
    ]
    
    
    func heartPress(feedId: String, userId: String) {
        
        guard let index = dummyFeed.firstIndex(where: { $0.id == feedId }) else { return }
        
        if let userIndex = dummyFeed[index].heartPressList.firstIndex(where: { $0 == userId }) {
            dummyFeed[index].heartPressList.remove(at: userIndex)
        } else {
            dummyFeed[index].heartPressList.append(userId)
        }
    
    }
    
    func feedSavedUser(userId: String, feedId: String) {
        
        guard let index = dummyFeed.firstIndex(where: { $0.id == feedId }) else { return }
        
        dummyFeed[index].savePressList.append(userId)
        
        if let userIndex = dummyFeed[index].savePressList.firstIndex(where: { $0 == userId }) {
            dummyFeed[index].savePressList.remove(at: userIndex)
        } else {
            dummyFeed[index].savePressList.append(userId)
        }
    }
}
