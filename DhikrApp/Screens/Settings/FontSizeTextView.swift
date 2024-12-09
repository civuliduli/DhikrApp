//
//  FontSizeTextView.swift
//  DhikrApp
//
//  Created by Abdulla Civuli on 9.12.24.
//

import UIKit

class FontSizeTextView: UIView {

    init() {
        super.init(frame: .zero)
        setupView()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    lazy var mainStackView: UIStackView = {
        var stackView = UIStackView(arrangedSubviews: [titleLabel, textLabel, selectTextSize])
        stackView.axis = .vertical
        stackView.spacing = 20
        return stackView
    }()
    
    let titleLabel: UILabel = {
        let label = UILabel()
        label.font = CommonUtils.shared.getBoldFont18(size: 15)
        label.textColor = .black
        label.textAlignment = .center
        label.text = "Transliteration"
        return label
    }()
    
    let selectTextSize: UISlider = {
        let slider = UISlider()
        slider.minimumValue = 10
        slider.maximumValue = 40
        slider.value = 0
        slider.isContinuous = true
        return slider
    }()
    
    let textLabel: UILabel = {
        let label = UILabel()
        label.font = CommonUtils.shared.getLightFont18(size: 15)
        label.text = "All-llãhumme Entes-Selãm, we minkes-selãm, tebãrakte jã dhel xhelãli wel ikrãm."
        label.textAlignment = .center
        label.textColor = .black
        label.numberOfLines = 0
        return label
    }()
    
    func setupView() {
        addSubview(mainStackView)
        mainStackView.anchor(top: topAnchor, left: leftAnchor, bottom: bottomAnchor, right: rightAnchor)
    }

}

#Preview {
    FontSizeTextView()
}
