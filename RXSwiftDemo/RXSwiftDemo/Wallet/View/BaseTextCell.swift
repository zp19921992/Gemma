//
//  BaseTextCell.swift
//  RXSwiftDemo
//
//  Created by peng zhu on 2018/7/2.
//  Copyright © 2018年 Alger. All rights reserved.
//

import UIKit

class BaseTextCell: UICollectionViewCell {

    @IBOutlet weak var tagBtn: UIButton!
    
    var title : String? {
        didSet {
            tagBtn.setTitle(title, for: .normal)
            updateWidth()
        }
    }
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
    }
    
    override var intrinsicContentSize: CGSize {
        return CGSize.init(width: UIViewNoIntrinsicMetric,height: UIViewNoIntrinsicMetric)
    }
    
    fileprivate func updateWidth() {
        layoutIfNeeded()
//        self.width = dynamicWidth()
        invalidateIntrinsicContentSize()
    }
    
    fileprivate func dynamicWidth() -> CGFloat {
        return tagBtn.width + 32
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        tagBtn.contentEdgeInsets = UIEdgeInsetsMake(0, 16, 0, 16)
        layoutIfNeeded()
    }

}
