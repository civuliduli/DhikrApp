//
//  DhikrCoordinator.swift
//  DhikrApp
//
//  Created by Abdulla Civuli on 10.11.24.
//

import UIKit

class DhikrCoordinator: Coordinator {
    var childCoordinator = [Coordinator]()
    var navigationController: UINavigationController
    
    init(navigationController: UINavigationController) {
        self.navigationController = navigationController
    }
    
    func start() {
        let viewController = SelectDhikrViewController()
        navigationController.pushViewController(viewController, animated: true)
    }
    
    func goToDhikr() {
        let viewController = DhikrViewController()
        navigationController.pushViewController(viewController, animated: true)
    }
}
