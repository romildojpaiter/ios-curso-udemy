//
//  ViewController.swift
//  HandingShakeSound
//
//  Created by Romildo Jozue Paiter on 4/16/16.
//  Copyright © 2016 Paiter App. All rights reserved.
//

import UIKit
import AVFoundation

class ViewController: UIViewController {

    var player: AVAudioPlayer = AVAudioPlayer()
    var musicsArray = ["aplito", "engatilha", "gasping", "snack", "trem"]
    @IBOutlet weak var tocandoLabel: UILabel!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override func motionEnded(motion: UIEventSubtype, withEvent event: UIEvent?) {
        
        if event?.subtype == UIEventSubtype.MotionShake {
            let random = Int(arc4random_uniform(UInt32(musicsArray.count)))
            let music: String = musicsArray[random]
            tocandoLabel.text = music
            // playSound(music)
            playSounds(music)
            print("Handing Shake Device")
        }
    }
    
    func playSounds(nameOfAudio: String){
        
        let fileLocation = NSBundle.mainBundle().pathForResource(nameOfAudio, ofType: "mp3")

        do {
            try
            player = AVAudioPlayer(contentsOfURL: NSURL(fileURLWithPath: fileLocation!))
            player.play()
        } catch {
            print("error playing \(nameOfAudio)")
        }
    }
    
    func playSound(nameOfAudioFileInAssetCatalog: String) {
        
        var alarmAudioPlayer: AVAudioPlayer?
        
        if let sound = NSDataAsset(name: nameOfAudioFileInAssetCatalog) {
            do {
                try! AVAudioSession.sharedInstance().setCategory(AVAudioSessionCategoryPlayback)
                try! AVAudioSession.sharedInstance().setActive(true)
                try alarmAudioPlayer = AVAudioPlayer(data: sound.data, fileTypeHint: AVFileTypeWAVE)
                alarmAudioPlayer!.play()
            } catch {
                print("error initializing AVAudioPlayer")
            }
        }
    }


}

