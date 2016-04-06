//
//  ViewController.swift
//  Animacoes
//
//  Created by Romildo Jozue Paiter on 3/29/16.
//  Copyright © 2016 Paiter Tecnologia. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    var posicao = 1
    var timer = NSTimer()
    var isAnimating = true
    

    @IBOutlet weak var taiotochiImage: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        atribuiTimer()
    }
    
    func atribuiTimer() {
        timer = NSTimer.scheduledTimerWithTimeInterval(0.1, target: self, selector: #selector(ViewController.doAnimation), userInfo: nil, repeats: true)
    }
    

    func doAnimation(){
        if (posicao == 1) {
            taiotochiImage.image = UIImage(named: "taiotoshi.jpg")
            posicao += 1
        } else {
            taiotochiImage.image = UIImage(named: "taiotoshi\(posicao).jpg")
            posicao += 1
            if posicao == 5 {
                posicao = 1
            }
        }
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBAction func atualizarImagemAction(sender: AnyObject) {
        if isAnimating == true {
            timer.invalidate()
            isAnimating = false
        } else {
            atribuiTimer()
            isAnimating = true
        }
    }
    
    override func viewDidLayoutSubviews() {
        // taiotochiImage.center = CGPointMake(taiotochiImage.center.x - 400, taiotochiImage.center.y)
        // taiotochiImage.alpha = 0
        // taiotochiImage.frame = CGRectMake(100, 20, 0, 0)
    }
    
    override func viewDidAppear(animated: Bool) {
        UIView.animateWithDuration(1) { 
            // self.taiotochiImage.center = CGPointMake(self.taiotochiImage.center.x + 400, self.taiotochiImage.center.y)
            // self.taiotochiImage.alpha = 1
            // self.taiotochiImage.frame = CGRectMake(100, 20, 100, 200)
        }
    }

}

