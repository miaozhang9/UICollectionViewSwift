//
//  NextCollectionViewCell.swift
//  UICollectionViewSwift
//
//  Created by Miaoz on 16/7/8.
//  Copyright © 2016年 Miaoz. All rights reserved.
//

import UIKit

class NextCollectionViewCell: UICollectionViewCell {
    
    lazy var imgView:UIImageView = {
        var imgV:UIImageView = UIImageView(frame: self.bounds)
        return imgV
    }()
    
    lazy var label:UILabel = {
        var lab:UILabel = UILabel()
        lab.frame = CGRect(x: 0, y: 0, width: self.bounds.size.width, height: 20)
        lab.textAlignment = NSTextAlignment.Center
        return lab
    }()
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.contentView.addSubview(self.imgView)
        self.contentView.addSubview(self.label)
        self.contentView.backgroundColor = UIColor(red: 23/255, green: 232/255, blue: 233/255, alpha: 1)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    override func awakeFromNib() {
        super.awakeFromNib()
       
    }
   
    
}
