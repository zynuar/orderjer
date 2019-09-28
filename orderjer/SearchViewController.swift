//
//  SearchViewController.swift
//  orderjer
//
//  Created by Izzaty on 26/09/2019.
//  Copyright © 2019 Izzaty. All rights reserved.
//

import UIKit

class SearchViewController: UIViewController, UITableViewDataSource {

    @IBOutlet weak var searchBarTextField: UITextField!
    @IBOutlet weak var tableViewList: UITableView!
    
    var shopsArray: [Shop] = Array()
    var searchArray: [Shop] = Array()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let shop1 = Shop(shopName: "mcd", shopLocation: "Damansara")
        let shop2 = Shop(shopName: "kfc", shopLocation: "Kuala Lumpur")
        let shop3 = Shop(shopName: "tealive", shopLocation: "Petaling Jaya")
        
        shopsArray.append(shop1)
        shopsArray.append(shop2)
        shopsArray.append(shop3)
        
        for str in shopsArray {
            searchArray.append(str)
        }
        
        tableViewList.dataSource = self
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return searchArray.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        var cell = tableView.dequeueReusableCell(withIdentifier: "searchListCell")
        
        if cell == nil {
            cell = UITableViewCell(style: .default, reuseIdentifier: "searchListCell")
        }

        return cell!
    }
    
}
