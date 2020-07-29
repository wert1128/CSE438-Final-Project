//
//  EditCommentViewController.swift
//  CSE438 Final Project
//
//  Created by 王梓辰 on 7/29/20.
//  Copyright © 2020 Michael Zhao. All rights reserved.
//

import Foundation
import UIKit
import FirebaseDatabase

class EditCommentViewController: UIViewController {
    
    
    @IBOutlet weak var content: UITextView!
    var courseId:String?
    var username:String = ""
    let ref = Database.database().reference(withPath: "comments")
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        username = UserDefaults.standard.string(forKey: "username")!
        print(username)
        print(courseId!)
    }
    @IBAction func publishAction(_ sender: Any) {
        var commentDict:[String:Any] = [:]
        commentDict.updateValue(0, forKey: "likes")
        commentDict.updateValue(0, forKey: "dislikes")
        commentDict.updateValue(username, forKey: "username")
        commentDict.updateValue(courseId!, forKey: "courseId")
        if content.text != nil && content.text != "" {
            commentDict.updateValue(content.text!, forKey: "content")
        }
        let identifier = UUID()
        let commentRef = ref.child("\(identifier)")
        commentRef.setValue(commentDict) {
          (error:Error?, ref:DatabaseReference) in
          if let error = error {
            print("Data except GPA could not be saved: \(error).")
          } else {
            print("Data except GPA saved successfully!")
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
