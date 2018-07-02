//
//  ComfirmView.swift
//  RXSwiftDemo
//
//  Created by peng zhu on 2018/6/27.
//  Copyright © 2018年 Alger. All rights reserved.
//

import UIKit

typealias comfirmCancelHandle = () -> Void
typealias comfirmSureHandle = () -> Void

protocol ComfirmViewProtocol {

    func showComfirmView(inView view: UIView, withTitle title: String, content: String, cancelTitle: String, sureTitle: String, cancelCompeleted: comfirmSureHandle, sureCompleted: comfirmSureHandle)
    
    func showComfirmView(inView view: UIView, withTitle title: String, content: String, cancelTitle: String, sureTitle: String, isShade: Bool, isTouchDismiss: Bool, cancelCompeleted: comfirmSureHandle, sureCompleted: comfirmSureHandle)
}

extension ComfirmViewProtocol where Self: UIViewController {
    
    func showComfirmView(inView view: UIView, withTitle title: String, content: String, cancelTitle: String, sureTitle: String, cancelCompeleted: comfirmSureHandle, sureCompleted: comfirmSureHandle) {
        showComfirmView(inView: view, withTitle: title, content: content, cancelTitle: cancelTitle, sureTitle: sureTitle, isShade: true, isTouchDismiss: true, cancelCompeleted: cancelCompeleted, sureCompleted: cancelCompeleted)
    }
    
    func showComfirmView(inView view: UIView, withTitle title: String, content: String, cancelTitle: String, sureTitle: String, isShade: Bool, isTouchDismiss: Bool, cancelCompeleted: comfirmSureHandle, sureCompleted: comfirmSureHandle) {
        let comfirmView: ComfirmView = ComfirmView(coder: NSCoder())!
        
    }
}

class ComfirmView: UIView {

    @IBOutlet var containerView: UIView!
    
    @IBOutlet weak var titleLabel: UILabel!
    
    @IBOutlet weak var contentLabel: UILabel!
    
    @IBOutlet weak var cancelButton: UIButton!
    
    @IBOutlet weak var sureButton: UIButton!
    
    
    var isShade: Bool = true
    
    var isTouchDismiss: Bool = true
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        loadViewFromNib()
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
        self.centerY = (self.superview?.centerY)!
    }
    
    func setupUI(withTitle title: String, content: String, cancelTitle: String, sureTitle: String, isShade: Bool, isTouchDismiss: Bool) {
        titleLabel.text = title
        contentLabel.text = content
        cancelButton.setTitle(cancelTitle, for: .normal)
        sureButton.setTitle(sureTitle, for: .normal)
    }
    
}
