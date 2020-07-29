//
//  CommentsTableViewCell.swift
//  CSE438 Final Project
//
//  Created by 王梓辰 on 7/29/20.
//  Copyright © 2020 Michael Zhao. All rights reserved.
//

import UIKit

class CommentsTableViewCell: UITableViewCell {

    @IBOutlet weak var username: UILabel!
    @IBOutlet weak var content: UITextView!
    @IBOutlet weak var likes: UILabel!
    @IBOutlet weak var dislikes: UILabel!
    @IBOutlet weak var likeButton: UIButton!
    @IBOutlet weak var dislikeButton: UIButton!
    
    var theComment:Comment?
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        username.text = theComment?.username
        content.text = theComment?.content
        likes.text = "\(String(describing: theComment?.likes))"
        dislikes.text = "\(String(describing: theComment?.dislikes))"
        
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    @IBAction func likeAction(_ sender: Any) {
        
    }
    
    
    @IBAction func dislikeAction(_ sender: Any) {
    }
    
}
