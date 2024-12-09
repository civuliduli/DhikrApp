//
//  SettingsViewController.swift
//  DhikrApp
//
//  Created by Abdulla Civuli on 10.11.24.
//

import UIKit

class SettingsViewController: UIViewController {
        
    init() {
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        setupView()
    }
    
    lazy var mainStackView: UIStackView = {
        let stackView = UIStackView(arrangedSubviews: [accountLabel, configureFontSizeButton, appearanceButton])
        stackView.axis = .vertical
        stackView.setCustomSpacing(15, after: accountLabel)
        stackView.setCustomSpacing(15, after: configureFontSizeButton)
        stackView.setCustomSpacing(15, after: appearanceButton)
        return stackView
    }()
    
    lazy var accountLabel: UILabel = {
        let label = UILabel()
        label.font = CommonUtils.shared.getLightFont18(size: 24)
        label.textColor = .label
        label.text = "Account Settings"
        return label
    }()
    
    lazy var configureFontSizeButton: UIButton = {
        let button = UIButton()
        button.setTitle("Configure Font Size", for: .normal)
        button.setTitleColor(.label, for: .normal)
        button.contentHorizontalAlignment = .left
        button.titleLabel?.font = CommonUtils.shared.getLightFont18(size: 24)
        button.layer.borderColor = UIColor.label.cgColor
        button.layer.cornerRadius = 10
        button.layer.borderWidth = 1
        button.addTarget(self, action: #selector(navigateToConfigureFontSize), for: .touchUpInside)
        button.titleEdgeInsets = UIEdgeInsets(top: 0, left: 15, bottom: 0, right: 0)
        return button
    }()
    
    lazy var appearanceButton: UIButton = {
        let button = UIButton()
        button.setTitle("Appearance", for: .normal)
        button.setTitleColor(.label, for: .normal)
        button.contentHorizontalAlignment = .left
        button.titleLabel?.font = CommonUtils.shared.getLightFont18(size: 24)
        button.layer.borderColor = UIColor.label.cgColor
        button.layer.cornerRadius = 10
        button.layer.borderWidth = 1
        button.addTarget(self, action: #selector(navigateToAppearance), for: .touchUpInside)
        button.titleEdgeInsets = UIEdgeInsets(top: 0, left: 15, bottom: 0, right: 0)
        return button
    }()
    
    @objc func navigateToConfigureFontSize() {
        let configureFontSizeVC = ConfigureFontSizeViewController()
        navigationController?.pushViewController(configureFontSizeVC, animated: true)
    }
    
    @objc func navigateToAppearance() {
        let appearanceVC = AppearanceViewController()
        navigationController?.pushViewController(appearanceVC, animated: true)
    }
    
    func setupView() {
        view.addSubview(mainStackView)
        mainStackView.anchor(top: view.topAnchor, left: view.leftAnchor, right: view.rightAnchor, topConstant: 75, leftConstant: 24, bottomConstant: 24, rightConstant: 24)
    }
}
