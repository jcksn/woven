//
//  SplashVC.swift
//  woven
//
//  Created by Jackson Fall on 2/27/16.
//
//

import UIKit
import ElasticTransition

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
    
    var transition = ElasticTransition()
        
    override func viewDidLoad() {
        super.viewDidLoad()

        transition.edge = .Bottom
        transition.sticky = false
        transition.panThreshold = 0.3
        transition.damping = 1
        transition.stiffness = 1
        transition.radiusFactor = 0.0
        transition.transformType = .TranslatePush
        transition.containerColor = UIColor.blackColor()
        transition.frontViewBackgroundColor = UIColor.init(colorLiteralRed: 13/255, green: 60/255, blue: 100/255, alpha: 0)
        transition.overlayColor = UIColor.init(colorLiteralRed: 13/255, green: 60/255, blue: 100/255, alpha: 0.5)
        
        navigationController?.delegate = transition
        
        let panGesture = UIPanGestureRecognizer(target: self, action: "handlePan:")
        view.addGestureRecognizer(panGesture)
        
        bgRect.layer.cornerRadius = 60
        bgRect.layer.masksToBounds = true
        self.bgView.transform = CGAffineTransformConcat(self.bgOriginScale, self.bgOriginTranslation)
        self.bgRect.transform = CGAffineTransformConcat(self.bgRectOriginScale, self.bgRectOriginTranslation)
        self.blurbText.kern(5)
        playerButton.kern(5)
    }
    
    override func viewDidAppear(animated: Bool) {
        super.viewDidAppear(animated)
        UIView.animateWithDuration(0.7, delay: 0, options: .CurveEaseOut, animations: {
            self.bgView.transform = CGAffineTransformIdentity
            self.bgRect.transform = CGAffineTransformIdentity
        }, completion: { finished in
            UIView.animateWithDuration(0.8, delay: 0.8, options: .CurveEaseOut, animations: { () -> Void in
                self.bgRect.transform = CGAffineTransformMakeTranslation(0, -80)
                self.bgRect.backgroundColor = self.bgRect.backgroundColor?.colorWithAlphaComponent(0)
            }, completion: { (finished) -> Void in
                // Done!
            })
        })
    }
    
    func handlePan(pan:UIPanGestureRecognizer){
        if pan.state == .Began{
            // Here, you can do one of two things
            // 1. show a viewcontroller directly
//            let nextViewController = self.storyboard!.instantiateViewControllerWithIdentifier("AudioController") as UIViewController
//            transition.startInteractiveTransition(self, toViewController: nextViewController, gestureRecognizer: pan)
//            // 2. perform a segue
            transition.startInteractiveTransition(self, segueIdentifier: "AudioControllerSegue", gestureRecognizer: pan)
        } else {
            transition.updateInteractiveTransition(gestureRecognizer: pan)
        }
    }
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        segue.destinationViewController.transitioningDelegate = transition
        segue.destinationViewController.modalPresentationStyle = .Custom
    }
}
