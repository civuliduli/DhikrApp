//
//  AppCoordinator.swift
//  DhikrApp
//
//  Created by Abdulla Civuli on 10.11.24.
//

import Foundation
import UIKit

class AppCoordinator: Coordinator {
    var childCoordinator = [Coordinator]()
    var navigationController: UINavigationController
    
    init(navigationController: UINavigationController) {
        self.navigationController = navigationController
    }
    
    func start() {
        let viewController = TabBarViewController(coordinator: self)
        navigationController.pushViewController(viewController, animated: true)
    }
    
    func test() {
        let viewController = DhikrViewController()
        navigationController.pushViewController(viewController, animated: true)
    }
}
