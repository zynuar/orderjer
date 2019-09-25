//
//  OrderSummaryTableViewCell.swift
//  orderjer
//
//  Created by Izzaty on 25/09/2019.
//  Copyright © 2019 Izzaty. All rights reserved.
//

import UIKit

class OrderSummaryTableViewCell: UITableViewCell {
    @IBOutlet weak var selectedMealNameLabel: UILabel!
    @IBOutlet weak var selectedOptionLabel: UILabel!
    @IBOutlet weak var selectedDrinkLabel: UILabel!
    @IBOutlet weak var selectedMealPrice: UILabel!
    @IBOutlet weak var selectedMealQuantity: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
