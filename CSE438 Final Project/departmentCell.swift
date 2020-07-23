//
//  departmentCell.swift
//  CSE438 Final Project
//
//  Created by Michael Zhao on 7/22/20.
//  Copyright © 2020 Michael Zhao. All rights reserved.
//

import Foundation
import UIKit

class departmentCell:UICollectionViewCell{
    
    var department:department!
    
    func update(){
        for subUIView in contentView.subviews as [UIView] { subUIView.removeFromSuperview() }
        //contentView.backgroundColor=UIColor.lightGray
        
        
        let label=UILabel(frame: CGRect(x: 0, y: 0, width: 130, height: 20))
        label.textColor=UIColor.systemBlue
        label.text=department.name
        label.font=UIFont(name: label.font.fontName, size: 15)
        label.textAlignment = NSTextAlignment.center
        contentView.addSubview(label)
        
        let heightConstraint = NSLayoutConstraint(item: label, attribute: NSLayoutConstraint.Attribute.height, relatedBy: NSLayoutConstraint.Relation.equal, toItem: contentView, attribute: NSLayoutConstraint.Attribute.height, multiplier: 1, constant: 0)
        let widthConstraint = NSLayoutConstraint(item: label, attribute: NSLayoutConstraint.Attribute.width, relatedBy: NSLayoutConstraint.Relation.equal, toItem: contentView, attribute: NSLayoutConstraint.Attribute.width, multiplier: 1, constant: 0)
        contentView.addConstraint(heightConstraint)
        contentView.addConstraint(widthConstraint)

    }
}
