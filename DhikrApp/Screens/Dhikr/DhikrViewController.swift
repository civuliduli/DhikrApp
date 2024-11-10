//
//  DhikrViewController.swift
//  DhikrApp
//
//  Created by Abdulla Civuli on 28.10.24.
//

import UIKit

class DhikrViewController: UIViewController {
    
    private(set) weak var dhikrCoordinator: DhikrCoordinator?
    
    init(dhikrCoordinator: DhikrCoordinator?) {
        self.dhikrCoordinator = dhikrCoordinator
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        print("Hello from Duliii")
        view.backgroundColor = .blue
        // Do any additional setup after loading the view.
    }


}

