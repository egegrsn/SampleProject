//
//  UserPostVC.swift
//  SampleProject
//
//  Created by Ege Girsen on 28.02.2021.
//

import UIKit
import RxSwift
import RxCocoa

class UserPostVC: UIViewController {
    
    let disposeBag = DisposeBag()
    var viewModel: UsersPostsListViewModel!
    @IBOutlet weak var tableView: UITableView!
    
    var UserId: Int = 0;

    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableView.tableFooterView = UIView()
        navigationItem.title = viewModel.title
        navigationController?.navigationBar.prefersLargeTitles = true
        tableView.contentInsetAdjustmentBehavior = .never
        
        viewModel.fetchUserPostViewModels(UserId: UserId).observe(on: MainScheduler.instance).bind(to: tableView.rx.items(cellIdentifier: "cell")) { index, viewModel, cell in cell.textLabel?.text = viewModel.displayText
        }.disposed(by: disposeBag)
         
    }//End of viewDidLoad()
    

}
