//
//  CourseInfoViewController.swift
//  CSE438 Final Project
//
//  Created by 王梓辰 on 7/28/20.
//  Copyright © 2020 Michael Zhao. All rights reserved.
//

import Foundation
import UIKit
import FirebaseDatabase
import Charts

class CourseInfoViewController: UIViewController {
    @IBOutlet weak var courseName: UILabel!
    @IBOutlet weak var courseDescription: UITextView!
    @IBOutlet weak var instructor: UILabel!
    @IBOutlet weak var schedule: UILabel!
    @IBOutlet weak var credit: UILabel!
    @IBOutlet weak var location: UILabel!
    @IBOutlet weak var infoView: UIView!
    @IBOutlet weak var seats: UILabel!
    
    var courseId:String?
    var name:String?
    var credits:String?
    var courseDes:String?
    var theSections:[Section] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        if let name_ = name{
            courseName.text = name_
        }
        credit.text = credits
        courseDescription.text = courseDes
        //print(courseId!)
        getSection()
        let items = ["1","2","3"]
        let customSC = UISegmentedControl(items: items)
        customSC.selectedSegmentIndex = 0
        customSC.frame = CGRect(x: 27, y: 10, width: 320, height: 30)
        infoView.addSubview(customSC)
        print(theSections)
    }
    
    func getSection(){
        if let courId = courseId{
            print(courId)
            let ref = Database.database().reference().child("sections").child(courId)
            theSections = []
            ref.observeSingleEvent(of: .value, with: { (snapshot) in
              let value = snapshot.value as? NSDictionary
              if(value==nil){
                  print("no result")
                  return
              }
              for section in value!{
                  let id = section.key as! Int
                  let dic = section.value as! NSDictionary
                  let day = dic["day"] as! String
                  let instructor = dic["instructor"] as! String
                  let location = dic["location"] as! String
                  let seats = dic["seats"] as! Int
                  let time = dic["time"] as! String
                  let aSection = Section(id: id, day: day, instructor: instructor, location: location, seats: seats, time: time)
                  self.theSections.append(aSection)
              }
              }) { (error) in
                print(error.localizedDescription)
            }
        }
    }

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
