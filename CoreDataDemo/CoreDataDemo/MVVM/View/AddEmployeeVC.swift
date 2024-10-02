//
//  AddEmployeeVC.swift
//  coreDataDemo
//
//  Created by Apple on 01/10/24.
//  Copyright © 2024 CodeCat15. All rights reserved.
//

import UIKit

class AddEmployeeVC: UIViewController,UIImagePickerControllerDelegate, UINavigationControllerDelegate{
    @IBOutlet weak var imgEmp : UIImageView!
    @IBOutlet weak var txtName : UITextField!
    @IBOutlet weak var txtEmail : UITextField!
    
    @IBOutlet weak var btnSave : UIButton!
    @IBOutlet weak var btnUpdate : UIButton!
    @IBOutlet weak var btnDelete : UIButton!
    
    private let addEmpViewModel = AddEmployeeViewModel()
    
    var isEdit = false
    var id = UUID()
    override func viewDidLoad() {
        super.viewDidLoad()
        
        if isEdit{
            btnSave.isHidden = true
            btnUpdate.isHidden = false
            btnDelete.isHidden = false
            fetchData()
        }else{
            btnSave.isHidden = false
            btnUpdate.isHidden = true
            btnDelete.isHidden = true
        }
        imgEmp.addTapGesture {
            let picker = UIImagePickerController()
            picker.sourceType = .savedPhotosAlbum
            picker.delegate = self
            self.present(picker, animated: true)
        }
    }
    
    func createEmp()  {
        let emp = Employee(name: txtName.text!, email: txtEmail.text!, profilePicture: imgEmp.image?.pngData(), id: UUID())
        addEmpViewModel.addEmployee(emp: emp) { isAdded in
            if isAdded{
                self.navigationController?.popViewController(animated: true)
            }
        }
    }
    func updateEmp()  {
        let emp = Employee(name: txtName.text!, email: txtEmail.text!, profilePicture: imgEmp.image?.pngData(), id: id)
        addEmpViewModel.updateEmployee(emp: emp) { isUpdated in
            if isUpdated{
                self.navigationController?.popViewController(animated: true)
            }
        }
    }
    
    func deleteEmp()  {
        addEmpViewModel.deleteEmployee(id: id) { isDeleted in
            if isDeleted{
                self.navigationController?.popViewController(animated: true)
            }
        }
    }
    func fetchData(){
        addEmpViewModel.fetchEmployee(id: id) { emp in
            self.imgEmp.image = UIImage(data: emp?.profilePicture ?? Data())
            self.txtName.text = emp?.name
            self.txtEmail.text = emp?.email
        }
    }
    @IBAction func btnSaveAction(_ sender: Any) {
        createEmp()
    }
    @IBAction func btnUpdateAction(_ sender: Any) {
        updateEmp()
    }
    @IBAction func btnDeleteAction(_ sender: Any) {
        deleteEmp()
    }
    // MARK: Image picker delegate
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        
        let img = info[.originalImage] as? UIImage
        self.imgEmp.image = img

        dismiss(animated: true, completion: nil)
    }

}
