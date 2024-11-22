//
//  SelectDhikrTableViewCell.swift
//  DhikrApp
//
//  Created by Abdulla Civuli on 17.11.24.
//

import UIKit

class SelectDhikrTableViewCell: UITableViewCell {
    
    static let cellIdentifier: String = "SelectDhikrTableViewCell"

    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setup()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    lazy var stackView: UIStackView = {
        let stackView = UIStackView(arrangedSubviews: [dhikrType, time, timeOfDhikr])
        stackView.axis = .vertical
        return stackView
    }()
    
    lazy var dhikrType: UILabel = {
        let label = UILabel()
        label.font = CommonUtils.shared.getLightFont18(size: 14)
        label.text = "Dhikr Type"
        return label
    }()
    
    lazy var time: UILabel = {
        let label = UILabel()
        label.font = CommonUtils.shared.getLightFont18(size: 14)
        label.text = "Koha"
        return label
    }()
    
    lazy var timeOfDhikr: UILabel = {
        let label = UILabel()
        label.font = CommonUtils.shared.getLightFont18(size: 14)
        label.text = "Pas namazit te sabahut"
        return label
    }()
    
    func configureCell(typeOfDhikr: String, timeOfDhikr: String) {
        self.dhikrType.text = typeOfDhikr
        self.timeOfDhikr.text = timeOfDhikr
    }
    
    func setup() {
        contentView.addSubview(stackView)
        stackView.anchor(top: contentView.topAnchor, left: contentView.leftAnchor, bottom: contentView.bottomAnchor, right: contentView.rightAnchor, topConstant: 24, leftConstant: 8, bottomConstant: 16, rightConstant: 8)
    }
}

#Preview {
    SelectDhikrTableViewCell()
}
