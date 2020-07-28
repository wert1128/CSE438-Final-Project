//
//  ResultViewController.swift
//  CSE438 Final Project
//
//  Created by Michael Zhao on 7/28/20.
//  Copyright © 2020 Michael Zhao. All rights reserved.
//

import Foundation
import UIKit
import FirebaseDatabase

class ClassTableViewCell: UITableViewCell{
    var myCourse:ResultCourse!
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var unitLabel: UILabel!
    @IBOutlet weak var descriptionLabel: UILabel!
    func update(){
        nameLabel.text=myCourse.id+" "+myCourse.name
        unitLabel.text="Credit: "+String(myCourse.credits)
        descriptionLabel.text="Description: "+myCourse.description
    }
}
class ResultViewController: UIViewController,UITableViewDataSource, UITableViewDelegate{
    @IBOutlet weak var resultTable: UITableView!
    var departmentID:String?
    var results:[ResultCourse]=[]
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //resultTable.register(UITableViewCell.self, forCellReuseIdentifier: "classCell")
        resultTable.dataSource = self
        resultTable.delegate=self
        getCourses()
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return results.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = resultTable.dequeueReusableCell(withIdentifier: "classCell", for: indexPath) as! ClassTableViewCell
        cell.myCourse=results[indexPath.row]
        cell.update()
        return cell
    }
    
    func getCourses(){
        if let depID=departmentID{
            let ref = Database.database().reference().child("courses").child(depID)
            results=[]
            ref.observeSingleEvent(of: .value, with: { (snapshot) in
                let value = snapshot.value as? NSDictionary
                if(value==nil){
                    return
                }
                for course in value!{
                    let id = course.key as! String
                    let dic = course.value as! NSDictionary
                    let name = dic["name"] as! String
                    let credits = dic["unit"] as! Int
                    let description = dic["description"] as! String
                    let course = ResultCourse(id: id, name: name, credits: credits, description: description)
                    self.results.append(course)
                }
                self.resultTable.reloadData()
            
              // ...
              }) { (error) in
                
                print(error.localizedDescription)
            }
        }
        
        
    }
    
    
}
