//
//  SedinDataModel.swift
//  SedinApp
//
//  Created by Deepak on 29/12/21.
//

import Foundation



// MARK: - WelcomeElement

struct UsersData : Codable {
    
    let title:String
    let user: User
//    let createdAt: dateCreated
}

struct User : Codable {
    let login: String
    let avatarURL: String
    enum CodingKeys: String, CodingKey {
        case login
        case avatarURL = "avatar_url"
    }
}

//struct dateCreated : Codable {
//
//    let createdAt: Date
//
//    enum CodingKeys: String, CodingKey {
//        case createdAt = "created_at"
//    }
//}
