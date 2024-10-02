//
//  EmployeeTVC.swift
//  coreDataDemo
//
//  Created by Apple on 01/10/24.
//  Copyright © 2024 CodeCat15. All rights reserved.
//

import UIKit

class EmployeeTVC: UITableViewCell {
    @IBOutlet weak var bgView: UIView!
    
    @IBOutlet weak var lblEmail: UILabel!
    @IBOutlet weak var lblName: UILabel!
    @IBOutlet weak var imgEmp: UIImageView!
    override func awakeFromNib() {
        super.awakeFromNib()
        bgView.dropShadow()
        imgEmp.layer.cornerRadius = 40
        self.selectionStyle = .none
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
 
    func setData(obj : Employee)  {
        lblName.text = obj.name
        lblEmail.text = obj.email
        imgEmp.image = UIImage(data: obj.profilePicture ?? Data())
    }
}
