//
//  ViewController.swift
//  SampleProject
//
//  Created by Ege Girsen on 27.02.2021.
//

import UIKit
import RxSwift
import RxCocoa

class ViewController: UIViewController{
    
    let disposeBag = DisposeBag()
    private var viewModel: UsersListViewModel!
    private var userpostlistviewModel: UsersPostsListViewModel!
    @IBOutlet weak var tableView: UITableView!
    
    static func instantiate(viewModel: UsersListViewModel) -> ViewController {
        let storyboard = UIStoryboard(name: "Main", bundle: .main)
        let viewController = storyboard.instantiateInitialViewController() as! ViewController
        viewController.viewModel = viewModel
        return viewController
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        tableView.tableFooterView = UIView()
        navigationItem.title = viewModel.title
        navigationController?.navigationBar.prefersLargeTitles = true
        tableView.contentInsetAdjustmentBehavior = .never
        
        viewModel.fetchUserViewModels().observe(on: MainScheduler.instance).bind(to: tableView.rx.items(cellIdentifier: "cell")) { index, viewModel, cell in cell.textLabel?.text = viewModel.displayText
        }.disposed(by: disposeBag)
        
        tableView
            .rx.modelSelected(UserViewModel.self)
            .subscribe(onNext: {
             userObject in
                let UserPostVC = self.storyboard?.instantiateViewController(identifier: "UserPostVC") as! UserPostVC
                UserPostVC.viewModel = UsersPostsListViewModel()
                // Passing the user id
                UserPostVC.UserId = userObject.userid
                self.navigationController?.pushViewController(UserPostVC, animated: true)
            }).disposed(by: disposeBag)
        
    }//End of viewDidLoad()
}

