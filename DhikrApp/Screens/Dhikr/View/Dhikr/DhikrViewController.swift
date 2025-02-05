//
//  DhikrViewController.swift
//  DhikrApp
//
//  Created by Abdulla Civuli on 20.11.24.
//

import UIKit

class DhikrViewController: UIViewController {
    
    //TODO: MIGRATE ALL OF THIS INTO CORE DATA FROM JSON FILE
    //TODO: When dhikr is finished show a message for user
    
    var dhikr: Dhikr?
    
    lazy var dhikrTimeView: DhikrTimeView = {
        let view = DhikrTimeView()
        return view
    }()
    
    var count = 0
    
    var dhikrCounts: [Int: Int] = [:]
        
    lazy var tableView: UITableView = {
        let tableView = UITableView()
        tableView.register(DhikrCardTableViewCell.self, forCellReuseIdentifier: DhikrCardTableViewCell.cellIdentifier)
        tableView.dataSource = self
        tableView.delegate = self
        tableView.backgroundColor = .white
        tableView.separatorStyle = .none
        tableView.rowHeight = UITableView.automaticDimension
        tableView.estimatedRowHeight = 100
        return tableView
    }()
    
    init() {
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        if let dhikr = dhikr {
            self.navigationItem.title = dhikr.title
            self.navigationItem.titleView?.tintColor = .black
            dhikrTimeView.timeToPerformDhikr.text = String("Koha e dhikrit: \(dhikr.time)")
        }
        if let dhikrCount = dhikr?.dhikr.count {
            print("DULIIII \(dhikrCount)")
        } else {
            print("DULIIII - dhikr is nil or empty")
        }
        setupView()
        tableView.reloadData()
    }
    
    func setupView() {
        view.addSubview(dhikrTimeView)
        view.addSubview(tableView)
        dhikrTimeView.anchor(
            top: view.layoutMarginsGuide.topAnchor, topConstant: 5, heightConstant: 20
        )
        dhikrTimeView.centerX(to: view)
        tableView.anchor(
            top: dhikrTimeView.bottomAnchor, left: view.leftAnchor, bottom: view.layoutMarginsGuide.bottomAnchor, right: view.rightAnchor, topConstant: 5, leftConstant: 16, bottomConstant: 5, rightConstant: 16
        )
    }
    
    @objc func shareDhikr(_ sender: UIButton) {
        let index = sender.tag
        if let dhikr = dhikr?.dhikr[index] {
            let items = [dhikr.transliteration, dhikr.dhikrData.dhikr_Sq]
            let ac = UIActivityViewController(activityItems: items, applicationActivities: nil)
            present(ac, animated: true)
        }
    }
    
    @objc func countDhikr(_ sender: UIButton) {
        let index = sender.tag
        if let cell = tableView.cellForRow(at: IndexPath(row: index, section: 0)) as? DhikrCardTableViewCell {
            if let dhikr = dhikr?.dhikr[index] {
                count += 1
                print(count)
                print("Selected dhikr \(dhikr.count)")
                sender.isEnabled = true
                //TODO: count is global and it causes conflict with other dhikr cards try adding another variable inside the countDhikr button and another to count how many dhikr the user did.
                
                let targetCount = dhikr.count
                let currentCount = (dhikrCounts[index] ?? 0) + 1
                
                dhikrCounts[index] = currentCount
                sender.setTitle(" \(currentCount) / \(dhikr.count)", for: .normal)
                
                if currentCount >= targetCount {
                    cell.refreshButton.isHidden = false
                    sender.setImage(.checkMarkIcon, for: .normal)
                    sender.isEnabled = false
                    sender.tintColor = .white
                    sender.backgroundColor = .systemBlue
                    sender.setTitle("", for: .normal)
                } else if dhikr.count == 0 {
                    cell.refreshButton.isHidden = false
                    sender.isEnabled = false
                    sender.setImage(.checkMarkIcon, for: .normal)
                    sender.tintColor = .white
                    sender.backgroundColor = .systemBlue
                    sender.setTitle("", for: .normal)
                }
            }
        }
    }
    
    @objc func refreshDhikr(_ sender: UIButton) {
         let index = sender.tag // Identify the row
//        guard index < dhikr?.dhikr[index].count ?? 0 else { return }
         dhikrCounts[index] = 0
         tableView.reloadRows(at: [IndexPath(row: index, section: 0)], with: .automatic)
     }
}

//TODO: Start the task with implementing the bookmark and love function do it with firebase or core data

extension DhikrViewController: UITableViewDataSource, UITableViewDelegate {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return dhikr?.dhikr.count ?? 0
    }
    
    //TODO: Fix the refreshing table view which causes trouble in the cells and does not save the current status of counted dhikr
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: DhikrCardTableViewCell.cellIdentifier, for: indexPath)
                as? DhikrCardTableViewCell else {
            return UITableViewCell()
        }
        cell.shareButton.tag = indexPath.row
        cell.countDhikrButton.tag = indexPath.row
        cell.refreshButton.tag = indexPath.row
        cell.shareButton.addTarget(self, action: #selector(shareDhikr(_:)), for: .touchUpInside)
        cell.countDhikrButton.addTarget(self, action: #selector(countDhikr(_:)), for: .touchUpInside)
        cell.refreshButton.addTarget(self, action: #selector(refreshDhikr(_:)), for: .touchUpInside)
        if let dhikrEntry = dhikr?.dhikr[indexPath.row] {
            cell.configureDhikrCard(dhikr: dhikrEntry)
        } else {
            print("No data for row \(indexPath.row)")
        }
        return cell
    }
}
