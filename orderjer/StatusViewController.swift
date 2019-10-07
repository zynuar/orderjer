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
       
        
        let mealPrice = defaults.double(forKey: "mealPrice")
        print(mealPrice)
        let drinkPrice = defaults.double(forKey: "drinkPrice")
        print(drinkPrice)
        let mealName = defaults.string(forKey: "mealName")
        print(mealName)
        let drinkName = defaults.string(forKey: "drinkName")
        
        let quantity = defaults.integer(forKey: "quantity")
        let name = defaults.string(forKey: "name")

    }
    
    

}
