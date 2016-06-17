//
//  ViewController.swift
//  Baixando Imagens da Web
//
//  Created by Romildo Jozue Paiter on 4/19/16.
//  Copyright © 2016 Paiter App. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var imageView: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        let url = NSURL(string: "http://core0.staticworld.net/images/article/2014/09/java-100432255-primary.idge.jpg")
        let urlRequest = NSURLRequest(URL: url!)
        
        NSURLConnection.sendAsynchronousRequest(urlRequest, queue: NSOperationQueue.mainQueue()) { (response, data, error) in
            
            if error != nil {
                print(error)
            } else{
                
                //
                if let imagem = UIImage(data: data!) {
                    
                    // Seta a imagem no componente image view
                    //self.imageView.image = imagem
                    
                    // cacheado um imagem da internet
                    
                    var documentDirectory: String?
                    
                    // Pegando os caminhos dos arquivo do sistema
                    var path:[AnyObject] = NSSearchPathForDirectoriesInDomains(NSSearchPathDirectory.DocumentDirectory, NSSearchPathDomainMask.UserDomainMask, true)
                    
                    print(path)
                    
                    if path.count > 0 {
                        documentDirectory = path[0] as? String
                        let savePath = documentDirectory! + "java.jpg"
                        
                        // Salvando um arquivo da internet no diretorio do celular
                        NSFileManager.defaultManager().createFileAtPath(savePath, contents: data, attributes: nil)
                        
                        // Atrituindo do diretorio do celular ao componente de imagem
                        self.imageView.image = UIImage(named: savePath)
                        
                    }

                }
            }
        }
        
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

