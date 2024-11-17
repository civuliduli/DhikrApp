//
//  TabBarViewController.swift
//  DhikrApp
//
//  Created by Abdulla Civuli on 10.11.24.
//

import UIKit

class TabBarViewController: UITabBarController, UITabBarControllerDelegate  {
    
    private(set) weak var coordinator: AppCoordinator?
    
    init(coordinator: AppCoordinator?) {
        self.coordinator = coordinator
        super.init(nibName: nil, bundle: nil)
    }
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    lazy var dhikrCoordinator: DhikrCoordinator = DhikrCoordinator(navigationController: UINavigationController.init())
    lazy var bookmarkCoordinator: BookmarkCoordinator = BookmarkCoordinator(navigationController: UINavigationController.init())
    lazy var tasbihCoordinator: TasbihCoordinator = TasbihCoordinator(navigationController: UINavigationController.init())
    lazy var settingsCoordinator: SettingsCoordinator = SettingsCoordinator(navigationController: UINavigationController.init())
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tabBarIconDesign()
        configureTabBarViewControllers()
    }
    
    func configureTabBarViewControllers() {
        dhikrCoordinator.start()
        bookmarkCoordinator.start()
        tasbihCoordinator.start()
        settingsCoordinator.start()
        self.viewControllers = [
               dhikrCoordinator.navigationController.topViewController!,
               bookmarkCoordinator.navigationController.topViewController!,
               tasbihCoordinator.navigationController.topViewController!,
               settingsCoordinator.navigationController.topViewController!
           ]
    }
    
    func tabBarIconDesign() {
        if #available(iOS 13.0, *) {
            let tabBarAppearance: UITabBarAppearance = UITabBarAppearance()
            tabBarAppearance.configureWithDefaultBackground()
            tabBarAppearance.backgroundColor = UIColor.white
            UITabBar.appearance().standardAppearance = tabBarAppearance
            UITabBar.appearance().tintColor = UIColor.gray
            UITabBar.appearance().unselectedItemTintColor = UIColor.gray
            
            if #available(iOS 15.0, *) {
                UITabBar.appearance().scrollEdgeAppearance = tabBarAppearance
            }
        }
    }
}
