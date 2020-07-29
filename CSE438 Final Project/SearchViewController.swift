//
//  File.swift
//  CSE438 Final Project
//
//  Created by Michael Zhao on 7/22/20.
//  Copyright © 2020 Michael Zhao. All rights reserved.
//

import Foundation
import UIKit
import FirebaseDatabase

class SearchViewController: UIViewController,UICollectionViewDelegate,UICollectionViewDataSource{
    
    @IBOutlet weak var departmentCollectionView: UICollectionView!
    var departments:[department]=[]
    var selectedDepartment:String=""
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return departments.count
    }
    
    @IBAction func selectAS(_ sender: Any) {
        getDepartments(school: "A&S")
    }
    @IBAction func selectEN(_ sender: Any) {
        getDepartments(school: "EN")
    }
    @IBAction func selectBU(_ sender: Any) {
        getDepartments(school: "BU")
    }
    @IBAction func selectArt(_ sender: Any) {
        getDepartments(school: "Art")
    }
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "Cell", for: indexPath) as! departmentCell
        cell.department=departments[indexPath.row]
        cell.update()
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        selectedDepartment=departments[indexPath.row].id
        self.performSegue(withIdentifier: "toResultVC", sender: self)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
    
        if segue.identifier == "toResultVC" {
            let VC = segue.destination as? ResultViewController
            
            VC!.departmentID=selectedDepartment
        }
    }
    
    


    override func viewDidLoad() {
        super.viewDidLoad()
        departmentCollectionView.dataSource=self
        departmentCollectionView.delegate=self
        departmentCollectionView.register(departmentCell.self, forCellWithReuseIdentifier: "Cell")
        departmentCollectionView.isUserInteractionEnabled = true
        getDepartments(school:"A&S")
        // Do any additional setup after loading the view.
        
    }
    
    func getDepartments(school:String){
        //yet to be implemented
        //get from database the lists of departments given a specific school, and populate them into the departments array
        departments=[]
        let ref = Database.database().reference().child("schools").child(school)
        
        ref.observeSingleEvent(of: .value, with: { (snapshot) in
          // Get user value
            let value = snapshot.value as? NSDictionary
            if(value==nil){
                return
            }
            for dep in value!{
                let id = dep.key as! String
                let dic = dep.value as! NSDictionary
                let name = dic["name"] as! String
                let dep = department(id: id, name: name)
                self.departments.append(dep)
                
            }
            self.departments.sort(by: { $0.name < $1.name })
            self.departmentCollectionView.reloadData()
        
          // ...
          }) { (error) in
            
            print(error.localizedDescription)
        }
        
        
        
        /*var a = department(id: 0, name: "test1")
        var b = department(id: 0, name: "test2")
        var c = department(id: 0, name: "test3")
        var d = department(id: 0, name: "test4")
        departments.append(a)
        departments.append(b)
        departments.append(c)
        departments.append(d)*/
        
    }
    
    

}
