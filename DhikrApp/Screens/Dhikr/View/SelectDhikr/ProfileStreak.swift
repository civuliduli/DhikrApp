//
//  ProfileStreak.swift
//  DhikrApp
//
//  Created by Abdulla Civuli on 16.11.24.
//

import UIKit

class ProfileStreak: UIView {
    
    init() {
        super.init(frame: .zero)
        setup()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
        
    lazy var stackView: UIStackView = {
        let stackView = UIStackView(arrangedSubviews: [userName, streakButton])
        stackView.axis = .horizontal
        stackView.alignment = .leading
        stackView.spacing = 16
        return stackView
    }()
    
    let userName: UILabel = {
        let label = UILabel()
        label.font = CommonUtils.shared.getLightFont18(size: 24)
        label.textColor = .label
        label.text = "Salam, Abdullah"
        return label
    }()

    let streakButton: UIButton = {
        let button = UIButton()
        button.setTitle("10", for: .normal)
        button.setImage(.streakBookIcon, for: .normal)
        button.imageView?.tintColor = .black
        button.setTitleColor(.label, for: .normal)
        button.titleLabel?.font = CommonUtils.shared.getLightFont18(size: 24)
        return button
    }()
    
    func setup() {
        addSubview(stackView)
        stackView.anchor(left: leftAnchor, right: rightAnchor)
    }
}

#Preview {
    ProfileStreak()
}
