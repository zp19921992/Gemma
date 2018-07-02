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

enum TextEditWarningType : Int {
    case Common = 1
    case RedSeal = 2
}

struct TextActionMode : OptionSet {
    var rawValue = 0
    static var Clear = TextActionMode(rawValue: 1 << 0)
    static var Eye = TextActionMode(rawValue: 2 << 0)
}

class GETitleTextView: UIView {

    @IBOutlet var containerView: UIView!
    
    @IBOutlet weak var titleLabel: UILabel!
    
    @IBOutlet weak var textFiled: UITextField!
    
    @IBOutlet weak var gapView: UIView!
    
    var uiConfig : TitleTextUIConfig = TitleTextUIConfig()
    
    var setting : GETitleTextSetting = GETitleTextSetting()  {
        didSet {
            titleLabel.text = setting.title
            textFiled.attributedPlaceholder = NSMutableAttributedString.init(string: setting.placeholder, attributes: [NSAttributedStringKey.foregroundColor: UIColor.init(red: 198/255.0, green: 202/255.0, blue: 222/255.0, alpha: 1.0)])
            gapView.alpha = setting.showLine ? 1.0 : 0.0
        }
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        Bundle.main.loadNibNamed(String(describing: GETitleTextView.self), owner: self, options: nil)
        self.addSubview(containerView)
    }
    
    func checkTextFiledEdit(isEdit: Bool) {
        titleLabel.textColor = isEdit ? uiConfig.lightColor : uiConfig.titleColor
        gapView.backgroundColor = isEdit ? uiConfig.lightColor : uiConfig.gapColor
    }
    
    func recoverUI() {
        titleLabel.textColor = uiConfig.titleColor
        gapView.backgroundColor = uiConfig.gapColor
    }
    
    func setUIHighligted() {
        titleLabel.textColor = uiConfig.lightColor
        gapView.backgroundColor = uiConfig.lightColor
    }
    
    func checkTextValid() {
        if setting.warningType == .Common {
            
        } else {
            
        }
    }
    
    func RGBCOLOR(r:CGFloat,_ g:CGFloat,_ b:CGFloat) -> UIColor {
        return UIColor(red: (r)/255.0, green: (g)/255.0, blue: (b)/255.0, alpha: 1.0)
    }
}

extension GETitleTextView : UITextFieldDelegate {
    func textFieldDidBeginEditing(_ textField: UITextField) {
        checkTextFiledEdit(isEdit: true)
        recoverUI()
    }
    
    func textFieldDidEndEditing(_ textField: UITextField, reason: UITextFieldDidEndEditingReason) {
        checkTextFiledEdit(isEdit: false)
        setUIHighligted()
    }
    
    func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
        return true
    }
}

class GETitleTextSetting: NSObject {
    var title : String  = ""
    var placeholder : String = ""
    var showLine : Bool = true
    var warningText : String = ""
    var warningType : TextEditWarningType = .Common
    override init() {
        
    }
    
    init(title: String, placeholder: String, warningText: String, warningType: TextEditWarningType, showLine: Bool) {
        self.title = title
        self.placeholder = placeholder
        self.showLine = showLine;
        self.warningType = warningType
    }
}
