//
//  Coordinator.swift
//  DhikrApp
//
//  Created by Abdulla Civuli on 10.11.24.
//

import UIKit

protocol Coordinator {
    var childCoordinator: [Coordinator] { get set }
    var navigationController: UINavigationController { get set }
    func start()
}
