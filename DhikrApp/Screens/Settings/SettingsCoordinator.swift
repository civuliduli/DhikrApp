//
//  SettingsCoordinator.swift
//  DhikrApp
//
//  Created by Abdulla Civuli on 10.11.24.
//

import UIKit

class SettingsCoordinator: Coordinator {
    var childCoordinator = [Coordinator]()
    var navigationController: UINavigationController
    
    init(navigationController: UINavigationController) {
        self.navigationController = navigationController
    }
    
    func start() {
        let viewController = SettingsViewController(settingsCoordinator: self)
        viewController.tabBarItem.title = "Settings"
        viewController.tabBarItem.image = .settingsIcon
        viewController.tabBarItem.selectedImage = .settingsIconFilled
        navigationController.pushViewController(viewController, animated: true)
    }
}
