//
//  EmployeeListVC.swift
//  coreDataDemo
//
//  Created by CodeCat15 on 6/12/20.
//  Copyright © 2020 CodeCat15. All rights reserved.
//

import UIKit

class EmployeeListVC: UIViewController {
    @IBOutlet weak var lblNoData : UILabel!
    @IBOutlet weak var tblView: UITableView!
    @IBOutlet weak var vwPlusBtn: UIView!
    private var arrEmployees: [Employee] = []
    private let empListViewModel = EmployeeListViewModel()
    override func viewDidLoad() {
        super.viewDidLoad()
       
        tblView.delegate = self
        tblView.dataSource = self
        tblView.register(UINib(nibName: "EmployeeTVC", bundle: nil), forCellReuseIdentifier: "EmployeeTVC")
        tblView.rowHeight = 120.0
        vwPlusBtn.dropShadow(cornerRadius: 25)
        lblNoData.isHidden = true
    }
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        getEmployeeData()
    }
    @IBAction func btnAddAction(_ sender: Any) {
        let vc = self.storyboard?.instantiateViewController(withIdentifier: "AddEmployeeVC") as! AddEmployeeVC
        self.navigationController?.pushViewController(vc, animated: true)
    }
    
    
    func getEmployeeData(){
        empListViewModel.getAllEmplyees { [self] result in
            switch result {
            case .success(let arrEmp):
                self.arrEmployees = arrEmp
                if self.arrEmployees.count == 0{
                    lblNoData.isHidden = false
                    tblView.isHidden = true
                    
                }else{
                    lblNoData.isHidden = true
                    tblView.isHidden = false
                }
                DispatchQueue.main.async {
                    self.tblView.reloadData()
                }
                break
            case .failure(_):
                break
            default:
                break
            }
        }
    }
}

extension EmployeeListVC : UITableViewDataSource, UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        arrEmployees.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell : EmployeeTVC = tableView.dequeueReusableCell(withIdentifier: "EmployeeTVC") as! EmployeeTVC
        
        let objEmp = self.arrEmployees[indexPath.row]
        cell.setData(obj: objEmp)
        return cell
    }
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let vc = self.storyboard?.instantiateViewController(withIdentifier: "AddEmployeeVC") as! AddEmployeeVC
        vc.isEdit = true
        vc.id = arrEmployees[indexPath.row].id
        self.navigationController?.pushViewController(vc, animated: true)
    }
}
