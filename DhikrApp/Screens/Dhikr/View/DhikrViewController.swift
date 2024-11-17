//
//  DhikrViewController.swift
//  DhikrApp
//
//  Created by Abdulla Civuli on 28.10.24.
//

import UIKit
import Combine

class DhikrViewController: UIViewController {
    
    let viewModel = DhikrViewModel()
    
    private var cancellables = Set<AnyCancellable>()
    
    private(set) weak var dhikrCoordinator: DhikrCoordinator?
    
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
    
    init(dhikrCoordinator: DhikrCoordinator?) {
        super.init(nibName: nil, bundle: nil)
        self.dhikrCoordinator = dhikrCoordinator
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

extension DhikrViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return viewModel.dhikrData?.count ?? 0
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 120
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(
            withIdentifier: SelectDhikrTableViewCell.cellIdentifier,
            for: indexPath
        ) as? SelectDhikrTableViewCell else {
            print("Failed to dequeue cell")
            return UITableViewCell()
        }
        
        if let dataSource = viewModel.dhikrData?[indexPath.row] {
            cell.configureCell(typeOfDhikr: dataSource.title, timeOfDhikr: dataSource.time)
            print("Configuring cell at row \(indexPath.row) with title: \(dataSource.title)")  // Add debug print
        } else {
            print("No data for row \(indexPath.row)")  // Add debug print
        }
        return cell
    }
}
