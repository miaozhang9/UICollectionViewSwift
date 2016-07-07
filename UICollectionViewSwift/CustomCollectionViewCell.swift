//
//  CustomCollectionViewCell.swift
//  UICollectionViewSwift
//
//  Created by Miaoz on 16/7/6.
//  Copyright © 2016年 Miaoz. All rights reserved.
//

import UIKit

class CustomCollectionViewCell: UICollectionViewCell, UIGestureRecognizerDelegate {
    var cardView:CardView
    
    override init(frame: CGRect) {
        cardView = CardView(frame: frame)
        super.init(frame: frame)
        self.contentView.addSubview(cardView)
        
        let swipeLeft:UISwipeGestureRecognizer = UISwipeGestureRecognizer(target: self, action: #selector(CustomCollectionViewCell.didSwipeLeft(_:)))
        swipeLeft.delegate = self
        swipeLeft.numberOfTouchesRequired = 1
        swipeLeft.direction = UISwipeGestureRecognizerDirection.Left
        self.addGestureRecognizer(swipeLeft)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func didSwipeLeft(gesture:UIGestureRecognizer) -> Void {
        NSLog("Swipe left")
    }
    func setCardText(text: String) -> Void {
        self.cardView.label.text = text
        
    }
    override func layoutSubviews() {
        self.cardView.frame = self.bounds
    }
}
