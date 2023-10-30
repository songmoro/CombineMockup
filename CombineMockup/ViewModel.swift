//
//  ViewModel.swift
//  CombineMockup
//
//  Created by 송재훈 on 10/30/23.
//

import SwiftUI
import Alamofire
import Combine

// MARK: - ViewModel
protocol ViewModelInterface: ObservableObject {
    var userList: [User] { get set }
    
    func fetchUser()
}

class ViewModel {
    @Published var userList: [User]
    let userFetcher: UserFetcher
    private var cancellable = Set<AnyCancellable>()
    
    required init() {
        self.userList = [User]()
        self.userFetcher = UserFetcher()
    }
}

extension ViewModel: ViewModelInterface {
    func fetchUser() {
        userFetcher
            .fetchUser()
            .receive(on: DispatchQueue.main)
            .sink { [weak self] response in
                switch response.result {
                case .success(let user):
                    self?.userList.append(user)
                case .failure(let failure):
                    print(failure.localizedDescription)
                    self?.userList = []
                }
            }
            .store(in: &cancellable)
    }
}
//: - ViewModel
