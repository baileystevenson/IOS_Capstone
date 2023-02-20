//
//  OpeningScreenViewController.swift
//  IntheKnow
//
//  Created by mac on 2/15/23.
//
import CoreData
import UIKit

class OpeningScreenViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {
    
    static let shared = OpeningScreenViewController.self()
    
    @IBOutlet weak var groupView: UITableView!
    
    let context = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext
    
    //Represents all our Groups
    var items: [GroupSaved] = []
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        groupView.dataSource = self
        groupView.delegate = self
        
        fetchGroupSaved()
    }
    
    func fetchGroupSaved() {
        do {
            
            //Asking CoreData for the array of Groups and then setting the OpeningScreenViewController's 'items' property to the array that we got back from Coredata
            self.items = try context.fetch(GroupSaved.fetchRequest())
            
            DispatchQueue.main.async {
                self.groupView.reloadData()
            }
        }
        catch {
        }
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return items.count }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "groupCell", for: indexPath)
        
        //Grab Group from Array
        let group =
        self.items[indexPath.row]
        
        cell.textLabel?.text = group.name
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        //Select Group
        let group =  self.items[indexPath.row]
        
        //Create Alert
        let alert = UIAlertController(title: "Edit Group", message: "Edit Group Name", preferredStyle: .alert)
        alert.addTextField()
        
        let textfield = alert.textFields![0]
        textfield.text = group.name
        
        //Configure button handler
        _ = UIAlertAction(title: "Save", style: .default) { (action) in
            
            //Get the textfield for the alert
            _ = alert.textFields![0]
        }
        
        
        
        
    }
    
    func tableView(_ tableView: UITableView, trailingSwipeActionsConfigurationForRowAt indexPath: IndexPath) -> UISwipeActionsConfiguration? {
        
        let action = UIContextualAction(style: .destructive, title: "Delete") { (action, view, completionHandler) in
            
            //Which person to remove
            let groupToRemove = self.items[indexPath.row]
            
            //Remove the person
            self.context.delete(groupToRemove)
            //Save the data
            
            do {
                try self.context.save()
            }
            catch {
            }
            
            //Re-fetch the data
            self.fetchGroupSaved()
        }
        
        //Return swipe actions
        return UISwipeActionsConfiguration(actions: [action])
    }
        
}

