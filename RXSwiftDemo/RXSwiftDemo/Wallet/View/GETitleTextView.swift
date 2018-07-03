//
//  GETitleTextView.swift
//  RXSwiftDemo
//
//  Created by peng zhu on 2018/6/27.
//  Copyright © 2018年 Alger. All rights reserved.
//

import UIKit

struct TitleTextUIConfig {
    let lightColor: UIColor = UIColor.init(red: 33/255.0, green: 44/255.0, blue: 103/255.0, alpha: 1.0)
    let redColor: UIColor = UIColor.init(red: 208/255.0, green: 2/255.0, blue: 27/255.0, alpha: 1.0)
    let titleColor: UIColor = UIColor.init(red: 142/255.0, green: 142/255.0, blue: 147/255.0, alpha: 1.0)
    let gapColor: UIColor = UIColor.init(red: 231/255.0, green: 233/255.0, blue: 248/255.0, alpha: 1.0)
}

enum TextCheckWarningType : Int {
    case alert = 1
    case redSeal = 2
}

enum TextUIStyle : Int {
    case common = 1
    case highlight = 2
    case warning = 3
}

struct TextActionMode : OptionSet {
    var rawValue = 0
    static var clear = TextActionMode(rawValue: 1 << 0)
    static var eye = TextActionMode(rawValue: 2 << 0)
}

class TextButtonSetting {
    var imageName = ""
    var selectedImageName = ""
    
    init(imageName: String, selectedImageName: String) {
        self.imageName = imageName
        self.selectedImageName = selectedImageName
    }
}

protocol TextFieldRightViewDelegate: NSObjectProtocol {
    func textActionSettings(titleView: GETitleTextView) -> [TextButtonSetting]
    func textActionTrigger(titleView: GETitleTextView, selected: Bool, index: NSInteger)
}

class GETitleTextSetting {
    var title = ""
    var placeholder = ""
    var showLine = true
    var warningText = ""
    var warningType = TextCheckWarningType.alert
    
    init(title: String, placeholder: String, warningText: String, warningType: TextCheckWarningType, showLine: Bool) {
        self.title = title
        self.placeholder = placeholder
        self.showLine = showLine;
        self.warningType = warningType
    }
}

class GETitleTextView: UIView {

    @IBOutlet var containerView: UIView!
    
    @IBOutlet weak var titleLabel: UILabel!
    
    @IBOutlet weak var textFiled: UITextField!
    
    @IBOutlet weak var gapView: UIView!
    
    weak var delegate: TextFieldRightViewDelegate?
    
    var uiConfig : TitleTextUIConfig = TitleTextUIConfig()
    
    var setting : GETitleTextSetting! {
        didSet {
            titleLabel.text = setting.title
            textFiled.attributedPlaceholder = NSMutableAttributedString.init(string: setting.placeholder, attributes: [NSAttributedStringKey.foregroundColor: UIColor.init(red: 198/255.0, green: 202/255.0, blue: 222/255.0, alpha: 1.0)])
//            gapView.alpha = setting.showLine ? 1.0 : 0.0
        }
    }
    
    var checkStatus : TextUIStyle? {
        didSet {
            switch checkStatus! {
            case .highlight:
                highlightUI()
            case .warning:
                warningUI()
            default:
                recoverUI()
                break
            }
        }
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        Bundle.main.loadNibNamed(String(describing: GETitleTextView.self), owner: self, options: nil)
        self.addSubview(containerView)
        
        containerView.frame = self.bounds
        containerView.autoresizingMask = [.flexibleHeight,.flexibleWidth]
        
        setupRightView()
    }
    
    func setupRightView() {
        let buttonSettings = delegate?.textActionSettings(titleView: self)
//        let actionView = UIStackView()
//        
//        
//        for (index, value) in (buttonSettings?.enumerated())! {
//            
//        }
    }
        
    fileprivate func recoverUI() {
        titleLabel.text = setting.title
        titleLabel.textColor = uiConfig.titleColor
        gapView.backgroundColor = uiConfig.gapColor
    }
    
    fileprivate func redSealUI() {
        titleLabel.text = setting.warningText
        titleLabel.textColor = uiConfig.lightColor
        gapView.backgroundColor = uiConfig.lightColor
    }
    
    fileprivate func highlightUI() {
        titleLabel.text = setting.title
        titleLabel.textColor = uiConfig.redColor
        gapView.backgroundColor = uiConfig.redColor
    }
    
    fileprivate func showCommonWarningView() {
        
    }
    
    fileprivate func warningUI() {
        if setting.warningType == .alert {
            showCommonWarningView()
        } else {
            redSealUI()
        }
    }
    
    override var intrinsicContentSize: CGSize {
        return CGSize.init(width: UIViewNoIntrinsicMetric,height: UIViewNoIntrinsicMetric)
    }
    
    func loadFromXIB(){
        let bundle = Bundle(for: type(of: self))
        let nibName = String(describing: type(of: self))
        let nib = UINib.init(nibName: nibName, bundle: bundle)
        let view = nib.instantiate(withOwner: self, options: nil).first as! UIView
        addSubview(view)
        
        view.frame = self.bounds
        view.autoresizingMask = [.flexibleHeight,.flexibleWidth]
    }
    
    func RGBCOLOR(r:CGFloat,_ g:CGFloat,_ b:CGFloat) -> UIColor {
        return UIColor(red: (r)/255.0, green: (g)/255.0, blue: (b)/255.0, alpha: 1.0)
    }
}

extension GETitleTextView : UITextFieldDelegate {
    func textFieldDidBeginEditing(_ textField: UITextField) {

    }
    
    func textFieldDidEndEditing(_ textField: UITextField, reason: UITextFieldDidEndEditingReason) {

    }
    
    func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
        return true
    }
}
