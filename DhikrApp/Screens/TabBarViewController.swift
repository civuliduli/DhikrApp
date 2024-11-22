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
        
    override func viewDidLoad() {
        super.viewDidLoad()
        tabBarIconDesign()
        configureTabBarViewControllers()
    }
    
    func configureTabBarViewControllers() {
        let selectDhikrVC = SelectDhikrViewController()
        let bookMarkVC = BookmarkViewController()
        let tasbihVC = TasbihViewController()
        let settingsVC = SettingsViewController()
        
        let selectDhikrBarItem = UITabBarItem(title: "Home", image: .homeIcon, selectedImage: .homeIconFilled)
        selectDhikrVC.tabBarItem = selectDhikrBarItem
        
        let bookMarkBarItem = UITabBarItem(title: "Bookmark", image: .bookMarkIcon, selectedImage: .bookMarkIconFilled)
        bookMarkVC.tabBarItem = bookMarkBarItem
        
        let tasbihBarItem = UITabBarItem(title: "Tasbih", image: .tasbihIcon, selectedImage: .tasbihIcon)
        tasbihVC.tabBarItem = tasbihBarItem
        
        let settingsBarItem = UITabBarItem(title: "Settings", image: .settingsIcon, selectedImage: .settingsIconFilled)
        settingsVC.tabBarItem = settingsBarItem

        self.viewControllers = [selectDhikrVC, bookMarkVC, tasbihVC, settingsVC]
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
