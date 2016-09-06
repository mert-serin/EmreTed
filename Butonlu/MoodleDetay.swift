//
//  MoodleDetay.swift
//  Butonlu
//
//  Created by İlmiye Edepli on 30.06.2016.
//  Copyright © 2016 Emre. All rights reserved.
//

import UIKit
import SwiftyJSON

class MoodleDetay: UIViewController, UITableViewDataSource, UITableViewDelegate{

    var tokenid = String()
    var uid = String()
    var secilenDers = String()
    
    
    @IBOutlet weak var tblView: UITableView!

    var objects = [[String: String]]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        let bgImage = UIImageView();
        bgImage.image = UIImage(named: "SONBACK");
        bgImage.contentMode = .ScaleToFill
        
        self.tblView.backgroundView = bgImage
        
        
        let Alert:UIAlertView = UIAlertView(title: "Error", message: "No Records Found", delegate: self, cancelButtonTitle: "OK")
        Alert.show()
        

        self.tokenid = NSUserDefaults.standardUserDefaults().stringForKey("tokeni")!

        self.uid = NSUserDefaults.standardUserDefaults().stringForKey("uidi")!
                
        let urlString = "http://moodle.tedu.edu.tr/webservice/rest/server.php?moodlewsrestformat=json&wsfunction=core_enrol_get_users_courses&wstoken="+tokenid+"&userid="+uid
        
        if let url = NSURL(string: urlString) {
            if var data = try? NSData(contentsOfURL: url, options: []) {
            
                let json = JSON(data: data)
                parseJSON(json)
                
            }
        }
    }
    
    func parseJSON(json: JSON) {
        for(var i=0; i<json.count; i++)
        {
            let title = json[i]["fullname"].stringValue
            let body = json[i]["summary"].stringValue
            let id = json[i]["id"].stringValue
        
            let obj = ["title": title, "body": body, "id": id]
           objects.append(obj)
        }

        tblView.reloadData()
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    func numberOfSectionsInTableView(tableView: UITableView) -> Int
    {
        return 1
    }
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int
    {
        return objects.count
    }
    
    func tableView(tableView: UITableView,cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell
    {
        let cell = tableView.dequeueReusableCellWithIdentifier("myCell", forIndexPath: indexPath)
        
        let object = objects[indexPath.row]
        
        
        
        print("title")
        
        cell.textLabel!.text = object["title"]!
        cell.textLabel?.textAlignment = .Center
        
        //cell.detailTextLabel!.text = object["body"]
        return cell
    }
    
    func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        
        let object = objects[indexPath.row]
        secilenDers = object["id"]!

        performSegueWithIdentifier("moodledersac", sender: nil)
    }
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        
        if(segue.identifier == "moodledersac"){
            let thirdVC: MoodleDersDetay = segue.destinationViewController as! MoodleDersDetay
            thirdVC.sders = secilenDers
        }
    }

}
