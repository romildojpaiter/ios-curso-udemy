//
//  ViewController.swift
//  MusicApp
//
//  Created by Romildo Jozue Paiter on 4/16/16.
//  Copyright © 2016 Paiter App. All rights reserved.
//

import UIKit
import AVFoundation

class ViewController: UIViewController {

    var player:AVAudioPlayer = AVAudioPlayer()
    
    @IBOutlet weak var volumeSlider: UISlider!
    @IBOutlet weak var scrubSlider: UISlider!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        executeMusic()
        
        // set o tempo do slider
        scrubSlider.maximumValue = Float(player.duration)
        
        NSTimer.scheduledTimerWithTimeInterval(1.0, target: self, selector: #selector(ViewController.updateTime), userInfo: nil, repeats: true)
    }
    
    func updateTime(){
        scrubSlider.value = Float(player.currentTime)
    }
    
    func executeMusic() {
        do {
            try
                player = AVAudioPlayer(contentsOfURL: NSURL(fileURLWithPath: NSBundle.mainBundle().pathForResource("david", ofType: "mp3")!))
        } catch {
            // work if erroe
        }
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        
    }

    /**
     Metodos do aplicativo
    */
    @IBAction func playButton(sender: AnyObject) {
        player.play()
    }
    
    @IBAction func volumeAjust(sender: AnyObject) {
        player.volume = volumeSlider.value
    }
    
    @IBAction func scrubAjust(sender: AnyObject) {
        player.currentTime = NSTimeInterval(scrubSlider.value)
    }

    @IBAction func pauseButton(sender: AnyObject) {
        player.pause()
    }
    
    @IBAction func stopButton(sender: AnyObject) {
        player.pause()
        executeMusic()
    }
}

