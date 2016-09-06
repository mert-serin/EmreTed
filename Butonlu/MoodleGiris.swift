//
//  MoodleGiris.swift
//  Butonlu
//
//  Created by İlmiye Edepli on 30.06.2016.
//  Copyright © 2016 Emre. All rights reserved.
//

import UIKit
import SwiftyJSON

class MoodleGiris: UIViewController {
    
    var objects = [[String: String]]()
    
    @IBOutlet weak var id: UITextField!
    @IBOutlet weak var pw: UITextField!
    
    var tokenid = String()
    var uid = String()
    var fulname = String()
    var picturelink = String()
    
    @IBAction func giris(sender: AnyObject) {
        
        let ad = id.text!
        let sifre = pw.text!
        
        let URL: NSURL = NSURL(string: "http://moodle.tedu.edu.tr/login/token.php")!
        let request:NSMutableURLRequest = NSMutableURLRequest(URL:URL)
        request.HTTPMethod = "POST"
        
        let bodyData = "username="+ad+"&password="+sifre+"&service=moodle_mobile_app"
        request.HTTPBody = bodyData.dataUsingEncoding(NSUTF8StringEncoding)
        
        NSURLConnection.sendAsynchronousRequest(request, queue: NSOperationQueue.mainQueue())
            {
                (response, data, error) in
                
                let json = JSON(data: data!)
                self.parseJSON(json)
                
                NSUserDefaults.standardUserDefaults().setObject(String(json["token"]), forKey: "tokeni")
                NSUserDefaults.standardUserDefaults().synchronize()
                self.tokenid = NSUserDefaults.standardUserDefaults().stringForKey("tokeni")!
                
                if(json["token"] != nil)
                {
                    
                    self.kullaniciverileri()
                }
                
                else
                {
                    let Alert:UIAlertView = UIAlertView(title: "Error", message: "E-mail or password incorrect", delegate: self, cancelButtonTitle: "Try Again")
                        Alert.show()
                }
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    
    func parseJSON(json: JSON) {
        for(var i=0; i<json.count; i++)
        {
            let token = json[i]["token"].stringValue
            
            let obj = ["token": token]
            objects.append(obj)
            
        }
    }
    

   func kullaniciverileri()
    {
        let URL: NSURL = NSURL(string: "http://moodle.tedu.edu.tr/webservice/rest/server.php")!
        let request:NSMutableURLRequest = NSMutableURLRequest(URL:URL)
        request.HTTPMethod = "POST"
        
        let bodyData = "wstoken="+tokenid+"&moodlewsrestformat=json&wsfunction=core_webservice_get_site_info"
        request.HTTPBody = bodyData.dataUsingEncoding(NSUTF8StringEncoding)
        
        NSURLConnection.sendAsynchronousRequest(request, queue: NSOperationQueue.mainQueue())
            {
                (response, data, error) in
                
                let json = JSON(data: data!)
                
                NSUserDefaults.standardUserDefaults().setObject(String(json["userid"]), forKey: "uidi")
                NSUserDefaults.standardUserDefaults().synchronize()
                self.uid = NSUserDefaults.standardUserDefaults().stringForKey("uidi")!
                
                NSUserDefaults.standardUserDefaults().setObject(String(json["fullname"]), forKey: "fulnamei")
                NSUserDefaults.standardUserDefaults().synchronize()
                self.fulname = NSUserDefaults.standardUserDefaults().stringForKey("fulnamei")!
                
                NSUserDefaults.standardUserDefaults().setObject(String(json["userpictureurl"]), forKey: "picturelinki")
                NSUserDefaults.standardUserDefaults().synchronize()
                self.picturelink = NSUserDefaults.standardUserDefaults().stringForKey("picturelinki")!
                
               let secondViewController = self.storyboard!.instantiateViewControllerWithIdentifier("MoodleDetay") as! MoodleDetay
                
                self.navigationController!.pushViewController(secondViewController, animated: true)
                

        }

    }
}
