//
//  UserPostsListViewModel.swift
//  SampleProject
//
//  Created by Ege Girsen on 28.02.2021.
//

import Foundation
import RxSwift

final class UsersPostsListViewModel{
    let title = "User's Post"
    
    private let userPostService: UserPostServiceProtocol
    
    init(userPostService: UserPostServiceProtocol = UserPostService()){
        self.userPostService = userPostService
    }
    
    func fetchUserPostViewModels(UserId : Int) -> Observable<[UserPostViewModel]> {
        userPostService.fetchPostUsers(UserId: UserId).map { $0.map { UserPostViewModel(userPost: $0) } }
    }
    
}
