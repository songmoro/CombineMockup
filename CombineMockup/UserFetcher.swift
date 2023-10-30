//
//  UserFetcher.swift
//  CombineMockup
//
//  Created by 송재훈 on 10/30/23.
//

import SwiftUI
import Combine
import Alamofire

// MARK: - Fetchable
protocol Fetchable {
    func fetch<T>(with url: URL) -> AnyPublisher<DataResponse<T, APIError>, Never> where T: Decodable
}
//: - Fetchable

// MARK: - User Fetchable
protocol UserFetchable {
    func fetchUser() -> AnyPublisher<DataResponse<User, APIError>, Never>
}
//: - User Fetchable

// MARK: - User Fetcher
class UserFetcher {
    private let url = URL(string: "https://reqres.in/api/users/1")!
}

extension UserFetcher: UserFetchable, Fetchable {
    func fetchUser() -> AnyPublisher<Alamofire.DataResponse<User, APIError>, Never> {
        return fetch(with: url)
    }
    
    func fetch<T>(with url: URL) -> AnyPublisher<Alamofire.DataResponse<T, APIError>, Never> where T : Decodable {
        return AF.request(url, method: .get)
            .validate()
            .publishDecodable(type: T.self)
            .map { response in
                response.mapError { error in
                    APIError.network(message: error.localizedDescription)
                }
            }
            .receive(on: DispatchQueue.main)
            .eraseToAnyPublisher()
    }
}
//: - User Fetcher
