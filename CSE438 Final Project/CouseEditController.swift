//
//  CouseEditController.swift
//  CSE438 Final Project
//
//  Created by Mike Liu on 7/28/20.
//  Copyright © 2020 Michael Zhao. All rights reserved.
//

import Foundation
import UIKit
import FirebaseDatabase
class CourseEditController: UIViewController {
    
    @IBOutlet weak var AText: UITextField!
    @IBOutlet weak var BText: UITextField!
    @IBOutlet weak var CText: UITextField!
    @IBOutlet weak var DText: UITextField!
    @IBOutlet weak var PText: UITextField!
    @IBOutlet weak var FText: UITextField!
    @IBOutlet weak var courseId: UITextField!
    @IBOutlet weak var avgGPAText: UITextField!
    
    let ref = Database.database().reference(withPath: "courseInfo")
    
    
    @IBAction func Submit(_ sender: Any) {
        var courseDict: [String: String] = [:]
        if (AText.text != nil && AText.text != "") {
            courseDict.updateValue(AText.text!, forKey: "A")
        }
        if (BText.text != nil && BText.text != "") {
            courseDict.updateValue(BText.text!, forKey: "B")
        }
        if (CText.text != nil && CText.text != "") {
            courseDict.updateValue(CText.text!, forKey: "C")
        }
        if (DText.text != nil && DText.text != "") {
            courseDict.updateValue(DText.text!, forKey: "D")
        }
        if (PText.text != nil && PText.text != "") {
            courseDict.updateValue(PText.text!, forKey: "Pass")
        }
        if (avgGPAText.text != nil && avgGPAText.text != "") {
            courseDict.updateValue(avgGPAText.text!, forKey: "avgGPA")
        }
        print(courseDict)
        let childRef = ref.child(self.courseId.text!)
        childRef.setValue(courseDict) {
          (error:Error?, ref:DatabaseReference) in
          if let error = error {
            print("Data could not be saved: \(error).")
          } else {
            print("Data saved successfully!")
          }
        }
    }
    
}
