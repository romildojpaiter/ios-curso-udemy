//
//  ViewController.swift
//  Jogo Da Velha
//
//  Created by Romildo Jozue Paiter on 3/30/16.
//  Copyright © 2016 Paiter Tecnologia. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    // 1-circulo - 2-xis

    @IBOutlet weak var winnerLabel: UILabel!
    @IBOutlet weak var playAgainButton: UIButton!    

    var gameActive = true
    var activePlayer = 1
    var gameState = [0, 0, 0, 0, 0, 0, 0, 0, 0, 0]
    let winnerCombinations = [
        [1,2,3], [4,5,6], [7,8,9],
        [1,4,7], [2,5,8], [3,6,9],
        [1,5,9], [3,5,7]
    ]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        winnerLabel.hidden = true
        playAgainButton.hidden = true
        
        winnerLabel.center = CGPointMake(winnerLabel.center.x - 500, winnerLabel.center.y)
        playAgainButton.center = CGPointMake(playAgainButton.center.x - 500, playAgainButton.center.y)
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBAction func newGameAction(sender: AnyObject) {
        self.gameActive = true
        self.activePlayer = 1
        self.gameState = [0, 0, 0, 0, 0, 0, 0, 0, 0, 0]
        
        winnerLabel.hidden = true
        playAgainButton.hidden = true
        
        winnerLabel.center = CGPointMake(winnerLabel.center.x - 500, winnerLabel.center.y)
        playAgainButton.center = CGPointMake(playAgainButton.center.x - 500, playAgainButton.center.y)
        
        // limpa os botoes da imagens
        
        var button: UIButton
        
        for var i = 1; i <= 9; i += 1 {
            
            button = view.viewWithTag(i) as! UIButton
            button.setImage(nil, forState: .Normal)
            
        }
        
    }
    
    
    @IBAction func buttonPressed(sender: AnyObject) {
        
        if gameState[sender.tag] == 0 && gameActive {
            
            gameState[sender.tag] = activePlayer
            var image = UIImage();
            if activePlayer == 1 {
                image = UIImage(named: "circulo")!;
                activePlayer = 2
            } else {
                image = UIImage(named: "xis")!;
                activePlayer = 1
            }
            
            sender.setImage(image, forState: .Normal)
            
            for combination in winnerCombinations {
                
                if gameState[combination[0]] != 0 && gameState[combination[0]] == gameState[combination[1]] && gameState[combination[1]] == gameState[combination[2]]
                {
                    var vencedor = "Bolinha"
                    if gameState[combination[0]] == 2 {
                        vencedor = "Cruz"
                    }
                    winnerLabel.text = "Jogador \(vencedor) Ganhou"
                    
                    winnerLabel.hidden = false
                    playAgainButton.hidden = false
                    
                    UIView.animateWithDuration(0.5, animations: { 
                        self.winnerLabel.center = CGPointMake(self.winnerLabel.center.x + 500, self.winnerLabel.center.y)
                        self.playAgainButton.center = CGPointMake(self.playAgainButton.center.x + 500, self.playAgainButton.center.y)

                    })
                    
                    
                    // Encerra o Jogo
                    gameActive = false
                }
                
            }

        }
        
    }

}

