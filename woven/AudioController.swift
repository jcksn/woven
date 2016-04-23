//
//  AudioController.swift
//  woven
//
//  Created by Jackson Fall on 2/28/16.
//
//

import UIKit
import AVFoundation
import ElasticTransition

var meditationPlayer: AVAudioPlayer!

class AudioController: UIViewController, ElasticMenuTransitionDelegate {
    
    @IBOutlet weak var backgroundImage: UIImageView!
    
    var contentLength:CGFloat = (UIScreen.mainScreen().bounds.width / 4) * 3
    var dismissByBackgroundTouch = true
    var dismissByBackgroundDrag = true
    var dismissByForegroundDrag = true
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
//        self.backgroundImage.transform = CGAffineTransformConcat(CGAffineTransformMakeScale(-1, 1), CGAffineTransformMakeRotation(CGFloat(M_PI)))
        self.backgroundImage.transform = CGAffineTransformMakeScale(-1, 1);
        let path = NSBundle.mainBundle().pathForResource("Woven-Meditation-Track.mp3", ofType:nil)!
        let url = NSURL(fileURLWithPath: path)
        do {
            let sound = try AVAudioPlayer(contentsOfURL: url)
            let audioSession = AVAudioSession.sharedInstance()
            do {
               try audioSession.setCategory(AVAudioSessionCategoryPlayback)
               try audioSession.setActive(true)
            
            } catch {
                print("AVAudioSession cannot be set")
            }
            meditationPlayer = sound
            sound.play()
        } catch {
            // couldn't load file :(
            
        }
    }
    
    override func viewDidAppear(animated: Bool) {
        super.viewDidAppear(animated)
        
    }
    
    override func viewDidDisappear(animated: Bool) {
        if meditationPlayer != nil {
           meditationPlayer.stop()
            meditationPlayer = nil
        }
    }
}

