//
//  ViewController.swift
//  Web-View-Exemplo
//
//  Created by Romildo Jozue Paiter on 5/12/16.
//  Copyright © 2016 Paiter App. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var webView: UIWebView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        let url = NSURL(string: "https://www.mirago.com.br/")!
        
        let request = NSURLRequest(URL: url)
        
        webView.loadRequest(request)
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

