//
//  ViewController.swift
//  CSE438 Final Project
//
//  Created by Michael Zhao on 7/22/20.
//  Copyright © 2020 Michael Zhao. All rights reserved.
//

import UIKit
import FirebaseAuth
import FirebaseDatabase
class LogInViewController: UIViewController {

    @IBOutlet weak var optionButton: UIButton!
    @IBOutlet var options: [UIButton]!
    @IBOutlet weak var submitButton: UIButton!
    @IBOutlet weak var usernameTextField: UITextField!
    
    @IBOutlet weak var passwordTextField: UITextField!
    var option: String = "Student Log In"
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
        self.option = title
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
    
    
    @IBAction func buttonClicked(_ sender: UIButton) {
        let username = self.usernameTextField.text ?? ""
        let password = self.passwordTextField.text ?? ""
        if(option == "Student Log In") {
            Auth.auth().signIn(withEmail: username, password: password) { (authResult, error) in
                if(error != nil) {
                    print(error!)
                    return
                }
                let user = authResult?.user
                //print(user?.email)
                self.performSegue(withIdentifier: "signInToSearchVC", sender: nil)
            }
        } else if (option == "Professor Log In") {
            
        } else if(option == "Student Sign Up") {
            Auth.auth().createUser(withEmail: username, password: password) { authResult, error in
                if(error != nil) {
                    print(error!)
                    return
                }
                let user = authResult?.user
                let ref = Database.database().reference()
                //print("desc:" + ref.description())
                let usersReference = ref.child("users")
                let userId = user?.uid
                let newUserReference = usersReference.child(userId!)
                newUserReference.setValue(["username": self.usernameTextField.text!])
            }
            
        } else if(option == "Professor Sign Up") {
            
        } else {
            
        }
    }
    
}

