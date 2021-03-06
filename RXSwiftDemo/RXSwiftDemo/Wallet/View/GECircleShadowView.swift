//
//  GECircleShadowView.swift
//  RXSwiftDemo
//
//  Created by peng zhu on 2018/6/27.
//  Copyright © 2018年 Alger. All rights reserved.
//

import UIKit

class GECircleShadowView: UIView {

    @IBOutlet var containerView: UIView!
    
    @IBOutlet weak var nameView: GETitleTextView!
    
    @IBOutlet weak var passwordView: GETitleTextView!
    
    @IBOutlet weak var passwordConfirmView: GETitleTextView!
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        loadViewFromNib()
        setupUI()
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
    }
    
    override var intrinsicContentSize: CGSize {
        return CGSize.init(width: UIViewNoIntrinsicMetric,height: dynamicHeight())
    }
    
    fileprivate func updateHeight() {
        layoutIfNeeded()
        self.height = dynamicHeight()
        invalidateIntrinsicContentSize()
    }
    
    fileprivate func dynamicHeight() -> CGFloat {
        let lastView = self.subviews.last?.subviews.last
        return lastView!.bottom
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        layoutIfNeeded()
    }
    
    fileprivate func loadViewFromNib() {
        let bundle = Bundle(for: type(of: self))
        let nibName = String(describing: type(of: self))
        let nib = UINib.init(nibName: nibName, bundle: bundle)
        let view = nib.instantiate(withOwner: self, options: nil).first as! UIView
        
        addSubview(view)
        view.frame = self.bounds
        view.autoresizingMask = [.flexibleHeight,.flexibleWidth]
    }
    
    func setupUI() {
        nameView.setting = GETitleTextSetting(title: "钱包名称", placeholder: "请输入钱包名称", warningText: "密码用于加密钱包等机密信息，请务必牢记或使用密码管理工具存储。Gemma不存储密码，无法提供密码找回服务", warningType: TextCheckWarningType.alert, showLine: true)
        nameView.delegate = self as TextFieldRightViewDelegate
        
        passwordView.setting = GETitleTextSetting(title: "设置密码", placeholder: "请输入12位字符的密码", warningText: "请输入12位字符的密码", warningType: TextCheckWarningType.redSeal, showLine: true)
        
        passwordConfirmView.setting = GETitleTextSetting(title: "重复密码", placeholder: "请再次输入您的密码", warningText: "密码不一致", warningType: TextCheckWarningType.redSeal, showLine: false)
    }
    
    @objc func passwordSwitch(sender: UIButton) {
        sender.isSelected = !sender.isSelected
        passwordView.textFiled.isSecureTextEntry = !sender.isSelected
        passwordConfirmView.textFiled.isSecureTextEntry = !sender.isSelected
    }
    /*
    // Only override draw() if you perform custom drawing.
    // An empty implementation adversely affects performance during animation.
    override func draw(_ rect: CGRect) {
        // Drawing code
    }
    */

}

extension GECircleShadowView: TextFieldRightViewDelegate {
    func textActionTrigger(titleView: GETitleTextView, selected: Bool, index: NSInteger) {
        
    }
    
    func textActionSettings(titleView: GETitleTextView) -> [TextButtonSetting] {
        if titleView == passwordView {
            return [TextButtonSetting(imageName: "icon-password-show", selectedImageName: "icon-password-show")]
        }
        return []
    }
}
