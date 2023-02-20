//
//  ActivitySaved+CoreDataProperties.swift
//  IntheKnow1
//
//  Created by mac on 2/16/23.
//
//

import Foundation
import CoreData


extension ActivitySaved {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<ActivitySaved> {
        return NSFetchRequest<ActivitySaved>(entityName: "ActivitySaved")
    }

    @NSManaged public var name: String?
    @NSManaged public var location: String?
    @NSManaged public var details: String?
    @NSManaged public var groups: NSSet?

}

// MARK: Generated accessors for groups
extension ActivitySaved {

    @objc(addGroupsObject:)
    @NSManaged public func addToGroups(_ value: GroupSaved)

    @objc(removeGroupsObject:)
    @NSManaged public func removeFromGroups(_ value: GroupSaved)

    @objc(addGroups:)
    @NSManaged public func addToGroups(_ values: NSSet)

    @objc(removeGroups:)
    @NSManaged public func removeFromGroups(_ values: NSSet)

}

extension ActivitySaved : Identifiable {

}
