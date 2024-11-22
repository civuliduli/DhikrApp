//
//  SelectDhikrViewController.swift
//  DhikrApp
//
//  Created by Abdulla Civuli on 28.10.24.
//

import UIKit
import Combine

class SelectDhikrViewController: UIViewController {
    
    let viewModel = DhikrViewModel()
    
    private var cancellables = Set<AnyCancellable>()
        
    private lazy var tableView: UITableView = {
        let tableView = UITableView()
        tableView.register(SelectDhikrTableViewCell.self, forCellReuseIdentifier: SelectDhikrTableViewCell.cellIdentifier)
        tableView.dataSource = self
        tableView.delegate = self
        tableView.backgroundColor = .white
        tableView.separatorStyle = .none
        return tableView
    }()
    
    private lazy var profileStreak: ProfileStreak = {
        let profileStreak = ProfileStreak()
        return profileStreak
    }()
    
    init() {
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        viewModel.loadDhikrData()
        tableView.reloadData()
        setupView()
    }
    
    func setupView() {
        view.addSubview(profileStreak)
        view.addSubview(tableView)
        
        profileStreak.anchor(
            top: view.layoutMarginsGuide.topAnchor, left: view.leftAnchor, right: view.rightAnchor, topConstant: 5, leftConstant: 24, rightConstant: 36, heightConstant: 30
        )
        
        tableView.anchor(
            top: profileStreak.bottomAnchor, left: view.leftAnchor, bottom: view.layoutMarginsGuide.bottomAnchor, right: view.rightAnchor, topConstant: 24, leftConstant: 30, bottomConstant: 8, rightConstant: 30
        )
    }
}
