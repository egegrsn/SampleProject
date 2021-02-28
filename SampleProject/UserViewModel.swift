//
//  UserViewModel.swift
//  SampleProject
//
//  Created by Ege Girsen on 28.02.2021.
//

import Foundation

struct UserViewModel {
    private let user: User
    var displayText: String {
        let output = user.name
        return output
    }
    var userid: Int{
        let id = user.id
        return id
    }
    init(user: User) {
        self.user = user
    }
}
