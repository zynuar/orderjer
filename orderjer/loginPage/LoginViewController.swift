//
//  LoginViewController.swift
//  orderjer
//
//  Created by Izzaty on 20/09/2019.
//  Copyright © 2019 Izzaty. All rights reserved.
//

import UIKit
import NVActivityIndicatorView
import Firebase

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
        guard let username = usernameTextField.text else { return }
        guard let password = passwordTextField.text else { return }
        
       if (username == "" || password == ""){
            let alertController = UIAlertController(title: "Error", message: "All fields are required", preferredStyle: .alert)
            alertController.addAction(UIAlertAction(title: "Dismiss", style: .default))
            self.present(alertController, animated: true, completion: nil)
        } else {
            Auth.auth().signIn(withEmail: username, password: password) {
                [weak self] user, error in
                if error == nil && user != nil {
                    print("User Login!")
                    let size = CGSize(width: 30, height: 30)
                    self?.startAnimating(size, message: "Loading...", type: .pacman, fadeInAnimation: nil)
                    DispatchQueue.main.asyncAfter(deadline: DispatchTime.now() + 3) {
                        self?.stopAnimating(nil)
                        self?.performSegue(withIdentifier: "loginToSuccessModal", sender: self)
                    }
                } else {
                    let alertController = UIAlertController(title: "Error!", message: "Error \(error!.localizedDescription)", preferredStyle: .alert)
                    alertController.addAction(UIAlertAction(title: "Dismiss", style: .default))
                    self?.present(alertController, animated: true, completion: nil)
                }
            }
        }
       
       
    }

    @IBAction func cancelTapped(_ sender: UIButton) {
        dismiss(animated: true, completion: nil)
    }
}
