//
//  BookmarkCoordinator.swift
//  DhikrApp
//
//  Created by Abdulla Civuli on 10.11.24.
//
//
import UIKit

class BookmarkCoordinator: Coordinator {
    var childCoordinator = [Coordinator]()
    var navigationController: UINavigationController
    
    init(navigationController: UINavigationController) {
        self.navigationController = navigationController
    }
    
    func start() {
        let viewController = BookmarkViewController()
        navigationController.pushViewController(viewController, animated: true)
    }
}
