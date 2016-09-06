//
//  MoodleDersDetay.swift
//  Butonlu
//
//  Created by İlmiye Edepli on 30.06.2016.
//  Copyright © 2016 Emre. All rights reserved.
//

import UIKit
import SwiftyJSON

class MoodleDersDetay: UIViewController {

    @IBOutlet var tblView: UITableView!
    
    var tokenid = String()
    var uid = String()
    var sders = String()
    
    var sectionsayisi = Int()
    var sectionAdi = String()
    
    var objects = [[String: String]]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        self.tokenid = NSUserDefaults.standardUserDefaults().stringForKey("tokeni")!
        self.uid = NSUserDefaults.standardUserDefaults().stringForKey("uidi")!
        
        let urlString = "http://moodle.tedu.edu.tr/webservice/rest/server.php?moodlewsrestformat=json&wsfunction=core_course_get_contents&wstoken="+tokenid+"&courseid="+sders
        
        if let url = NSURL(string: urlString) {
            if let data = try? NSData(contentsOfURL: url, options: []) {
                
                let json = JSON(data: data)
                parseJSON(json)
                //print(json)
            }
        }
    }
    
    func parseJSON(json: JSON) {
        for(var i=0; i<json.count; i++)
        {
            let modules = json[i]["modules"]
            
            sectionsayisi = json.count
            
            //print(icerik)
            
            for(var j=0; j<modules.count; j++)
            {
                let contents = modules[j]["contents"]
                
                for(var k=0; k<contents.count; k++)
                {
                    print(contents[k]["filename"])
                    print(contents[k]["fileurl"])
                }
            }
            
            let title = json[i]["name"].stringValue
            
            sectionAdi = json[i]["name"].stringValue
            //print(sectionAdi)
            
            let obj = ["title": title]
            objects.append(obj)
        }
        
        tblView.reloadData()
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    func tableView(tableView: UITableView,cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell
    {
        let cell = tableView.dequeueReusableCellWithIdentifier("myCell", forIndexPath: indexPath)
        
        let object = objects[indexPath.row]

        cell.textLabel!.text = object["title"]
        cell.detailTextLabel!.text = object["body"]
        return cell
    }
    
    func numberOfSectionsInTableView(tableView: UITableView) -> Int
    {
        return sectionsayisi
    }
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int
    {
        return objects.count
    }
    
    func tableView(tableView: UITableView, titleForHeaderInSection section: Int) -> String?
    {
        return sectionAdi
    }
    
    
}
