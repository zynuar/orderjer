//
//  SuccessViewController.swift
//  orderjer
//
//  Created by PPAS RATU SIX on 21/09/2019.
//  Copyright © 2019 Izzaty. All rights reserved.
//

import UIKit

class SuccessViewController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    
    @IBAction func okButton(_ sender: UIButton) {
        performSegue(withIdentifier: "unwindToHome", sender: nil)
    }
}
