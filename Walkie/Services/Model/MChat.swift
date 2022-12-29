

import UIKit
import FirebaseFirestore

struct MChat: Hashable, Decodable {
    var friendUsername: String
    var friendAvatarStringURL: String
    var lastMessageContent: String
    var friendId: String
    
    var representation: [String : Any] {
        var rep = ["friendUsername": friendUsername]
        rep["friendAvatarStringURL"] = friendAvatarStringURL
        rep["friendId"] = friendId
        rep["lastMessage"] = lastMessageContent
        return rep
    }
    
    init(friendUsername: String, friendAvatarStringURL: String, friendId: String, lastMessageContent: String) {
        self.friendUsername = friendUsername
        self.friendAvatarStringURL = friendAvatarStringURL
        self.friendId = friendId
        self.lastMessageContent = lastMessageContent
    }
    
    init?(document: QueryDocumentSnapshot) {
        let data = document.data()
        guard let friendUsername = data["friendUsername"] as? String,
        let friendAvatarStringURL = data["friendAvatarStringURL"] as? String,
        let friendId = data["friendId"] as? String,
        let lastMessageContent = data["lastMessage"] as? String else { return nil }
        
        self.friendUsername = friendUsername
        self.friendAvatarStringURL = friendAvatarStringURL
        self.friendId = friendId
        self.lastMessageContent = lastMessageContent
    }
    
    
    func hash(into hasher: inout Hasher) {
        hasher.combine(friendId)
    }
    
    static func == (lhs: MChat, rhs: MChat) -> Bool {
        return lhs.friendId == rhs.friendId
    }
}
