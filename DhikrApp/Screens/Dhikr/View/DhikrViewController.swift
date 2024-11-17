//
//  DhikrViewController.swift
//  DhikrApp
//
//  Created by Abdulla Civuli on 28.10.24.
//

import UIKit

class DhikrViewController: UIViewController {
    
    // TODO: take the json file and decode it with json decoder
    // TODO: Show the dhikr title and time to the new table view
    // Make the view controller with sections one section will contain the streak and profile name and the other will contain the table view with dhikrs
    
    private(set) weak var dhikrCoordinator: DhikrCoordinator?
    
    init(dhikrCoordinator: DhikrCoordinator?) {
        super.init(nibName: nil, bundle: nil)
        self.dhikrCoordinator = dhikrCoordinator
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        print("Hello from Duliii")
        view.backgroundColor = .blue
    }
}

