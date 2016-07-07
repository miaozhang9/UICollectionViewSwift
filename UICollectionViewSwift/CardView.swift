//
//  CardView.swift
//  UICollectionViewSwift
//
//  Created by Miaoz on 16/7/6.
//  Copyright © 2016年 Miaoz. All rights reserved.
//

import UIKit

class CardView: UIView {

    var label:UILabel
    
    override init(frame: CGRect) {
        self.label = UILabel()
        self.label.font = UIFont.boldSystemFontOfSize(24)
        self.label.textAlignment = NSTextAlignment.Center
        super.init(frame: frame)
        self.addSubview(self.label)
        self.backgroundColor = UIColor.whiteColor()
        self.layer.cornerRadius = 10.0
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        self.label.frame = self.bounds
    }
    
    /*
    // Only override drawRect: if you perform custom drawing.
    // An empty implementation adversely affects performance during animation.
    override func drawRect(rect: CGRect) {
        // Drawing code
    }
    */

}
