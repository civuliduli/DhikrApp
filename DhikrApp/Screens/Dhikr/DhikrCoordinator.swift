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
        let viewController = DhikrViewController(dhikrCoordinator: self)
        viewController.tabBarItem.title = "Home"
        viewController.tabBarItem.image = .homeIcon
        viewController.tabBarItem.selectedImage = .homeIconFilled
        navigationController.pushViewController(viewController, animated: true)
    }
}
