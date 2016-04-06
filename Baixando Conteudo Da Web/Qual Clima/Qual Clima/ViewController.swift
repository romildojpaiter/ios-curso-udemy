//
//  ViewController.swift
//  Qual Clima
//
//  Created by Romildo Jozue Paiter on 3/28/16.
//  Copyright © 2016 Paiter Tecnologia. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var cityTextField: UITextField!
    @IBOutlet weak var resultLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBAction func findWeatherAction(sender: AnyObject) {
        
        let cidade = cityTextField.text!.stringByReplacingOccurrencesOfString(" ", withString: "-");

        let requestedURL = NSURL(string: "http://www.weather-forecast.com/locations/" + cidade + "/forecasts/latest")
        
        if let url = requestedURL {
            
            let task = NSURLSession.sharedSession().dataTaskWithURL(url) { (data, response, error) in
                
                let httpResponse = response as! NSHTTPURLResponse
                
                if httpResponse.statusCode == 200 {
                    
                    if let urlContent = data {
                        
                        let webContent = NSString(data: urlContent, encoding: NSUTF8StringEncoding)
                        
                        let websiteArray = webContent!.componentsSeparatedByString("3 Day Weather Forecast Summary:</b><span class=\"read-more-small\"><span class=\"read-more-content\"> <span class=\"phrase\">")
                        
                        if websiteArray.count > 0 {
                            
                            let weatherArray = websiteArray[1].componentsSeparatedByString("</span>");
                            
                            if weatherArray.count > 0 {
                                let weatherSummary = weatherArray[0].stringByReplacingOccurrencesOfString("&deg;", withString: "º");
                                
                                dispatch_async(dispatch_get_main_queue(), {
                                    self.resultLabel.text = weatherSummary
                                })
                            }
                            
                        }
                    }

                } else {

                    dispatch_async(dispatch_get_main_queue(), {
                        self.resultLabel.text = "Cidade não encontrada"
                    })
                    
                }
                
            }
            
            task.resume();
            
        } else {
            self.resultLabel.text = "Url Inválida";
        }
        
    }

}

