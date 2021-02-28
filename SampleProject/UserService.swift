//
//  UserService.swift
//  SampleProject
//
//  Created by Ege Girsen on 27.02.2021.
//

import Foundation
import RxSwift

protocol UserServiceProtocol {
    func fetchUsers() -> Observable<[User]>
}

class UserService: UserServiceProtocol {
    
    func fetchUsers() -> Observable<[User]> {
        return Observable.create { observer -> Disposable in
            
            let task = URLSession.shared.dataTask(with: URL(string: "https://jsonplaceholder.typicode.com/users")!) { data, _, _ in
                
                
                guard let data = data else {
                    observer.onError(NSError(domain: "", code: -1, userInfo: nil))
                    return // Disposables.create { }
                }
                do {
                    let user = try JSONDecoder().decode([User].self, from: data)
                    observer.onNext(user)
                    
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


