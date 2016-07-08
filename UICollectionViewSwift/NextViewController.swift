//
//  NextViewController.swift
//  UICollectionViewSwift
//
//  Created by Miaoz on 16/7/8.
//  Copyright © 2016年 Miaoz. All rights reserved.
//

import UIKit

class NextViewController: UIViewController, UICollectionViewDelegate, UICollectionViewDataSource {

    lazy var leftBarButton:UIBarButtonItem = {
        var backBtn: UIBarButtonItem = UIBarButtonItem(title: "返回", style: UIBarButtonItemStyle.Plain, target: self, action: #selector(NextViewController.backPopMethods))
        return backBtn
    }()
    
    lazy var collectionView:UICollectionView = {
        //定义collectionView的布局类型，流布局
        let layout = UICollectionViewFlowLayout()
        //设置cell的大小
//        layout.itemSize = CGSize(width: self.view.bounds.size.width/2, height: self.view.bounds.size.height/3)
        //滑动方向 默认方向是垂直
        layout.scrollDirection = .Vertical
        //每个Item之间最小的间距
        layout.minimumInteritemSpacing = 0
        //每行之间最小的间距
        layout.minimumLineSpacing = 5
        var cv:UICollectionView = UICollectionView(frame: self.view.bounds, collectionViewLayout: layout)
        cv.delegate = self
        cv.dataSource = self
        cv.bounces = true
        cv.alwaysBounceVertical = true
        cv.autoresizingMask = [UIViewAutoresizing.FlexibleHeight, UIViewAutoresizing.FlexibleWidth]
        cv.registerClass(NextCollectionViewCell.self, forCellWithReuseIdentifier: "cell")
        cv.registerClass(UICollectionReusableView.self, forSupplementaryViewOfKind: UICollectionElementKindSectionHeader, withReuseIdentifier: "headView")
        cv.backgroundColor = UIColor(red: 230/255, green: 230/255, blue: 230/255, alpha: 1)
        

        return cv
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationItem.leftBarButtonItem = self.leftBarButton
        self.view.addSubview(self.collectionView)
        // Do any additional setup after loading the view.
    }

    func backPopMethods() -> Void {
        self.navigationController?.popViewControllerAnimated(true)
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    // #MARK: --UICollectionViewDataSource的代理方法
    /**
     - 该方法是可选方法，默认为1
     - returns: CollectionView中section的个数
     */
    func numberOfSectionsInCollectionView(collectionView: UICollectionView) -> Int {
        return 1
    }
    
    /**
     - returns: Section中Item的个数
     */
    func collectionView(collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 8
    }
    
    /**
     - returns: 绘制collectionView的cell
     */
    func collectionView(collectionView: UICollectionView, cellForItemAtIndexPath indexPath: NSIndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCellWithReuseIdentifier("cell", forIndexPath: indexPath) as! NextCollectionViewCell
        
        
        if indexPath.row%2 == 0 {
            cell.imgView.backgroundColor = UIColor.redColor()
        }else{
            cell.imgView.backgroundColor = UIColor.yellowColor()
        }
//        cell.imgView.image = UIImage(named: "\(indexPath.row + 2).png")
        cell.label.text = "美景\(indexPath.row + 1)"
        
        return cell
    }
    
    /**
     - returns: 返回headview或者footview
     */
    func collectionView(collectionView: UICollectionView, viewForSupplementaryElementOfKind kind: String, atIndexPath indexPath: NSIndexPath) -> UICollectionReusableView {
        let headView = collectionView.dequeueReusableSupplementaryViewOfKind(UICollectionElementKindSectionHeader, withReuseIdentifier: "headView", forIndexPath: indexPath)
        headView.backgroundColor = UIColor.whiteColor()
        
        return headView
    }
    
    
    // #MARK: --UICollectionViewDelegate的代理方法
    /**
     Description:当点击某个Item之后的回应
     */
    func collectionView(collectionView: UICollectionView, didSelectItemAtIndexPath indexPath: NSIndexPath) {
        print("(\(indexPath.section),\(indexPath.row))")
    }
    
    
    /**
     Description:可以定制不同的item
     
     - returns: item的大小
     */
    func collectionView(collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAtIndexPath indexPath: NSIndexPath) -> CGSize {
        if  indexPath.row % 2 == 1{
            return CGSize(width: self.view.bounds.width/2, height: self.view.bounds.height/3)
        }
        else{
            return CGSize(width: self.view.bounds.width/2, height: self.view.bounds.height/2)
        }
    }
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
