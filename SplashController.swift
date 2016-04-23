//
//  SplashVC.swift
//  woven
//
//  Created by Jackson Fall on 2/27/16.
//
//

import UIKit
//import ElasticTransition

class SplashController: UIViewController, UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {

    //  Outlets
    @IBOutlet weak var backgroundImageView: UIImageView!
    @IBOutlet weak var logoView: UIView!
    @IBOutlet weak var logoViewWidth: NSLayoutConstraint!
    @IBOutlet weak var logoViewVertical: NSLayoutConstraint!
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var collection: UICollectionView!
    @IBOutlet weak var pageControl: UIPageControl!
    @IBOutlet weak var startButton: UIButton!
    
    //  Variables
    var pageTitles = [String]()
    var pageImages = [String]()
    
    //  Status Bar
    override func prefersStatusBarHidden() -> Bool {
        return true;
    }
    
    //  Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        pageTitles = ["Welcome to Woven", "Sexy Meditation, Flavio Approved", "Make America Great Again"]
        pageImages = ["meditate", "flavio", "america"]
        
        setupAppearances()
        setupCollection()
    }
    override func viewDidAppear(animated: Bool) {
        super.viewDidAppear(animated)
        reveal()
    }
    
    //  Setup
    func setupAppearances() {
        logoView.layer.cornerRadius = 50
        logoView.layer.masksToBounds = true
        startButton.kern(3)
        startButton.layer.cornerRadius = 10
        startButton.layer.masksToBounds = true
        startButton.alpha = 0
        titleLabel.alpha = 0
        pageControl.alpha = 0
    }
    func setupCollection() {
        collection.alpha = 0
        collection.delegate = self
        collection.dataSource = self
        collection.showsHorizontalScrollIndicator = false
    }
    
    //  Animations
    func reveal() {
        self.logoViewVertical.constant = -((view.frame.height / 2) - 64)
        UIView.animateWithDuration(1, delay: 1, options: .CurveEaseOut, animations: {
            self.view.layoutIfNeeded()
            self.logoView.backgroundColor = UIColor.clearColor()
        }) { (complete) in
            self.logoViewWidth.constant = 180 + 100
            UIView.animateWithDuration(1, delay: 0, options: .CurveEaseOut, animations: {
                self.view.layoutIfNeeded()
                self.titleLabel.alpha = 1
                self.collection.alpha = 1
                self.startButton.alpha = 1
                self.pageControl.alpha = 1
            }) { (complete) in
                
            }
        }
    }
    
    //  UICollectionView
    func numberOfSectionsInCollectionView(collectionView: UICollectionView) -> Int {
        return 1
    }
    func collectionView(collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return pageTitles.count
    }
    func collectionView(collectionView: UICollectionView, cellForItemAtIndexPath indexPath: NSIndexPath) -> UICollectionViewCell {
        let splashCell: SplashCell = collectionView.dequeueReusableCellWithReuseIdentifier("SplashCell", forIndexPath: indexPath) as! SplashCell
        splashCell.imageView.image = UIImage(imageLiteral: pageImages[indexPath.row])
        splashCell.titleLabel.text = pageTitles[indexPath.row]
        splashCell.titleLabel.kern(3)
        return splashCell
    }
    func collectionView(collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAtIndexPath indexPath: NSIndexPath) -> CGSize {
        return collectionView.frame.size
    }
    func collectionView(collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAtIndex section: Int) -> CGFloat {
        return 0
    }
    func collectionView(collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAtIndex section: Int) -> CGFloat {
        return 0
    }
}


