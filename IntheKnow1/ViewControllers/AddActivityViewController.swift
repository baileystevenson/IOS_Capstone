//
//  AddActivityViewController.swift
//  IntheKnow
//
//  Created by mac on 2/15/23.
//
import CoreData
import UIKit

class AddActivityViewController: UIViewController {
    
    
    //Mark Outlets
    @IBOutlet weak var activityNameTextField: UITextField!
    @IBOutlet weak var locationTextField: UITextField!
    @IBOutlet weak var detailsTextField: UITextField!
    
    
    let context = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext
    
    

    override func viewDidLoad() {
        super.viewDidLoad()
    }
        @IBAction func addActivityTapped(_ sender: Any) {
            
            //create group object
            let newActivity = ActivitySaved(context: context)
            newActivity.name = activityNameTextField.text
            
            let activityLocation = ActivitySaved(context: context)
            activityLocation.name = locationTextField.text
            
            
            let activityDetails = ActivitySaved(context: context)
            activityDetails.name = detailsTextField.text
            
            //save the data
            do {
                try self.context.save()
            } catch {
            }
        }
        
        
    }

