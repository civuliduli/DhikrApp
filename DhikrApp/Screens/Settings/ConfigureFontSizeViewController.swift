//
//  ConfigureFontSizeViewController.swift
//  DhikrApp
//
//  Created by Abdulla Civuli on 8.12.24.
//

import UIKit

class ConfigureFontSizeViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        setupScrollView()
        setupView()
    }
    
    var arabicTextFontSize = 10.0
    var transliterationTextFontSize = 10.0
    var translationTextFontSize = 10.0
    
    private lazy var scrollView: UIScrollView = {
        let scrollView = UIScrollView()
        scrollView.showsVerticalScrollIndicator = true
        return scrollView
    }()
    
    private lazy var contentView: UIView = {
         let view = UIView()
         return view
     }()
    
    lazy var mainStackView: UIStackView = {
        let stackView = UIStackView(arrangedSubviews: [accountLabel, selectArabicTextSize,selectTransliterationTextSize, selectTranslationTextSize ])
        stackView.axis = .vertical
        stackView.setCustomSpacing(40, after: accountLabel)
        stackView.setCustomSpacing(120, after: selectArabicTextSize)
        stackView.setCustomSpacing(120, after: selectTransliterationTextSize)
        stackView.setCustomSpacing(120, after: selectTranslationTextSize)
        return stackView
    }()
    
    lazy var accountLabel: UILabel = {
        let label = UILabel()
        label.font = CommonUtils.shared.getLightFont18(size: 24)
        label.textColor = .label
        label.textAlignment = .center
        label.text = "Font Size"
        return label
    }()
    
    lazy var selectArabicTextSize: FontSizeTextView = {
        let view = FontSizeTextView()
        view.titleLabel.text = "Quranic Script"
        view.textLabel.text = "اللَّهُمَّ أَنْتَ السَّلَامُ، وَمِنْكَ السَّلَامُ، تَبَارَكْتَ يَا ذَا الْجَلَالِ وَالْإِكْرَامِ"
        view.selectTextSize.addTarget(self, action: #selector(changeArabicFontSize(_:)), for: .valueChanged)
        view.textLabel.font = CommonUtils.shared.getLightFont18(size: CGFloat(UserPreferences.getArabicFontSize() ?? 12))
        view.selectTextSize.value = UserPreferences.getArabicFontSize() ?? 0
        return view
    }()
    
    lazy var selectTransliterationTextSize: FontSizeTextView = {
        let view = FontSizeTextView()
        view.titleLabel.text = "Transliteration"
        view.textLabel.text = "All-llãhumme Entes-Selãm, we minkes-selãm, tebãrakte jã dhel xhelãli wel ikrãm"
        view.selectTextSize.addTarget(self, action: #selector(changeTransliterationFontSize(_:)), for: .valueChanged)
        view.textLabel.font = CommonUtils.shared.getLightFont18(size: CGFloat(UserPreferences.getTransliterationFontSize() ?? 12))
        view.selectTextSize.value = UserPreferences.getTransliterationFontSize() ?? 0
        return view
    }()
    
    lazy var selectTranslationTextSize: FontSizeTextView = {
        let view = FontSizeTextView()
        view.titleLabel.text = "Translation"
        view.textLabel.text = "O Allah! Ti je Paqedhënësi dhe vetëm prej Teje pres paqen! Ti je përgjithmonë i Begatshëm, o Zotëruesi i madhështisë dhe nderimit!"
        view.selectTextSize.addTarget(self, action: #selector(changeTranslationFontSize(_:)), for: .valueChanged)
        view.textLabel.font = CommonUtils.shared.getLightFont18(size: CGFloat(UserPreferences.getTranslationFontSize() ?? 12))
        view.selectTextSize.value = UserPreferences.getTranslationFontSize() ?? 0
        return view
    }()
    
    private func setupScrollView() {
        view.addSubview(scrollView)
        scrollView.addSubview(contentView)
        
        // Configure scroll view constraints
        scrollView.translatesAutoresizingMaskIntoConstraints = false
        contentView.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            // Scroll view should fill the entire view
            scrollView.topAnchor.constraint(equalTo: view.topAnchor),
            scrollView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            scrollView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            scrollView.bottomAnchor.constraint(equalTo: view.bottomAnchor),
            
            // Content view should match scroll view's width
            contentView.topAnchor.constraint(equalTo: scrollView.topAnchor),
            contentView.leadingAnchor.constraint(equalTo: scrollView.leadingAnchor),
            contentView.trailingAnchor.constraint(equalTo: scrollView.trailingAnchor),
            contentView.bottomAnchor.constraint(equalTo: scrollView.bottomAnchor),
            contentView.widthAnchor.constraint(equalTo: scrollView.widthAnchor)
        ])
    }
    
    @objc func changeArabicFontSize(_ sender: UISlider) {
        arabicTextFontSize = Double(sender.value)
        selectArabicTextSize.textLabel.font = CommonUtils.shared.getLightFont18(size: arabicTextFontSize)
        UserPreferences.setArabicFontSize(Float(arabicTextFontSize))
    }
    
    @objc func changeTransliterationFontSize(_ sender: UISlider) {
        transliterationTextFontSize = Double(sender.value)
        selectTransliterationTextSize.textLabel.font = CommonUtils.shared.getLightFont18(size: transliterationTextFontSize)
        UserPreferences.setTransliterationFontSize(Float(transliterationTextFontSize))
    }
    
    @objc func changeTranslationFontSize(_ sender: UISlider) {
        translationTextFontSize = Double(sender.value)
        selectTranslationTextSize.textLabel.font = CommonUtils.shared.getLightFont18(size: translationTextFontSize)
        UserPreferences.setTranslationFontSize(Float(translationTextFontSize))
    }
    
    func setupView() {
          contentView.addSubview(mainStackView)
          mainStackView.translatesAutoresizingMaskIntoConstraints = false
          NSLayoutConstraint.activate([
              mainStackView.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 85),
              mainStackView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 24),
              mainStackView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -24),
              mainStackView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -24)
          ])
      }
}
