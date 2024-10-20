//
//  UIView+Extention.swift
//  coreDataDemo
//
//  Created by Apple on 01/10/24.
//  Copyright © 2024 CodeCat15. All rights reserved.
//

import Foundation
import UIKit
extension UIView {
    func dropShadow(scale: Bool = true,cornerRadius : CGFloat = 10) {
        layer.masksToBounds = false
        layer.shadowColor = UIColor.black.cgColor
        layer.shadowOpacity = 0.3
        layer.shadowOffset = .zero
        layer.shadowRadius = 3
        layer.shouldRasterize = true
        layer.rasterizationScale = scale ? UIScreen.main.scale : 1
        layer.cornerRadius = cornerRadius
    }
    
    func  addTapGesture(action : @escaping ()->Void ){
            let tap = MyTapGestureRecognizer(target: self , action: #selector(self.handleTap(_:)))
            tap.action = action
            tap.numberOfTapsRequired = 1
            
            self.addGestureRecognizer(tap)
            self.isUserInteractionEnabled = true
            
        }

        @objc func handleTap(_ sender: MyTapGestureRecognizer) {
            sender.action!()
        }
}
class MyTapGestureRecognizer: UITapGestureRecognizer {
    var action : (()->Void)? = nil
}
// Helper to format date as per the day (ignoring time)
extension Date {
    func toDateString() -> String {
        let formatter = DateFormatter()
        formatter.dateFormat = "yyyy-MM-dd" // Use date format to group by day
        return formatter.string(from: self)
    }
}

extension String{
    func toDate() -> Date {
        
        let formatter = DateFormatter()
        formatter.dateFormat = "yyyy-MM-dd'T'HH:mm:ss.SSS'Z'"
        formatter.timeZone = TimeZone(abbreviation: "UTC") // Important for 'Z'
        formatter.locale = Locale(identifier: "en_US_POSIX")

        return formatter.date(from: self) ?? Date()
    }
}
