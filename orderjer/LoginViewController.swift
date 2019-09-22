//
//  LoginViewController.swift
//  orderjer
//
//  Created by Izzaty on 20/09/2019.
//  Copyright © 2019 Izzaty. All rights reserved.
//

import UIKit
import NVActivityIndicatorView

class LoginViewController: UIViewController, NVActivityIndicatorViewable {

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
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }

    @IBAction func LoadingToSuccess(_ sender: Any) {
        print("lalu tak")
        dismiss(animated: true, completion: nil)
        let size = CGSize(width: 30, height: 30)
        startAnimating(size, message: "Loading...", type: .pacman, fadeInAnimation: nil)
        DispatchQueue.main.asyncAfter(deadline: DispatchTime.now() + 3) {
            self.stopAnimating(nil)
            let modalVC = SuccessViewController()
            modalVC.definesPresentationContext = true
            modalVC.modalPresentationStyle = .overCurrentContext
            modalVC.modalTransitionStyle = .crossDissolve
            self.present(modalVC, animated: true, completion: nil)
        }

    }
    @IBAction func dismissTapped(_ sender: UIButton) {
        dismiss(animated: true, completion: nil)
    }
}
