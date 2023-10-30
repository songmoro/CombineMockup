//
//  Model.swift
//  CombineMockup
//
//  Created by 송재훈 on 10/30/23.
//

import SwiftUI

// MARK: - User
struct User: Codable, Identifiable {
    let id = UUID()
    let data: UserData
    let support: UserSupport
    
    enum CodingKeys: String, CodingKey {
        case data
        case support
    }
}
//: - User

// MARK: - User Data
struct UserData: Codable {
    let id: Int
    let email: String
    let firstName: String
    let lastName: String
    let avatar: String
    
    enum CodingKeys: String, CodingKey {
        case id
        case email
        case firstName = "first_name"
        case lastName = "last_name"
        case avatar
    }
}
//: - User Data

// MARK: - User Support
struct UserSupport: Codable {
    let url: String
    let text: String
    
    enum CodingKeys: String, CodingKey {
        case url
        case text
    }
}
//: - User Support
