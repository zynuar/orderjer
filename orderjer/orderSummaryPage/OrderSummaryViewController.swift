//
//  OrderSummaryViewController.swift
//  orderjer
//
//  Created by Izzaty on 20/09/2019.
//  Copyright © 2019 Izzaty. All rights reserved.
//

import UIKit

class OrderSummaryViewController: UIViewController {
    
    @IBOutlet weak var shopNameLabel: UILabel!
    @IBOutlet weak var dismissButton: UIButton!
    @IBOutlet weak var proceedButton: UIButton!
    @IBOutlet weak var subtotalLabel: UILabel!
    @IBOutlet weak var serviceTaxLabel: UILabel!
    @IBOutlet weak var orderFeeLabel: UILabel!
    @IBOutlet weak var totalLabel: UILabel!
    
    var shopName = ""
    var mealsName = ""
    var totalPrice: Double = 0.00
    var total: Double = 0.00
    var orderFee: Double = 1.00
    var serviceTax: Double = 0.00
    var getMeals: [SelectedMeals] = []
    var getSelectedMealName = ""
    var getSelectedDrinkName = ""
    var quantity: Int = 1
    
    override func viewDidLoad() {
        super.viewDidLoad()
        proceedButton.layer.cornerRadius = 8
        self.shopNameLabel.text = shopName
        self.subtotalLabel.text = String(format: "RM %.2f", totalPrice)
        self.orderFeeLabel.text = String(format: "RM %.2f", orderFee)
        serviceTax = totalPrice * 0.06
        self.serviceTaxLabel.text = String(format: "RM %.2f", serviceTax)
        total = totalPrice + orderFee + serviceTax
        self.totalLabel.text = String(format: "RM %.2f", total)
        print("getSelectedMealName -> \(getSelectedMealName)")
        print("getSelectedDrinkName -> \(getSelectedDrinkName)")
        getMeals = createArray()
    }
    
    private func createArray() -> [SelectedMeals] {
        var tempMeals: [SelectedMeals] = []
        let arrayOf  = SelectedMeals(selectedMealName: mealsName, selectedOptions: getSelectedMealName, selectedDrinks: getSelectedDrinkName, selectedMealPrice: total, selectedMealQuantity: quantity)
        tempMeals.append(arrayOf)
        let defaults = UserDefaults.standard
        defaults.set(mealsName, forKey: "name")
        defaults.set(quantity, forKey: "quantity")
        defaults.set(getSelectedMealName, forKey: "mealName")
        defaults.set(getSelectedDrinkName, forKey: "drinkName")
        defaults.set(total, forKey: "totalPrice")
        return tempMeals
    }
    
    @IBAction func proceedButton(_ sender: UIButton) {
//        orderToLoginReg
        self.performSegue(withIdentifier: "orderToLoginReg", sender: nil)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "orderToLoginReg" {
            if let destination = segue.destination as? LoginViewController {
                destination.getOrder = getMeals
            }
        }
    }
    
    
    @IBAction func dismissTapped(_ sender: UIButton) {
        dismiss(animated: true, completion: nil)
    }
}

extension OrderSummaryViewController: UITableViewDelegate, UITableViewDataSource {
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return getMeals.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let meal = getMeals[indexPath.row]
        let cell = tableView.dequeueReusableCell(withIdentifier: "OrderSummaryTableViewCell") as! OrderSummaryTableViewCell
        cell.layer.cornerRadius = 16.0
        cell.selectedMealNameLabel.text = meal.selectedMealName
        cell.selectedOptionLabel.text = meal.selectedOptions
        cell.selectedDrinkLabel.text = meal.selectedDrinks
        cell.selectedMealPrice.text = "\(String(format: "RM %.2f", totalPrice))"
        print("from tablez\(String(format: "RM %.2f", totalPrice))")
        cell.selectedMealQuantity.text = "\(meal.selectedMealQuantity)"
        return cell
    }
}

