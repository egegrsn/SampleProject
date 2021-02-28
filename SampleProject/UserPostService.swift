//
//  UserPostService.swift
//  SampleProject
//
//  Created by Ege Girsen on 28.02.2021.
//

import Foundation
import RxSwift

protocol UserPostServiceProtocol {
    func fetchPostUsers(UserId : Int) -> Observable<[UserPost]>
}

class UserPostService: UserPostServiceProtocol {
    
    func fetchPostUsers(UserId : Int) -> Observable<[UserPost]> {
        return Observable.create { observer -> Disposable in
            let urlString = "https://jsonplaceholder.typicode.com/posts?userId=\(UserId)"
            let task = URLSession.shared.dataTask(with: URL(string: urlString)!) { data, _, _ in
                
                guard let data = data else {
                    observer.onError(NSError(domain: "", code: -1, userInfo: nil))
                    return // Disposables.create { }
                }
                do {
                    let userPost = try JSONDecoder().decode([UserPost].self, from: data)
                    observer.onNext(userPost)
                    
                } catch{
                    observer.onError(error)
                }
            }
            task.resume()
            return Disposables.create {
                task.cancel()
            }
        }
    }
}


