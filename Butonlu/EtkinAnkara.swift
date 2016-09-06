//
//  EtkinAnkara.swift
//  Butonlu
//
//  Created by Other on 06/09/16.
//  Copyright © 2016 Emre. All rights reserved.
//

import UIKit

class EtkinAnkara: UIViewController {

    @IBOutlet weak var webView: UIWebView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        loadAddressURL()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    func loadAddressURL() {
        
        
        let url = NSURL (string: "https://www.etkinankara.com/default.asp");
        let request = NSURLRequest(URL: url!);
        
        
        webView.loadRequest(request)
        
    }

}
