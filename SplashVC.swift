//
//  SplashVC.swift
//  woven
//
//  Created by Jackson Fall on 2/27/16.
//
//

import UIKit

class SplashVC: UIViewController {

    @IBOutlet weak var bgView: UIImageView!
    @IBOutlet weak var bgRect: UIView!
    @IBOutlet weak var logo: UIImageView!
    @IBOutlet weak var blurbText: UILabel!
    @IBOutlet weak var playerButton: UIButton!
    
    let bgOriginScale = CGAffineTransformMakeScale(1.1, 1.1)
    let bgOriginTranslation = CGAffineTransformMakeTranslation(0, 20)
    let bgRectOriginScale = CGAffineTransformMakeScale(0.9, 0.9)
    let bgRectOriginTranslation = CGAffineTransformMakeTranslation(0, 10)
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        bgRect.layer.cornerRadius = 60
        bgRect.layer.masksToBounds = true
        self.bgView.transform = CGAffineTransformConcat(self.bgOriginScale, self.bgOriginTranslation)
        self.bgRect.transform = CGAffineTransformConcat(self.bgRectOriginScale, self.bgRectOriginTranslation)
        self.blurbText.kern(5)
        playerButton.kern(5)
        

    }
    override func viewDidAppear(animated: Bool) {
        UIView.animateWithDuration(0.7, delay: 0, options: .CurveEaseOut, animations: {
            
            self.bgView.transform = CGAffineTransformIdentity
            self.bgRect.transform = CGAffineTransformIdentity
            
            
            
            }, completion: { finished in
                UIView.animateWithDuration(0.8, delay: 0.8, options: .CurveEaseOut, animations: { () -> Void in
                    self.bgRect.transform = CGAffineTransformMakeTranslation(0, -80)
                    self.bgRect.backgroundColor = self.bgRect.backgroundColor?.colorWithAlphaComponent(0)


                    }, completion: { (finished) -> Void in
                        //IT worked!
                })
            })
    }
}
