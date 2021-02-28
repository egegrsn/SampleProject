//
//  UserPost.swift
//  SampleProject
//
//  Created by Ege Girsen on 28.02.2021.
//

import Foundation

struct UserPost: Decodable {
    let userId: Int
    let id: Int
    let title: String
    let body: String
}
