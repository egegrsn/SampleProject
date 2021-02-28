//
//  UsersListViewModel.swift
//  SampleProject
//
//  Created by Ege Girsen on 28.02.2021.
//

import Foundation
import RxSwift

final class UsersListViewModel{
    let title = "Users"
    
    private let userService: UserServiceProtocol
    
    init(userService: UserServiceProtocol = UserService()){
        self.userService = userService
    }
    
    func fetchUserViewModels() -> Observable<[UserViewModel]> {
        userService.fetchUsers().map { $0.map { UserViewModel(user: $0) } }
    }
    
}
