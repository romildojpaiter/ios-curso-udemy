//
//  ViewController.swift
//  Exemplo Json
//
//  Created by Romildo Jozue Paiter on 4/26/16.
//  Copyright © 2016 Paiter App. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var lblJsonResult: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        let geoIp = NSURL(string: "http://geoip.nekudo.com/api/189.87.159.130")!
        
        let task = NSURLSession.sharedSession().dataTaskWithURL(geoIp) { (data, response, error) in
            
            if let urlContent = data {
                
                do {
                    let jsonResult = try NSJSONSerialization.JSONObjectWithData(urlContent, options: NSJSONReadingOptions.MutableContainers)
                    
                    print(jsonResult)
                    print(jsonResult["country"]!)
                    
                    self.lblJsonResult.text = jsonResult["country"]! as? String
                    
                } catch {
                    print("Json Serialization fail")
                }
                
            } else {
                print("error")
            }
        }
        
        task.resume()
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

