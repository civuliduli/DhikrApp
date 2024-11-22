//
//  SelectDhikrViewController + Extensions.swift
//  DhikrApp
//
//  Created by Abdulla Civuli on 18.11.24.
//

import UIKit

extension SelectDhikrViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return viewModel.dhikrData?.count ?? 0
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 120
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        guard let selectedDhikr = viewModel.dhikrData?[indexPath.row] else {
            print("No data for selected row")
            return
        }
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
        } else {
            print("No data for row \(indexPath.row)")
        }
        return cell
    }
}
