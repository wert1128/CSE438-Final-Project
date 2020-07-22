//
//  ViewController.swift
//  CSE438 Final Project
//
//  Created by Michael Zhao on 7/22/20.
//  Copyright © 2020 Michael Zhao. All rights reserved.
//

import UIKit

class LogInViewController: UIViewController {

    @IBOutlet weak var optionButton: UIButton!
    @IBOutlet var options: [UIButton]!
    @IBOutlet weak var submitButton: UIButton!
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    @IBAction func optionSelected(_ sender: UIButton) {
        guard let title = sender.titleLabel?.text else{
            for button in options{
                button.isHidden = true
            }
            return
        }
        if(title=="Student Log In"||title == "Professor Log In"){
            submitButton.setTitle("Log In", for: .normal)
        }else{
            submitButton.setTitle("Sign Up", for: .normal)
        }
        optionButton.setTitle(title, for: .normal)
        for button in options{
            button.isHidden = true
        }
    }
    
    @IBAction func seeOptions(_ sender: Any) {
        for button in options{
            button.isHidden = !button.isHidden
        }
    }
    
    

}

