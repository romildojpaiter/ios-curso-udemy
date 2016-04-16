//
//  ViewController.swift
//  Exemplo Audio
//
//  Created by Romildo Jozue Paiter on 4/12/16.
//  Copyright © 2016 Paiter Tecnologia. All rights reserved.
//

import UIKit
import AVFoundation

class ViewController: UIViewController {
    
    @IBOutlet weak var slider: UISlider!
    var player:AVAudioPlayer = AVAudioPlayer()
    let audioPath = NSBundle.mainBundle().pathForResource("david", ofType: "mp3")!

    override func viewDidLoad() {
        super.viewDidLoad()
        
        do {
            try player = AVAudioPlayer(contentsOfURL: NSURL(fileURLWithPath: audioPath))
        } catch {
            
        }
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBAction func play(sender: AnyObject) {
        player.play()
    }

    @IBAction func pause(sender: AnyObject) {
        
        player.pause()
    }
    
    @IBAction func sliderAction(sender: AnyObject) {
        player.volume = slider.value
    }
    
    @IBAction func resetAudio(sender: AnyObject) {
        do {
            try player = AVAudioPlayer(contentsOfURL: NSURL(fileURLWithPath: audioPath))
            player.play()
        } catch {
            
        }
    }
}

