//
//  MenuDetay.swift
//  Butonlu
//
//  Created by İlmiye Edepli on 1.07.2016.
//  Copyright © 2016 Emre. All rights reserved.
//

import UIKit

class MenuDetay: UIViewController {

    @IBOutlet weak var label: UILabel!
    
    @IBOutlet weak var imageView: UIImageView!
    
    
   /* @IBAction func cikis(sender: AnyObject) {
        NSUserDefaults.standardUserDefaults().setObject(nil, forKey: "tokeni")
        var tokenid = NSUserDefaults.standardUserDefaults().stringForKey("tokeni")
        NSUserDefaults.standardUserDefaults().synchronize()

        NSUserDefaults.standardUserDefaults().setObject(nil, forKey: "uidi")
        var userid = NSUserDefaults.standardUserDefaults().stringForKey("uidi")
        NSUserDefaults.standardUserDefaults().synchronize()
        
        NSUserDefaults.standardUserDefaults().setObject(nil, forKey: "fulnamei")
        var fulname = NSUserDefaults.standardUserDefaults().stringForKey("fulnamei")
        NSUserDefaults.standardUserDefaults().synchronize()
        
        let Alert:UIAlertView = UIAlertView(title: "Uyarı", message: "Başarıyla Çıkış Yapıldı", delegate: self, cancelButtonTitle: "Tamam")
        Alert.show()
 
    }*/
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        
        let backgroundImage = UIImageView(frame: UIScreen.mainScreen().bounds)
        backgroundImage.image = UIImage(named: "SONBACK")
        self.view.insertSubview(backgroundImage, atIndex: 0)
        
        
        // fotoğraf
        
        let image = UIImageView(frame: CGRectMake(0, 0, 100, 100))
        
        imageView.layer.borderWidth=1.0
        imageView.layer.masksToBounds = false
        imageView.layer.borderColor = UIColor.whiteColor().CGColor
        imageView.layer.cornerRadius = 13
        imageView.layer.cornerRadius = image.frame.size.height/2
        imageView.clipsToBounds = true
        
        let fullname = NSUserDefaults.standardUserDefaults().stringForKey("fulnamei")
        
        label.text = fullname
        
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
}
