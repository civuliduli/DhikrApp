//
//  DhikrCardTableViewCell.swift
//  DhikrApp
//
//  Created by Abdulla Civuli on 18.11.24.
//

import UIKit

class DhikrCardTableViewCell: UITableViewCell {
    
    static let cellIdentifier: String = "DhikrCardTableViewCell"

    
    lazy var refreshButton: UIButton = {
        let button = UIButton()
        button.setImage(.refreshIcon, for: .normal)
        button.backgroundColor = .gray
        button.layer.cornerRadius = 10
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
        label.font = CommonUtils.shared.getArabicFont(size: 18)
        label.text = "اللَّهُمَّ أَنْتَ السَّلَامُ، وَمِنْكَ السَّلَامُ، تَبَارَكْتَ يَا ذَا الْجَلَالِ وَالْإِكْرَامِ."
        label.textAlignment = .right
        label.numberOfLines = 0
        return label
    }()
    
    lazy var transliterationText: UILabel = {
        let label = UILabel()
        label.font = CommonUtils.shared.getBoldFont18(size: 17)
        label.text = "All-llãhumme Entes-Selãm, we minkes-selãm, tebãrakte jã dhel xhelãli wel ikrãm."
        label.numberOfLines = 0
        return label
    }()
    
    let translationText: UILabel = {
        let label = UILabel()
        label.font = CommonUtils.shared.getLightFont18(size: 20)
        label.text = "O Allah! Ti je Paqedhënësi dhe vetëm prej Teje pres paqen! Ti je përgjithmonë i Begatshëm, o Zotëruesi i madhështisë dhe nderimit!"
        label.numberOfLines = 0
        return label
    }()
    
    let hadithInfoText: UILabel = {
        let label = UILabel()
        label.font = CommonUtils.shared.getLightFont18(size: 12)
        label.text = "Muslimi"
        label.numberOfLines = 0
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
        let stackView = UIStackView(arrangedSubviews: [iconsStackView, arabicText, dhikrStackView])
        stackView.axis = .vertical
        stackView.distribution = .fillEqually
        stackView.alignment = .trailing
        return stackView
    }()
    
    lazy var iconsStackView: UIStackView = {
        let stackView = UIStackView(arrangedSubviews: [loveButton, bookMarkButton, shareButton])
        stackView.axis = .horizontal
        stackView.distribution = .fillEqually
        stackView.alignment = .trailing
        return stackView
    }()
    
    lazy var dhikrStackView: UIStackView = {
        let stackView = UIStackView(arrangedSubviews: [transliterationText, translationText, hadithInfoText])
        stackView.axis = .vertical
        stackView.distribution = .fillEqually
        stackView.alignment = .leading
        return stackView
    }()
    
    lazy var countDhikrStackView: UIStackView = {
        let stackView = UIStackView(arrangedSubviews: [countDhikrButton, refreshButton])
        stackView.axis = .horizontal
        stackView.distribution = .fillProportionally
        stackView.spacing = 5
        return stackView
    }()
    
    
    func setupDhikrCardView() {
        contentView.addSubview(mainStackView)
        contentView.addSubview(countDhikrStackView)
        mainStackView.anchor(top: contentView.topAnchor, left: contentView.leftAnchor, right: contentView.rightAnchor, topConstant: 24, leftConstant: 8, rightConstant: 16)
        countDhikrStackView.anchor(top: mainStackView.bottomAnchor, left: contentView.leftAnchor, right: contentView.rightAnchor, topConstant: 16, leftConstant: 8, rightConstant: 16)

    }

    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setupDhikrCardView()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}


#Preview {
    DhikrCardTableViewCell()
}
