//
//  CommentsViewController.swift
//  CSE438 Final Project
//
//  Created by 王梓辰 on 7/29/20.
//  Copyright © 2020 Michael Zhao. All rights reserved.
//

import Foundation
import UIKit
import FirebaseDatabase

class CommentsViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {
    
    @IBOutlet weak var tableView: UITableView!
    
    var courseId:String?
    var theComments:[Comment] = []
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return theComments.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let theCell = tableView.dequeueReusableCell(withIdentifier: "theCommentCell", for: indexPath) as! CommentsTableViewCell
        theCell.theComment = theComments[indexPath.row]
        theCell.username.text = theComments[indexPath.row].username
        theCell.content.text = theComments[indexPath.row].content
        theCell.likes.text = "\(theComments[indexPath.row].likes)"
        theCell.dislikes.text = "\(theComments[indexPath.row].dislikes)"
        return theCell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 147
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        tableView.dataSource = self
        tableView.delegate = self
        fetchComments()
    }
    
    @IBAction func writeCommentAction(_ sender: Any) {
        
    }
    
    func writeComment(){
        
    }
    
    func fetchComments(){
        if let courId = courseId{
            let ref = Database.database().reference().child("comments")
            theComments = []
            ref.observeSingleEvent(of: .value, with: { (snapshot) in
                let value = snapshot.value as? NSDictionary
                if(value==nil){
                    return
                }
                for comment in value!{
                    let id = comment.key as! String
                    let dic = comment.value as! NSDictionary
                    let thecourseId = dic["courseId"] as! String
                    if thecourseId == courId{
                        let content = dic["content"] as! String
                        let username = dic["username"] as! String
                        let likes = dic["likes"] as! Int
                        let dislikes = dic["dislikes"] as! Int
                        let aComment = Comment(id: id, content: content, courseId: thecourseId, username: username, likes: likes, dislikes: dislikes)
                        self.theComments.append(aComment)
                    }
                }
                print(self.theComments)
                self.tableView.reloadData()
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


