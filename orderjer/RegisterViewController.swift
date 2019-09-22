//
//  RegisterViewController.swift
//  orderjer
//
//  Created by PPAS RATU SIX on 21/09/2019.
//  Copyright © 2019 Izzaty. All rights reserved.
//

import UIKit

class RegisterViewController: UIViewController {

    
    @IBOutlet weak var usernameTextField: UITextField!{
        didSet{
            usernameTextField.setIcon(UIImage(named: "profile")!)
            usernameTextField.layer.cornerRadius = 8.0
        }
    }
    
    @IBOutlet weak var passwordTextField: UITextField!{
        didSet{
            passwordTextField.setIcon(UIImage(named: "lock")!)
            passwordTextField.layer.cornerRadius = 8.0
        }
    }
    @IBOutlet weak var hpNoTextField: UITextField!{
        didSet{
            hpNoTextField.setIcon(UIImage(named: "smartphone-call")!)
            hpNoTextField.layer.cornerRadius = 8.0
        }
    }
    
    @IBOutlet weak var confirmPassword: UITextField!{
        didSet{
            confirmPassword.setIcon(UIImage(named: "lock")!)
            confirmPassword.layer.cornerRadius = 8.0
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }

    @IBAction func cancelTapped(_ sender: UIButton) {
        dismiss(animated: true, completion: nil)
    }
    
}
