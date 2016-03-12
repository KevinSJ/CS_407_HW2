//
//  AddEventViewController.swift
//  Calendar
//
//  Created by Sicong Jiang on 2016/03/09
//  Copyright © 2016年 Sicong Jiang. All rights reserved.
//


import UIKit
import CoreData

class AddEventViewController: UIViewController {

    @IBOutlet weak var titleField: UITextField!
    @IBOutlet weak var infoField: UITextField!
    
    @IBOutlet weak var eventDatePicker: UIDatePicker!
    
    @IBAction func btnSavePressed(sender: UIButton) {
        if let title = titleField.text{
            if title.isEmpty == false{
                let appDel: AppDelegate = (UIApplication.sharedApplication().delegate as! AppDelegate)
                let context: NSManagedObjectContext = appDel.managedObjectContext
                let ent = NSEntityDescription.entityForName("UserEvents", inManagedObjectContext: context)!
                
                //Instance of our custom class, reference to entity
                let newEvent = UserEvents(entity: ent, insertIntoManagedObjectContext: context)
                
                //Fill in the Core Data
                newEvent.title = title
                newEvent.info = infoField.text!
                
                let dateFormatter = NSDateFormatter()
                
                dateFormatter.dateFormat = "YYYY/MM/dd, EEE, h:mm a"
                newEvent.date = dateFormatter.stringFromDate(eventDatePicker.date)
                
                do {
                    try context.save()
                } catch _ {
                }
            }else{
                //User carelessly pressed save button without entering weight.
                let alert:UIAlertController = UIAlertController(title: "No Event Entered", message: "Enter your event before pressing save.", preferredStyle: .Alert)
                alert.addAction(UIAlertAction(title: "Ok", style: .Default, handler: {(result)in
                    alert.dismissViewControllerAnimated(true, completion: nil)
                }))
                self.presentViewController(alert, animated: true, completion: nil)
            }
        }else{
            print("No element text for the UITextField 'txtTitle'")
        }
    }
    
    override func touchesBegan(touches: Set<UITouch>, withEvent event: UIEvent?) {
        self.view.endEditing(true)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
}
