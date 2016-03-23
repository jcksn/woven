//
//  SplashVC.swift
//  woven
//
//  Created by Jackson Fall on 2/27/16.
//
//

import UIKit
//import ElasticTransition

class SplashVC: UIViewController, UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {

    @IBOutlet weak var bgView: UIImageView!
    @IBOutlet weak var bgRect: UIView!
    @IBOutlet weak var logo: UIImageView!
    @IBOutlet weak var playerButton: UIButton!
    @IBOutlet weak var collection: UICollectionView!
    
    let bgOriginScale = CGAffineTransformMakeScale(1.1, 1.1)
    let bgOriginTranslation = CGAffineTransformMakeTranslation(0, 20)
    let bgRectOriginScale = CGAffineTransformMakeScale(0.9, 0.9)
    let bgRectOriginTranslation = CGAffineTransformMakeTranslation(0, 10)
    
//    var transition = ElasticTransition()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.collection.delegate = self
        self.collection.dataSource = self
        self.collection.alpha = 0
        self.collection.showsHorizontalScrollIndicator = false
//        transition.edge = .Right
//        transition.sticky = false
//        transition.panThreshold = 0.3
//        transition.damping = 1
//        transition.stiffness = 1
//        transition.radiusFactor = 0.0
//        transition.transformType = .TranslatePush
//        transition.containerColor = UIColor.blackColor()
//        transition.frontViewBackgroundColor = UIColor.init(colorLiteralRed: 13/255, green: 60/255, blue: 100/255, alpha: 0)
//        transition.overlayColor = UIColor.init(colorLiteralRed: 13/255, green: 60/255, blue: 100/255, alpha: 0)
//        
//        navigationController?.delegate = transition
//        
//        let panGesture = UIPanGestureRecognizer(target: self, action: #selector(SplashVC.handlePan(_:)))
//        view.addGestureRecognizer(panGesture)
//        
        bgRect.layer.cornerRadius = 60
        bgRect.layer.masksToBounds = true
        self.bgView.transform = CGAffineTransformConcat(self.bgOriginScale, self.bgOriginTranslation)
        self.bgRect.transform = CGAffineTransformConcat(self.bgRectOriginScale, self.bgRectOriginTranslation)
//        self.blurbText.kern(5)
        playerButton.kern(5)
    }
    
    override func viewDidAppear(animated: Bool) {
        super.viewDidAppear(animated)
        UIView.animateWithDuration(0.7, delay: 0, options: .CurveEaseOut, animations: {
            self.bgView.transform = CGAffineTransformIdentity
            self.bgRect.transform = CGAffineTransformIdentity
        }, completion: { finished in
            UIView.animateWithDuration(0.8, delay: 0.8, options: .CurveEaseOut, animations: { () -> Void in
                self.bgRect.transform = CGAffineTransformMakeTranslation(0, -200) // This number should be generated programatically, so that logo ends up near the top of any phone
                self.collection.alpha = 1
                self.bgRect.backgroundColor = self.bgRect.backgroundColor?.colorWithAlphaComponent(0)
            }, completion: { (finished) -> Void in
                // Done!
            })
        })
    }
    

    //1
    func numberOfSectionsInCollectionView(collectionView: UICollectionView) -> Int {
        return 1
    }
    
    //2
    func collectionView(collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 3
    }
    
    //3
    func collectionView(collectionView: UICollectionView, cellForItemAtIndexPath indexPath: NSIndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCellWithReuseIdentifier("OnboardCell", forIndexPath: indexPath) 
        // Configure the cell
        return cell
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


