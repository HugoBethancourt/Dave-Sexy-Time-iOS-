//
//  SecondViewController.swift
//  Dave Sexy Time
//
//  Created by Hugo Bethancourt on 1/24/18.
//  Copyright © 2018 Next Level Technology LLC. All rights reserved.
//

import UIKit

class SecondViewController: UIViewController {
    
    

    @IBAction func export(sender: AnyObject){
        let fileName = "log.csv"
        let path = NSURL(fileURLWithPath : NSTemporaryDirectory()).appendingPathComponent(fileName)
        
        var csvText = "Date,Activity Description,Time,Monthly Total\n"
        FirstViewController.load()
        
    }
 
    
//@IBAction func export(sender: AnyObject) {
        
        //let fileName = "_log.csv"
        //let path = NSURL(fileURLWithPath: NSTemporaryDirectory()).URLByAppendingPathComponent(fileName)
        
        //var csvText = "Date,Activity Description,Time,Montly Ttl.\n\(Log.date),\(log.desc),\(log.time),\(log.total))\n\nDate,Mileage,Gallons,Price,Price per gallon,Miles between fillups,MPG\n"
        
    /*    var csvText = "Last Name, First Name\n\(name.firstName),\(name.lastName)\n \nDate,Activity Description,Time,Monthly Ttl.\n\(log.date),\(log.description),\(log.time),\(log.total)\n"
        
        projectName.rows.sortInPlace({ $0.date.compare($1.date) == .OrderedDescending })
        
        let count = .fillups.count
        
        if count > 0 {
            
            for fillup in currentCar.fillups {
                
                let dateFormatter = NSDateFormatter()
                dateFormatter.dateStyle = NSDateFormatterStyle.ShortStyle
                let convertedDate = dateFormatter.stringFromDate(fillup.date)
                
                let newLine = "\(convertedDate),\(fillup.mileage),\(fillup.gallons),\(fillup.priceTotal),\(fillup.priceGallon),\(fillup.mileDelta),\(fillup.MPG)\n"
                
                csvText.appendContentsOf(newLine)
            }
            
            do {
                try csvText.writeToURL(path, atomically: true, encoding: NSUTF8StringEncoding)
                
                let vc = UIActivityViewController(activityItems: [path], applicationActivities: [])
                vc.excludedActivityTypes = [
                    UIActivityTypeAssignToContact,
                    UIActivityTypeSaveToCameraRoll,
                    UIActivityTypePostToFlickr,
                    UIActivityTypePostToVimeo,
                    UIActivityTypePostToTencentWeibo,
                    UIActivityTypePostToTwitter,
                    UIActivityTypePostToFacebook,
                    UIActivityTypeOpenInIBooks
                ]
                presentViewController(vc, animated: true, completion: nil)
                
            } catch {
                
                print("Failed to create file")
                print("\(error)")
            }
            
        } else {
            showErrorAlert("Error", msg: "There is no data to export")
 
 }
    }

    */
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

}

