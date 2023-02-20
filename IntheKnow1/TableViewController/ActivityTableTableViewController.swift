//
//  ActivityTableTableViewController.swift
//  IntheKnow1
//
//  Created by mac on 2/17/23.
//
import CoreData
import UIKit

class ActivityTableTableViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    @IBOutlet var activityTableView: UITableView!
    
    let context = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext
    
    //Represents all our activities
    var itemsActivity: [ActivitySaved] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        activityTableView.dataSource = self
        activityTableView.delegate = self
        
        fetchActivitySaved()
    }
        // MARK: - Table view data source
    func fetchActivitySaved() {
        do {
            self.itemsActivity = try
            context.fetch(ActivitySaved.fetchRequest())
            
            DispatchQueue.main.async {
                self.activityTableView.reloadData()
            }
        }
        catch {
        }
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return itemsActivity.count }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "activityCell", for: indexPath)
        
        // Configure the cell...
        let activity =
        self.itemsActivity[indexPath.row]
        cell.textLabel?.text = activity.name
        cell.detailTextLabel?.text = activity.location
        cell.detailTextLabel?.text = activity.details
        
        return cell
    }
    
}
    

