//
//  AppearanceViewController.swift
//  DhikrApp
//
//  Created by Abdulla Civuli on 8.12.24.
//

import UIKit

struct Appearance {
    let image: UIImage
    let appearanceStyle: String
}

class AppearanceViewController: UIViewController {
    
    //TODO: Make three buttons with CollectionView
    //TODO: Save the selection in UserDefaults
    //TODO: Change the Appearance of the app based on the selection
    
    var collectionView: UICollectionView!
    
    let appearanceStyles: [Appearance] = [
        Appearance(image: .cpuIcon, appearanceStyle: "System"),
        Appearance(image: .sunIcon, appearanceStyle: "Light"),
        Appearance(image: .moonIcon, appearanceStyle: "Dark")
    ]

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
      
    }
}
