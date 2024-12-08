//
//  DhikrTimeView.swift
//  DhikrApp
//
//  Created by Abdulla Civuli on 20.11.24.
//

import UIKit

class DhikrTimeView: UIView {

    init() {
        super.init(frame: .zero)
        setupView() 
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    lazy var timeToPerformDhikr: UILabel = {
        let label = UILabel()
        label.font = CommonUtils.shared.getLightFont18(size: 18)
        label.text = "Koha e dhikrit: Para lindjes se diellit"
        label.textColor = .black
        label.numberOfLines = 0
        return label
    }()
    
    lazy var timeIcon: UIImageView = {
        let imageView = UIImageView()
        imageView.image = .timeIcon
        imageView.tintColor = .black
        imageView.anchor(widthConstant: 20, heightConstant: 20)
        return imageView
    }()
    
    lazy var timeToPerformDhikrStackView: UIStackView = {
        let stackView = UIStackView(arrangedSubviews: [timeIcon, timeToPerformDhikr])
        stackView.axis = .horizontal
        stackView.distribution = .fill
        stackView.spacing = 10
        return stackView
    }()
    
    
    func setupView() {
        addSubview(timeToPerformDhikrStackView)
        timeToPerformDhikrStackView.anchor(left: leftAnchor, right: rightAnchor)
    }
    
}
