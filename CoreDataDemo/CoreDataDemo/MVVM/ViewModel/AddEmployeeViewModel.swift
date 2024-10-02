//
//  AddEmployeeViewModel.swift
//  coreDataDemo
//
//  Created by Apple on 01/10/24.
//  Copyright © 2024 CodeCat15. All rights reserved.
//

import Foundation
class AddEmployeeViewModel {
    
    private let manager = EmployeeManager()
    func addEmployee(emp:Employee,completion: @escaping (Bool) -> Void) {
        manager.createEmployee(employee: emp)
        completion(true)
    }
    
    func updateEmployee(emp:Employee,completion: @escaping (Bool) -> Void) {
       let result = manager.updateEmployee(employee: emp)
        completion(result)
    }
    func deleteEmployee(id:UUID,completion: @escaping (Bool) -> Void) {
        let result = manager.deleteEmployee(id: id)
        completion(result)
    }
    func fetchEmployee(id:UUID,completion: @escaping (Employee?) -> Void) {
        guard let emp = manager.fetchEmployee(byIdentifier: id) else {return completion(nil) }
        completion(emp)
    }
}
