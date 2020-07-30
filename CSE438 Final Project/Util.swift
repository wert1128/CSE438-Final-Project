//
//  Util.swift
//  CSE438 Final Project
//
//  Created by Mike Liu on 7/29/20.
//  Copyright © 2020 Michael Zhao. All rights reserved.
//

import Foundation
import FirebaseAuth
import FirebaseDatabase

class Util {
    let defaults = UserDefaults.standard
    func getCurrentName() {
        let userID = Auth.auth().currentUser?.uid
        let ref = Database.database().reference().child("users").child(userID!)
        ref.observeSingleEvent(of: .value, with: { (snapshot) in
          // Get user value
            let value = snapshot.value as? NSDictionary
            if(value==nil){
                return
            }
            let name = value!["realname"] as! String
            self.defaults.setValue(name, forKey: "name")
//            for dep in value!{
//                let id = dep.key as! String
//                let dic = dep.value as! NSDictionary
//                let name = dic["name"] as! String
//                let dep = department(id: id, name: name)
//                self.departments.append(dep)
//
//            }
//            self.departments.sort(by: { $0.name < $1.name })
//            self.departmentCollectionView.reloadData()
        
          // ...
          }) { (error) in
            
            print(error.localizedDescription)
        }
    }
}
