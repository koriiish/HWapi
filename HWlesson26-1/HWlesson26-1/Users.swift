//
//  Users.swift
//  HWlesson26-1
//
//  Created by Карина Дьячина on 12.03.24.
//

import Foundation
//class User: Decodable {
    
    struct Users: Codable {
        let name: String
        let username: String
        let email: String
        let address: Address
    }
    
    struct Address: Codable {
        let city: String
        let street: String
        let suite: String
    }
    
//    enum codingKeys: String, CodingKey {
//        case userName = "username"
//    }
//    
//    required init(from decoder: Decoder) throws {
//        // Nested ratings
//        let container = try decoder.container(keyedBy: codingKeys.self)
//        userName = try container.decode(String.self, forKey: .userName)
//    }


