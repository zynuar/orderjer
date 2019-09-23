//
//  SuccessViewController.swift
//  orderjer
//
//  Created by PPAS RATU SIX on 21/09/2019.
//  Copyright © 2019 Izzaty. All rights reserved.
//

import UIKit
import  NVActivityIndicatorView
class SuccessViewController: UIViewController, NVActivityIndicatorViewable{

    override func viewDidLoad() {
        
        super.viewDidLoad()
        DispatchQueue.main.asyncAfter(deadline: DispatchTime.now() + 3) {
            self.stopAnimating(nil)
        }
        // Do any additional setup after loading the view.
    }

    @IBAction func okTapped(_ sender: UIButton) {
        dismiss(animated: true, completion: nil)
    }
}
