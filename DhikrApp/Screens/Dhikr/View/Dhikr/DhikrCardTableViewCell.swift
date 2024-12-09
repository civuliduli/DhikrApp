//
//  DhikrCardTableViewCell.swift
//  DhikrApp
//
//  Created by Abdulla Civuli on 18.11.24.
//

import UIKit

class DhikrCardTableViewCell: UITableViewCell {
    
    static let cellIdentifier: String = "DhikrCardTableViewCell"
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setupDhikrCardView()
        backgroundColor = .white
        selectionStyle = .none
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    lazy var refreshButton: UIButton = {
        let button = UIButton()
        button.setImage(.refreshIcon, for: .normal)
        button.backgroundColor = .gray
        button.layer.cornerRadius = 10
        button.add(width: 44, height: 44)
        button.isHidden = true
        return button
    }()
    
    lazy var loveButton: UIButton = {
        let button = UIButton()
        button.setImage(.heartIcon, for: .normal)
        button.tintColor = .black
        return button
    }()
    
    lazy var bookMarkButton: UIButton = {
        let button = UIButton()
        button.setImage(.bookMarkIcon, for: .normal)
        button.tintColor = .black
        return button
    }()
    
    lazy var shareButton: UIButton = {
        let button = UIButton()
        button.setImage(.shareIcon, for: .normal)
        button.tintColor = .black
        return button
    }()
    
    lazy var arabicText: UILabel = {
        let label = UILabel()
        label.font = CommonUtils.shared.getArabicFont(size: CGFloat(UserPreferences.getArabicFontSize() ?? 0))
        label.text = "اللَّهُمَّ أَنْتَ السَّلَامُ، وَمِنْكَ السَّلَامُ، تَبَارَكْتَ يَا ذَا الْجَلَالِ وَالْإِكْرَامِ."
        label.textAlignment = .right
        label.textColor = .black
        label.numberOfLines = 0
        return label
    }()
    
    lazy var transliterationText: UILabel = {
        let label = UILabel()
        label.font = CommonUtils.shared.getBoldFont18(size: CGFloat(UserPreferences.getTransliterationFontSize() ?? 0))
        label.text = "All-llãhumme Entes-Selãm, we minkes-selãm, tebãrakte jã dhel xhelãli wel ikrãm."
        label.textColor = .black
        label.numberOfLines = 0
        label.textAlignment = .left
        return label
    }()
    
    let translationText: UILabel = {
        let label = UILabel()
        label.font = CommonUtils.shared.getLightFont18(size: CGFloat(UserPreferences.getTranslationFontSize() ?? 0))
        label.text = "O Allah! Ti je Paqedhënësi dhe vetëm prej Teje pres paqen! Ti je përgjithmonë i Begatshëm, o Zotëruesi i madhështisë dhe nderimit!"
        label.textColor = .black
        label.numberOfLines = 0
        label.textAlignment = .left
        return label
    }()
    
    let hadithInfoText: UILabel = {
        let label = UILabel()
        label.font = CommonUtils.shared.getLightFont18(size: 10)
        label.text = "Muslimi"
        label.numberOfLines = 0
        label.textColor = .black
        label.textAlignment = .left
        return label
    }()
    
    let countDhikrButton: UIButton = {
        let button = UIButton()
        button.setTitle("0 / 30", for: .normal)
        button.setTitleColor(.black, for: .normal)
        button.titleLabel?.textAlignment = .center
        button.backgroundColor = .lightGray
        button.layer.cornerRadius = 8
        return button
    }()
    
    lazy var mainStackView: UIStackView = {
        let stackView = UIStackView(arrangedSubviews: [contentStackView, dhikrStackView, countDhikrStackView])
        stackView.axis = .vertical
        stackView.layer.borderColor = UIColor.gray.cgColor
        stackView.layer.cornerRadius = 16
        stackView.layer.borderWidth = 1
        stackView.isLayoutMarginsRelativeArrangement = true
        stackView.directionalLayoutMargins = NSDirectionalEdgeInsets(top: 16, leading: 16, bottom: 16, trailing: 16)
        stackView.spacing = 10
        stackView.distribution = .fill
        return stackView
    }()
    
    lazy var contentStackView: UIStackView = {
        let stackView = UIStackView(arrangedSubviews: [iconsStackView, arabicText])
        stackView.axis = .vertical
        stackView.distribution = .fill
        stackView.spacing = 10
        stackView.alignment = .trailing
        return stackView
    }()
    
    lazy var iconsStackView: UIStackView = {
        let stackView = UIStackView(arrangedSubviews: [loveButton, bookMarkButton, shareButton])
        stackView.axis = .horizontal
        stackView.distribution = .fillEqually
        stackView.alignment = .trailing
        stackView.spacing = 5
        return stackView
    }()
    
    lazy var dhikrStackView: UIStackView = {
        let stackView = UIStackView(arrangedSubviews: [transliterationText, translationText, hadithInfoText])
        stackView.axis = .vertical
        stackView.distribution = .fill
        stackView.alignment = .leading
        stackView.spacing = 10
        return stackView
    }()
    
    lazy var countDhikrStackView: UIStackView = {
        let stackView = UIStackView(arrangedSubviews: [countDhikrButton, refreshButton])
        stackView.axis = .horizontal
        stackView.distribution = .fillProportionally
        stackView.spacing = 5
        return stackView
    }()
    
    func configureDhikrCard(dhikr: DhikrItems) {
        arabicText.text = dhikr.arabicText
        transliterationText.text = dhikr.transliteration
        translationText.text = dhikr.dhikrData.dhikr_Sq
        hadithInfoText.text = dhikr.dhikrInfo.hadithInfo_Sq
        countDhikrButton.setTitle(" 0 / \(dhikr.count)", for: .normal)
    }
    
    func setupDhikrCardView() {
        contentView.addSubview(mainStackView)
        mainStackView.anchor(top: contentView.topAnchor,
                             left: contentView.leftAnchor,
                             bottom: contentView.bottomAnchor,
                             right: contentView.rightAnchor,
                             topConstant: 24,
                             leftConstant: 16,
                             bottomConstant: 5,
                             rightConstant: 16)
    }
}

#Preview {
    DhikrCardTableViewCell()
}
