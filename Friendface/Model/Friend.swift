//
//  Friend.swift
//  Friendface
//
//  Created by Vlastimir Radojevic on 1/29/19.
//  Copyright © 2019 Vlastimir Radojevic. All rights reserved.
//

import Foundation

struct Friend: Codable {
    let id: UUID
    let isActive: Bool
    let name: String
    let age: Int
    let company: String
    let email: String
    let address: String
    let about: String
    let registered: Date
    let tags: [String]
    let friends: [Connection]
    
    var friendList: String {
        return self.friends.map { $0.name }.joined(separator: ", ")
    }
}

extension Array where Element == Friend {
    // filtering and matching element where the element is a specific type
    func matching(_ text: String?) -> [Friend] {
        if let text = text, text.count > 0 {
            return self.filter {
                $0.name.contains(text)
                    || $0.company.contains(text)
                    || $0.address.contains(text)
            }
        } else {
            return self
        }
    }
}
