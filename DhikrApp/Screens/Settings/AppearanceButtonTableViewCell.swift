//
//  AppearanceButtonTableViewCell.swift
//  DhikrApp
//
//  Created by Abdulla Civuli on 28.12.24.
//

import UIKit

class AppearanceButtonTableViewCell: UICollectionViewCell {
    
    static let cellIdentifier: String = "AppearanceButtonTableViewCell"

    override init(frame: CGRect) {
        super.init(frame: frame)
        setupAppearanceButtonView()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func configureAppearanceButton(buttonName: String, buttonIcon: UIImage) {
        appearanceButton.setImage(buttonIcon, for: .normal)
        appearanceButton.setTitle(buttonName, for: .normal)
    }
    
    lazy var appearanceButton: UIButton = {
        let button = UIButton()
        button.setTitle("Appearance", for: .normal)
        button.setImage(.cpuIcon, for: .normal)
        button.titleLabel?.font = .systemFont(ofSize: 14)
        button.setTitleColor(.black, for: .normal)
        button.layer.borderWidth = 1
        button.layer.cornerRadius = 8
        button.backgroundColor = .white
        button.isUserInteractionEnabled = false  // Add this line
        
        // Adjust image and title alignment
        button.imageEdgeInsets = UIEdgeInsets(top: 0, left: -10, bottom: 0, right: 0)
        button.titleEdgeInsets = UIEdgeInsets(top: 0, left: 10, bottom: 0, right: 0)
        
        return button
    }()
    
    func setupAppearanceButtonView() {
        contentView.addSubview(appearanceButton)
        appearanceButton.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            appearanceButton.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 8),
            appearanceButton.leftAnchor.constraint(equalTo: contentView.leftAnchor, constant: 8),
            appearanceButton.rightAnchor.constraint(equalTo: contentView.rightAnchor, constant: -8),
            appearanceButton.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -8)
        ])
    }
}
