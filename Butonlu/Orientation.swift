//
//  Orientation.swift
//  Butonlu
//
//  Created by Other on 06/09/16.
//  Copyright © 2016 Emre. All rights reserved.
//

import UIKit

class Orientation: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        let backgroundImage = UIImageView(frame: UIScreen.mainScreen().bounds)
        backgroundImage.image = UIImage(named: "SONBACK")
        self.view.insertSubview(backgroundImage, atIndex: 0)
        
        //self.view.backgroundColor = UIColor(patternImage: UIImage(named: "SONBACK")!)
        
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
