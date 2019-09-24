//
//  OrderSummaryViewController.swift
//  orderjer
//
//  Created by Izzaty on 20/09/2019.
//  Copyright © 2019 Izzaty. All rights reserved.
//

import UIKit

class OrderSummaryViewController: UIViewController {
    
    @IBOutlet weak var dismissButton: UIButton!
    @IBOutlet weak var proceedButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        proceedButton.layer.cornerRadius = 8
    }
    
    @IBAction func dismissTapped(_ sender: UIButton) {
        dismiss(animated: true, completion: nil)
    }
    
}
