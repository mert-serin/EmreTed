//
//  HaberDetay.swift
//  Butonlu
//
//  Created by İlmiye Edepli on 29.06.2016.
//  Copyright © 2016 Emre. All rights reserved.
//

import UIKit

class HaberDetay: UIViewController {

    
    @IBOutlet weak var webView: UIWebView!
   
    var link = String()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }
    
    override func viewWillAppear(animated: Bool) {
        loadAddressURL()
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func loadAddressURL() {
        
        var tempLink = String(link.characters.dropFirst())
        tempLink = String(tempLink.characters.dropLast(5))
        
        let url = NSURL(string: tempLink)

        let request = NSURLRequest(URL: url!)
        
        webView.loadRequest(request)
        
    }

}
