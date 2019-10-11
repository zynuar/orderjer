//
//  StatusViewController.swift
//  orderjer
//
//  Created by PPAS RATU SIX on 05/10/2019.
//  Copyright © 2019 Izzaty. All rights reserved.
//

import UIKit
import Firebase

class StatusViewController: UIViewController {

    @IBOutlet weak var statusTableView: UITableView!
    var getOrder: [SelectedMeals] = []
    var getStatus = ""
    override func viewDidLoad() {
        super.viewDidLoad()
        //get from server
        var ref: DatabaseReference!
        ref = Database.database().reference()
        let mealsRef = ref.child("order").child("customer1")
        
        mealsRef.observe(.value, with: { (snapshot) in
            self.getOrder = []
            let postDict = snapshot.value as? [String: Any]
            let name = postDict!["name"] as! String
            let mealName = postDict!["mealName"] as! String
            let drinkName = postDict!["drinkName"] as! String
            let mealPrice = postDict!["mealPrice"] as! Double
            let quantity = postDict!["quantity"] as! Int
            let orderStatus = postDict!["orderStatus"] as! String
            print("\(name), \(mealName), \(drinkName), \(mealPrice), \(quantity)")
            self.getOrder.append(SelectedMeals(selectedMealName: name, selectedOptions: mealName, selectedDrinks: drinkName, selectedMealPrice: mealPrice, selectedMealQuantity: quantity))
            self.getStatus = orderStatus
            print(self.getOrder.count)
            self.statusTableView.reloadData()
        })
    }
}

extension StatusViewController: UITableViewDataSource, UITableViewDelegate {
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return getOrder.count
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "StatusTableViewCell", for: indexPath) as! StatusTableViewCell
        let meal = getOrder[indexPath.row]
        print(meal.selectedMealPrice)
        if getStatus == "Waiting" {
            cell.statusImageView.image = UIImage(named: "clock")
        } else {
            cell.statusImageView.image = UIImage(named: "checked")
        }
        cell.mealNameLabel.text = meal.selectedMealName
        cell.mealOptLabel.text = meal.selectedOptions
        cell.drinkLabel.text = meal.selectedDrinks
        cell.mealPrice.text = "\(String(format: "RM %.2f", meal.selectedMealPrice))"
        cell.mealQuantity.text = "\(meal.selectedMealQuantity) Pax"
        cell.statusLabel.text = getStatus
        return cell
    }


}

