//
//  Takvim.swift
//  Butonlu
//
//  Created by İlmiye Edepli on 30.06.2016.
//  Copyright © 2016 Emre. All rights reserved.
//

import UIKit

class Takvim: UIViewController {

    @IBOutlet weak var webView: UIWebView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        loadAddressURL()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    func loadAddressURL() {
        
        
        let url = NSURL (string: "http://www.tedu.edu.tr/sites/default/files/content_files/2016-2017_akademik_takvim_son.pdf");
        let request = NSURLRequest(URL: url!);
        
        
        webView.loadRequest(request)
        
    }

}
