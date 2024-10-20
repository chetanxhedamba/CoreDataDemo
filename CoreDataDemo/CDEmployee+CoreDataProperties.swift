//
//  CDEmployee+CoreDataProperties.swift
//  CoreDataDemo
//
//  Created by Apple on 02/10/24.
//
//

import Foundation
import CoreData


extension CDEmployee {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<CDEmployee> {
        return NSFetchRequest<CDEmployee>(entityName: "CDEmployee")
    }

    @NSManaged public var id: UUID?
    @NSManaged public var name: String?
    @NSManaged public var email: String?
    @NSManaged public var profilePic: Data?
    func convertToEmployee() -> Employee
    {
        return Employee(name: self.name, email: self.email, profilePicture: self.profilePic, id: self.id!)
    }
}

extension CDEmployee : Identifiable {

}
