//
//  ViewController.swift
//  CustomFlowLayout
//
//  Created by Paolo Moroni on 16/09/15.
//  Copyright (c) 2015 none. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UICollectionViewDataSource, UICollectionViewDelegate {

    @IBOutlet weak var topConstraint: NSLayoutConstraint!
    @IBOutlet weak var collectionView: UICollectionView?
    private let tilesFlowLayout = UICollectionViewFlowLayout()
    private let stripFlowLayout = UICollectionViewFlowLayout()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.tilesFlowLayout.scrollDirection = UICollectionViewScrollDirection.Vertical
        self.tilesFlowLayout.itemSize = CGSizeMake(125, 125)
        self.tilesFlowLayout.minimumInteritemSpacing = 0
        
        self.stripFlowLayout.scrollDirection = UICollectionViewScrollDirection.Horizontal
        self.stripFlowLayout.itemSize = CGSizeMake(125, 125)
        self.tilesFlowLayout.minimumInteritemSpacing = 0

        self.collectionView?.collectionViewLayout = tilesFlowLayout
        
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


    func collectionView(collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 12;
    }
    
    func collectionView(collectionView: UICollectionView, cellForItemAtIndexPath indexPath: NSIndexPath) -> UICollectionViewCell {
        let cell: CollectionViewCell = collectionView.dequeueReusableCellWithReuseIdentifier("Cell", forIndexPath: indexPath) as! CollectionViewCell
        cell.numberLabel.text = String(indexPath.row)
        return cell
    }
    
    func collectionView(collectionView: UICollectionView, didSelectItemAtIndexPath indexPath: NSIndexPath) {
        
        self.topConstraint.constant = CGRectGetMaxY(self.collectionView!.bounds) - 125
        UIView.animateWithDuration(0.6, delay: 0, options: UIViewAnimationOptions.CurveEaseInOut, animations: { () -> Void in
            self.view.layoutIfNeeded()
            self.collectionView?.collectionViewLayout = self.stripFlowLayout
            }, completion: { (finished) -> Void in
        })
    }
}

