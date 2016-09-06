//
//  ViewController.swift
//  Butonlu
//
//  Created by İlmiye Edepli on 29.06.2016.
//  Copyright © 2016 Emre. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UICollectionViewDataSource, UICollectionViewDelegate, NSXMLParserDelegate{


    @IBOutlet weak var creator: UILabel!
    
    @IBOutlet weak var collectionView: UICollectionView!
    
    @IBAction func cikis(sender: AnyObject) {
        NSUserDefaults.standardUserDefaults().setObject(nil, forKey: "tokeni")
        var tokenid = NSUserDefaults.standardUserDefaults().stringForKey("tokeni")
        NSUserDefaults.standardUserDefaults().synchronize()
        
        NSUserDefaults.standardUserDefaults().setObject(nil, forKey: "uidi")
        var userid = NSUserDefaults.standardUserDefaults().stringForKey("uidi")
        NSUserDefaults.standardUserDefaults().synchronize()
        
        NSUserDefaults.standardUserDefaults().setObject(nil, forKey: "fulnamei")
        var fulname = NSUserDefaults.standardUserDefaults().stringForKey("fulnamei")
        NSUserDefaults.standardUserDefaults().synchronize()
        
        let Alert:UIAlertView = UIAlertView(title: "Caution", message: "Session Successfully Closed", delegate: self, cancelButtonTitle: "OK")
        Alert.show()
    }
    
    @IBAction func menu(sender: AnyObject)
    {
        
    }
    @IBAction func haber(sender: AnyObject)
    {
        
    }
    @IBAction func moodle(sender: AnyObject)
    {
        let tokenid = NSUserDefaults.standardUserDefaults().stringForKey("tokeni")
        
        if(tokenid != nil)
        {
            let secondViewController = self.storyboard!.instantiateViewControllerWithIdentifier("MoodleDetay") as! MoodleDetay
            self.navigationController!.pushViewController(secondViewController, animated: true)
        }
        else
        {
            let secondViewController = self.storyboard!.instantiateViewControllerWithIdentifier("MoodleGiris") as! MoodleGiris
            self.navigationController!.pushViewController(secondViewController, animated: true)
        }
        
    }
    @IBAction func takvim(sender: AnyObject)
    {
        
    }
    
    var parser = NSXMLParser()
    var haberler = NSMutableArray()
    var elements = NSMutableDictionary()
    var element = NSString()
    var title1 = NSMutableString()
    var link = NSMutableString()
    var yazar = NSMutableString()
    var renkler = NSMutableString()
    
    var secilenHaber = String()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        let bgImage = UIImageView();
        bgImage.image = UIImage(named: "SONBACK");
        bgImage.contentMode = .ScaleToFill
        
        self.collectionView?.backgroundView = bgImage
        
        /*collectionView.layer.shadowColor = UIColor.whiteColor().CGColor
        collectionView.layer.shadowOffset = CGSizeMake(0, 2)
        collectionView.layer.shadowOpacity = 0.8
        collectionView.layer.shadowRadius = 2
        collectionView.clipsToBounds = true
        collectionView.layer.masksToBounds = true*/
        
        
        parsingDataFromURL()
        
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    //Parsing
    
    func parsingDataFromURL()
    {
        haberler = []
        parser = NSXMLParser(contentsOfURL: NSURL(string : "http://www.tedu.edu.tr/rss.xml")!)!
        parser.delegate = self
        parser.parse()
        
        //collectionView.backgroundColor =
        collectionView.reloadData()
    }
    
    //nsxml item functions
    
    func parser(parser: NSXMLParser, didStartElement elementName: String, namespaceURI: String?, qualifiedName qName: String?, attributes attributeDict: [String : String]) {
        
        element = elementName
        
        if(elementName as NSString).isEqualToString("item")
        {
            elements = NSMutableDictionary()
            elements = [:]
            
            title1 = NSMutableString()
            title1 = " "
            
            link = NSMutableString()
            link = " "
            
            yazar = NSMutableString()
            yazar = " "
            
            //renkler = NSMutableString()
            //renkler = " "
        }
    }
    
    func parser(parser: NSXMLParser, foundCharacters string: String) {
        
        if(element.isEqualToString("title"))
        {
            title1.appendString(string)
        }
            
        else if (element.isEqualToString("link"))
        {
            link.appendString(string)
        }
        
        else if (element.isEqualToString("dc:creator"))
        {
            yazar.appendString(string)
        }
        
        //else if (element.isEqualToString(""))
        //{
        //    renkler.appendString(string)
        //}
    }
    
    func parser(parser: NSXMLParser, didEndElement elementName: String, namespaceURI: String?, qualifiedName qName: String?) {
        
        if(elementName as NSString) .isEqualToString("item")
        {
            if(!title1.isEqual(nil))
            {
                elements.setObject(title1, forKey: "title")
            }
            
            if(!link.isEqual(nil))
            {
                elements.setObject(link, forKey: "link")
            }
            
            if(!yazar.isEqual(nil))
            {
                elements.setObject(yazar, forKey: "dc:creator")
            }
            
            haberler.addObject(elements)
        }
    }
    
    func collectionView(collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int
    {
        return haberler.count
    }
    
    func collectionView(collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAtIndexPath indexPath: NSIndexPath) -> CGSize {
        
        
        
        var ssize = haberler.objectAtIndex(indexPath.row).valueForKey("title") as! NSString as String
        
        var screenSize = UIScreen.mainScreen()
        
        let frame = collectionView.frame
        let width = frame.width
        let height = frame.height
        
        //var txtsize = ssize.characters.count
        
        
        //print(txtsize)
        
        return CGSize(width: width/2 - 20, height: height/2)
        
        /*
        
        if haberler[indexPath.row] as! NSObject == 1 
        {
            return CGSize(width: 180, height: 122)
        } else 
        {
            return CGSize(width: 144, height: 122)
        }*/
    }
    
    func collectionView(collectionView: UICollectionView, cellForItemAtIndexPath indexPath: NSIndexPath) -> UICollectionViewCell
    {
        let cell = collectionView.dequeueReusableCellWithReuseIdentifier("myCell", forIndexPath: indexPath) as UICollectionViewCell
        
        let cellbgturuncu = UIImageView();
        cellbgturuncu.image = UIImage(named: "SONHABERMAVI");
        cellbgturuncu.contentMode = .ScaleToFill
        
        let cellbgkirmizi = UIImageView();
        cellbgkirmizi.image = UIImage(named: "SONHABERKIRMIZI");
        cellbgkirmizi.contentMode = .ScaleToFill
        
        let cellbgsari = UIImageView();
        cellbgsari.image = UIImage(named: "SONHABERSARI");
        cellbgsari.contentMode = .ScaleToFill
        
        let cellbgpembe = UIImageView();
        cellbgpembe.image = UIImage(named: "SONHABERMAVI");
        cellbgpembe.contentMode = .ScaleToFill
        
        var Haber = cell.viewWithTag(1) as! UILabel
        
        var Yazar = cell.viewWithTag(2) as! UILabel
        
        var texti = haberler.objectAtIndex(indexPath.row).valueForKey("title") as! NSString as String
        
        var yazari = haberler.objectAtIndex(indexPath.row).valueForKey("dc:creator") as! NSString as String
        
        Haber.text = String(texti.characters.dropFirst())
        
        Yazar.text = String(yazari)
        
        var k: Int = random() % 5;
        
        
        if(k==0)
        {
            cell.backgroundView = cellbgkirmizi
        }
        
        else if(k==1)
        {
            cell.backgroundView = cellbgturuncu
        }
        
        else if(k==2)
        {
            cell.backgroundView = cellbgpembe
        }
        else if(k>=3)
        {
            cell.backgroundView = cellbgsari
        }
        
        
        //print(k)
        
        return cell
    }
    
    func collectionView(collectionView: UICollectionView, didSelectItemAtIndexPath indexPath: NSIndexPath)
    {
        secilenHaber = haberler[indexPath.row].valueForKey("link") as! String
        performSegueWithIdentifier("haberac", sender: nil)
    }
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        
        if(segue.identifier == "haberac"){
            let thirdVC: HaberDetay = segue.destinationViewController as! HaberDetay
            thirdVC.link = secilenHaber
        }
    }
    

    
    
    
    
    
    
    
}

