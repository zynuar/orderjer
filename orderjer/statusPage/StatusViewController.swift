//
//  StatusViewController.swift
//  orderjer
//
//  Created by PPAS RATU SIX on 05/10/2019.
//  Copyright © 2019 Izzaty. All rights reserved.
//

import UIKit

class StatusViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        let defaults = UserDefaults.standard

        let totalPrice = defaults.double(forKey: "totalPrice")
        print(totalPrice)
        let mealName = defaults.string(forKey: "mealName")
        print(mealName!)
        let drinkName = defaults.string(forKey: "drinkName")
        print(drinkName!)
        let quantity = defaults.integer(forKey: "quantity")
        print(quantity)
        let name = defaults.string(forKey: "name")
        print(name!)

    }
    
    

}
