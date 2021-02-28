//
//  UserPostViewModel.swift
//  SampleProject
//
//  Created by Ege Girsen on 28.02.2021.
//

import Foundation

struct UserPostViewModel {
    private let userPost: UserPost
    var displayText: String {
        let output = userPost.title
        return output
    }
    init(userPost: UserPost) {
        self.userPost = userPost
    }
}
