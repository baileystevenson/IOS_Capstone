//
//  AddGroupViewController.swift
//  IntheKnow
//
//  Created by mac on 2/15/23.
//

import UIKit
import CoreData

class AddGroupViewController: UIViewController {
    
    
    //reference to managed object context
    let context = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext
    
    
    
    @IBOutlet weak var enterGroupName: UITextField!
    
    @IBAction func addGroupButtonTapped(_ sender: Any) {
        
        //create group object
        let newGroup = GroupSaved(context: self.context)
        newGroup.name = enterGroupName.text
        
        //save the data
        do {
            try self.context.save()
        } catch {
        }
        
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
}

