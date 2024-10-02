//
//  EmployeeListModel.swift
//  coreDataDemo
//
//  Created by Apple on 01/10/24.
//  Copyright © 2024 CodeCat15. All rights reserved.
//

import Foundation
// ViewModel
class EmployeeListViewModel {
    var results: [Employee]?
    private let manager = EmployeeManager()
    func getAllEmplyees(completion: @escaping (Result<[Employee], Error>) -> Void) {
        results = manager.fetchEmployee()
        completion(.success(results ?? []))
    }
}
