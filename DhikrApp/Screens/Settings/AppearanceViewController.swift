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

class AppearanceViewController: UIViewController, UICollectionViewDelegate, UICollectionViewDataSource {
    
    let appearanceStyles: [Appearance] = [
        Appearance(image: .sunIcon, appearanceStyle: "Light"),
        Appearance(image: .moonIcon, appearanceStyle: "Dark"),
        Appearance(image: .cpuIcon, appearanceStyle: "System"),
        Appearance(image: .moonIcon, appearanceStyle: "Night")
    ]

    override func viewDidLoad() {
        super.viewDidLoad()
        setupView()
        view.backgroundColor = .white
        collectionView.delegate = self
        collectionView.dataSource = self
        collectionView.reloadData()
    }
    
    private lazy var collectionView: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .vertical
        layout.itemSize = CGSize(width: 150, height: 80)
        let collectionView = UICollectionView(frame: .zero, collectionViewLayout: layout)
        collectionView.register(AppearanceButtonTableViewCell.self, forCellWithReuseIdentifier: AppearanceButtonTableViewCell.cellIdentifier)
        collectionView.backgroundColor = .clear
        collectionView.translatesAutoresizingMaskIntoConstraints = false
        return collectionView
    }()
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        appearanceStyles.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: AppearanceButtonTableViewCell.cellIdentifier, for: indexPath) as? AppearanceButtonTableViewCell else {
            fatalError("Unable to dequeue AppearanceButtonTableViewCell")
        }
        
        if indexPath.row == UserPreferences.getApperanceSelectionIndex() {
            cell.appearanceButton.layer.borderColor = UIColor.systemPurple.cgColor
            cell.appearanceButton.tintColor = .systemPurple
            cell.appearanceButton.setTitleColor(.systemPurple, for: .normal)
            cell.appearanceButton.layer.borderWidth = 3
        }
        
        let appearanceStyle = appearanceStyles[indexPath.row]
        cell.configureAppearanceButton(buttonName: appearanceStyle.appearanceStyle, buttonIcon: appearanceStyle.image)
        
        return cell
    }

    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let selectedStyle = appearanceStyles[indexPath.row]
        
        // Reset all cells to default state first
        for cell in collectionView.visibleCells {
            guard let appearanceCell = cell as? AppearanceButtonTableViewCell else { continue }
            
            // Default styling
            appearanceCell.appearanceButton.layer.borderColor = UIColor.black.cgColor
            appearanceCell.appearanceButton.tintColor = .black
            appearanceCell.appearanceButton.setTitleColor(.black, for: .normal)
            appearanceCell.appearanceButton.layer.borderWidth = 1
        }
        
        // Get the selected cell (not dequeuing a new one)
        guard let selectedCell = collectionView.cellForItem(at: indexPath) as? AppearanceButtonTableViewCell else {
            return
        }
        
        // Style the selected cell
        selectedCell.appearanceButton.layer.borderColor = UIColor.systemPurple.cgColor
        selectedCell.appearanceButton.tintColor = .systemPurple
        selectedCell.appearanceButton.setTitleColor(.systemPurple, for: .normal)
        selectedCell.appearanceButton.layer.borderWidth = 3
        selectedCell.configureAppearanceButton(buttonName: selectedStyle.appearanceStyle, buttonIcon: selectedStyle.image)
        
        print("Selected appearance: \(selectedStyle.appearanceStyle)")
        UserPreferences.setAppearanceSelectionIndex(selectedAppearanceIndex: indexPath.row)
        
        if let windowScene = UIApplication.shared.connectedScenes.first as? UIWindowScene,
           let window = windowScene.windows.first {
            switch UserPreferences.getApperanceSelectionIndex() {
            case 0:
                window.overrideUserInterfaceStyle = .light
            case 1:
                window.overrideUserInterfaceStyle = .dark
            case 2:
                window.overrideUserInterfaceStyle = .unspecified
            default:
                window.overrideUserInterfaceStyle = .light
            }
        }
        
    }
    
    func setupView() {
        view.addSubview(collectionView)
        NSLayoutConstraint.activate([
            collectionView.topAnchor.constraint(equalTo: view.topAnchor, constant: 24),
            collectionView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 30),
            collectionView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -30),
            collectionView.bottomAnchor.constraint(equalTo: view.layoutMarginsGuide.bottomAnchor, constant: -8)
        ])
    }
}
