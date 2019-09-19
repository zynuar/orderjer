//
//  MealViewController.swift
//  orderjer
//
//  Created by Izzaty on 19/09/2019.
//  Copyright © 2019 Izzaty. All rights reserved.
//

import UIKit

class MealViewController: UIViewController {

    @IBOutlet weak var imageBackground: UIImageView!
    @IBOutlet weak var singleMealImageView: UIImageView!
    @IBOutlet weak var placeOrderButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        imageBackground.roundCorners(.topLeft, radius: 50)
        placeOrderButton.layer.cornerRadius = 16
        placeOrderButton.layer.borderWidth = 3
        placeOrderButton.layer.borderColor = UIColor.white.cgColor
    }
    
}
