//
//  PostsViewController.swift
//  instagramDemo
//
//  Created by Fatma Dagdevir on 11/25/18.
//  Copyright © 2018 Fatma Dagdevir. All rights reserved.
//

import UIKit
import RxSwift
import RxCocoa

class PostsViewController: BaseViewController {
    
    @IBOutlet weak var tableView: UITableView!
    private let disposeBag = DisposeBag()
    private let viewModel = PostListViewModel()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupUI()
        setupBinding()
    }
    
    private func setupUI() {
        
        tableView.rx
            .willDisplayCell
            .subscribe(onNext: { cell, indexPath in
            
            })
            .disposed(by: disposeBag)
        
        tableView.register(UINib(nibName: PostTableViewCell.className, bundle: nil), forCellReuseIdentifier: PostTableViewCell.className)
        tableView.rowHeight = UITableViewAutomaticDimension
        tableView.estimatedRowHeight = 100
        startLoading()
    }
    
    func setupBinding() {
        
        viewModel.posts.asObservable()
            .observeOn(MainScheduler.instance)
            .do(onNext: { [weak self] _ in
                self?.stopLoading()
            })
            .bind(to: tableView.rx.items(cellIdentifier: "PostTableViewCell", cellType: PostTableViewCell.self)) { (_, viewModel, cell) in
                cell.setupCell(viewModel: viewModel)
            }
            .disposed(by: disposeBag)
    }
}
