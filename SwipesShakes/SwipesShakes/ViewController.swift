//
//  ViewController.swift
//  SwipesShakes
//
//  Created by Romildo Jozue Paiter on 4/16/16.
//  Copyright © 2016 Paiter App. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var actionLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Swipe - Deslizamento de Dedo
        // Direita
        let swipeRigth = UISwipeGestureRecognizer(target: self, action: #selector(ViewController.swipe))
        swipeRigth.direction = UISwipeGestureRecognizerDirection.Right
        self.view.addGestureRecognizer(swipeRigth)
        
        let swipeUP = UISwipeGestureRecognizer(target: self, action: #selector(ViewController.swipe))
        swipeUP.direction = UISwipeGestureRecognizerDirection.Up
        self.view.addGestureRecognizer(swipeUP)
        
        let swipeLeft = UISwipeGestureRecognizer(target: self, action: #selector(ViewController.swipe))
        swipeLeft.direction = UISwipeGestureRecognizerDirection.Left
        self.view.addGestureRecognizer(swipeLeft)

        let swipeDown = UISwipeGestureRecognizer(target: self, action: #selector(ViewController.swipe))
        swipeDown.direction = UISwipeGestureRecognizerDirection.Down
        self.view.addGestureRecognizer(swipeDown)

        
    }
    
    func swipe(gesture: UIGestureRecognizer) {
        
        if let swipeGesture = gesture as? UISwipeGestureRecognizer {
            
            switch swipeGesture.direction {
            case UISwipeGestureRecognizerDirection.Right:
                actionLabel.text = "Rigth"
                print("Direita")
            case UISwipeGestureRecognizerDirection.Up:
                actionLabel.text = "Up"
                print("Cima")
            case UISwipeGestureRecognizerDirection.Down:
                actionLabel.text = "Down"
                print("Baixo")
            case UISwipeGestureRecognizerDirection.Left:
                actionLabel.text = "Left"
                print("Esquerda")
            default:
                break
            }
        }
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    override func motionEnded(motion: UIEventSubtype, withEvent event: UIEvent?) {
        if event?.subtype == UIEventSubtype.MotionShake {
            actionLabel.text = "Device was shaking"
            print("Device was shaking")
        }
    }
    
    


}

