//
//  DhikrViewController.swift
//  DhikrApp
//
//  Created by Abdulla Civuli on 20.11.24.
//

import UIKit

class DhikrViewController: UIViewController {
    
    var dhikr: Dhikr?
    
    lazy var dhikrTimeView: DhikrTimeView = {
        let view = DhikrTimeView()
        return view
    }()
    
//    private(set) weak var dhikrCoordinator: DhikrCoordinator?
    
//    lazy var tableView: UITableView = {
//        let tableView = UITableView()
//        tableView.register(DhikrCardTableViewCell.self, forCellReuseIdentifier: DhikrCardTableViewCell.cellIdentifier)
//        tableView.dataSource = self
//        tableView.delegate = self
//        tableView.backgroundColor = .white
//        tableView.separatorStyle = .none
//        return tableView
//    }()
    
//    init(dhikrCoordinator: DhikrCoordinator?) {
//        super.init(nibName: nil, bundle: nil)
//        self.dhikrCoordinator = dhikrCoordinator
//    }
    
//    required init?(coder: NSCoder) {
//        fatalError("init(coder:) has not been implemented")
//    }

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .green
        setupView()
    }

    func setupView() {
        view.addSubview(dhikrTimeView)
        dhikrTimeView.anchor(top: view.topAnchor, left: view.leftAnchor, right: view.rightAnchor, topConstant: 24, leftConstant: 16, rightConstant: 16)
    }
}

//#Preview {
//    DhikrViewController(dhikrCoordinator: )
//}

//extension DhikrViewController: UITableViewDataSource, UITableViewDelegate {
//    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
//        <#code#>
//    }
//    
//    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
//        <#code#>
//    }
    
//}
