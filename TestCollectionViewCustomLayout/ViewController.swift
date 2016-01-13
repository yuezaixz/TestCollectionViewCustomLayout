//
//  ViewController.swift
//  TestCollectionViewCustomLayout
//
//  Created by 吴迪玮 on 16/1/14.
//  Copyright © 2016年 DNT. All rights reserved.
//

import UIKit

class ViewController: UIViewController,UICollectionViewDelegate,UICollectionViewDataSource,UICollectionViewDelegateFlowLayout {
    @IBOutlet weak var testLayout: UICollectionViewFlowLayout!

    var collectionColors = [UIColor]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        initCollectColors()
        testLayout.sectionHeadersPinToVisibleBounds = true
    }
    
    func initCollectColors(){
        collectionColors.append(UIColor.blackColor())
        collectionColors.append(UIColor.darkGrayColor())
        collectionColors.append(UIColor.lightGrayColor())
        collectionColors.append(UIColor.greenColor())
        collectionColors.append(UIColor.whiteColor())
        collectionColors.append(UIColor.grayColor())
        collectionColors.append(UIColor.redColor())
        collectionColors.append(UIColor.greenColor())
        collectionColors.append(UIColor.blueColor())
        collectionColors.append(UIColor.cyanColor())
        collectionColors.append(UIColor.magentaColor())
        collectionColors.append(UIColor.orangeColor())
        collectionColors.append(UIColor.purpleColor())
        collectionColors.append(UIColor.brownColor())
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func collectionView(collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAtIndexPath indexPath: NSIndexPath) -> CGSize {
        let itemWidth = CGRectGetWidth(UIScreen.mainScreen().bounds)/2-30
        return CGSizeMake(itemWidth, itemWidth)
    }
    
    func collectionView(collectionView: UICollectionView, viewForSupplementaryElementOfKind kind: String, atIndexPath indexPath: NSIndexPath) -> UICollectionReusableView {
        var reusableview:UICollectionReusableView!
        if kind == UICollectionElementKindSectionHeader {
            reusableview = collectionView.dequeueReusableSupplementaryViewOfKind(kind, withReuseIdentifier: "TestCollectionHeader", forIndexPath: indexPath)
            let label = UILabel.init()
            label.text = "这是第\(indexPath.section+1)个集合"
            label.textColor = UIColor.whiteColor()
            label.frame = CGRectMake(10, 20, 150, 15)
            reusableview.addSubview(label)
        }
        return reusableview
    }
    
    func collectionView(collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return collectionColors.count
    }
    
    func numberOfSectionsInCollectionView(collectionView: UICollectionView) -> Int {
        return 2
    }
    
    func collectionView(collectionView: UICollectionView, cellForItemAtIndexPath indexPath: NSIndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCellWithReuseIdentifier("TestCollectionCell", forIndexPath: indexPath);
        cell.backgroundColor = collectionColors[indexPath.row]
        return cell
    }

}

