//
//  TasbihCoordinator.swift
//  DhikrApp
//
//  Created by Abdulla Civuli on 10.11.24.
//
//
import UIKit

class TasbihCoordinator: Coordinator {
    var childCoordinator = [Coordinator]()
    var navigationController: UINavigationController
    
    init(navigationController: UINavigationController) {
        self.navigationController = navigationController
    }
    
    func start() {
        let viewController = TasbihViewController(tasbihCoordinator: self)
        viewController.tabBarItem.title = "Tasbih"
        viewController.tabBarItem.image = .tasbihIcon
        viewController.tabBarItem.selectedImage = .tasbihIcon
        navigationController.pushViewController(viewController, animated: true)
    }
}