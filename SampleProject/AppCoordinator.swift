//
//  AppCoordinator.swift
//  SampleProject
//
//  Created by Ege Girsen on 27.02.2021.
//

import UIKit


class AppCoordinator{
    
    private let window: UIWindow
    
    init(window: UIWindow) {
        self.window = window
    }
    
    func start(){
        let viewController = ViewController.instantiate(viewModel: UsersListViewModel())
        let navigationController = UINavigationController(rootViewController: viewController)
        window.rootViewController = navigationController
        window.makeKeyAndVisible()
    }
}
