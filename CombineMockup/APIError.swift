//
//  APIError.swift
//  CombineMockup
//
//  Created by 송재훈 on 10/30/23.
//

// MARK: - API Error
enum APIError: Error {
    case request(message: String)
    case network(message: String)
    case status(message: String)
    case parsing(message: String)
    case other(message: String)
    
    static func map(_ error: Error) -> APIError {
        return (error as? APIError) ?? .other(message: error.localizedDescription)
    }
}
//: - API Error
