//
//  File.swift
//  CSE438 Final Project
//
//  Created by Michael Zhao on 7/22/20.
//  Copyright © 2020 Michael Zhao. All rights reserved.
//

import Foundation
import UIKit

class SearchViewController: UIViewController,UICollectionViewDelegate,UICollectionViewDataSource {
    
    @IBOutlet weak var departmentCollectionView: UICollectionView!
    var departments:[department]=[]
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return departments.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "Cell", for: indexPath) as! departmentCell
        return cell
    }
    


    override func viewDidLoad() {
        super.viewDidLoad()
        departmentCollectionView.delegate=self
        departmentCollectionView.delegate=self
        departmentCollectionView.register(departmentCell.self, forCellWithReuseIdentifier: "Cell")
        departmentCollectionView.isUserInteractionEnabled = true
        getDepartments(school:"Arts&Sci")
        // Do any additional setup after loading the view.
        departmentCollectionView.reloadData()
    }
    
    func getDepartments(school:String){
        //yet to be implemented
        //get from database the lists of departments given a specific school, and populate them into the departments array
    }
    
    

}
