//
//  AudioController.swift
//  woven
//
//  Created by Jackson Fall on 2/28/16.
//
//

import UIKit
import AVFoundation

var meditationPlayer: AVAudioPlayer!

class AudioController: UIViewController {
    override func viewDidLoad() {
        
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
    override func viewDidDisappear(animated: Bool) {
        if meditationPlayer != nil {
           meditationPlayer.stop()
            meditationPlayer = nil
        }
    }
}

