//
//  ElKitabi.swift
//  Butonlu
//
//  Created by Other on 31/08/16.
//  Copyright © 2016 Emre. All rights reserved.
//

import UIKit

class ElKitabi: UIViewController {

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
        
        
        //let url = "http://www.tedu.edu.tr/tr/main/akademik-takvim"
        
        let url = NSURL (string: "http://student.tedu.edu.tr/sites/default/files/content_files/2015-2016ogrencielkitabi.pdf");
        let request = NSURLRequest(URL: url!);
        
        
        webView.loadRequest(request)
        
    }

}
