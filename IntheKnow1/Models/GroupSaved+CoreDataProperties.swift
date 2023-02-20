//
//  GroupSaved+CoreDataProperties.swift
//  IntheKnow1
//
//  Created by mac on 2/16/23.
//
//

import Foundation
import CoreData

    
extension GroupSaved {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<GroupSaved> {
        return NSFetchRequest<GroupSaved>(entityName: "GroupSaved")
    }

    @NSManaged public var name: String?
    @NSManaged public var activities: NSSet?

}

// MARK: Generated accessors for activities
extension GroupSaved {
    
    @objc(addActivitiesObject:)
    @NSManaged public func addToActivities(_ value: ActivitySaved)
    
    @objc(removeActivitiesObject:)
    @NSManaged public func removeFromActivities(_ value: ActivitySaved)
    
    @objc(addActivities:)
    @NSManaged public func addToActivities(_ values: NSSet)
    
    @objc(removeActivities:)
    @NSManaged public func removeFromActivities(_ values: NSSet)
    
}
extension GroupSaved : Identifiable {
    
}
