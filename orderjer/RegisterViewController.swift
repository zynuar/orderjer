//
//  RegisterViewController.swift
//  orderjer
//
//  Created by PPAS RATU SIX on 21/09/2019.
//  Copyright © 2019 Izzaty. All rights reserved.
//

import UIKit
import Firebase
import NVActivityIndicatorView

class RegisterViewController: UIViewController, NVActivityIndicatorViewable {

    var handle: AuthStateDidChangeListenerHandle?
    
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


    @IBAction func registerButton(_ sender: UIButton) {
        guard let username = usernameTextField.text else { return }
        guard let password = passwordTextField.text else { return }
        guard let confirmPassword = confirmPassword.text else { return }
        guard let mobileHpNo = hpNoTextField.text else { return }
        
        if (password != confirmPassword){
            let alertController = UIAlertController(title: "Error", message: "Password mismatch", preferredStyle: .alert)
            alertController.addAction(UIAlertAction(title: "Dissmiss", style: .default))
            self.present(alertController, animated: true, completion: nil)
        } else if (username == "" || password == "" || confirmPassword == "" || mobileHpNo == "" ){
            let alertController = UIAlertController(title: "Error", message: "All fields are required", preferredStyle: .alert)
            alertController.addAction(UIAlertAction(title: "Dissmiss", style: .default))
            self.present(alertController, animated: true, completion: nil)
        } else {
            Auth.auth().createUser(withEmail: username, password: confirmPassword) {
                authResult, error in
                if error == nil && authResult != nil {
                    print("User created!")
                    let size = CGSize(width: 30, height: 30)
                    self.startAnimating(size, message: "Loading...", type: .pacman, fadeInAnimation: nil)
                    DispatchQueue.main.asyncAfter(deadline: DispatchTime.now() + 3) {
                        self.stopAnimating(nil)
                        self.performSegue(withIdentifier: "registerToSuccessModal", sender: self)
                    }
                } else {
                    let alertController = UIAlertController(title: "Error!", message: "Error \(error!.localizedDescription)", preferredStyle: .alert)
                    alertController.addAction(UIAlertAction(title: "Dismiss", style: .default))
                    self.present(alertController, animated: true, completion: nil)
                }
            }
        }
       
    }
    
    @IBAction func cancelTapped(_ sender: UIButton) {
        dismiss(animated: true, completion: nil)
    }
    
}
