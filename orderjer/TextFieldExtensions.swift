//
//  TextFieldExtensions.swift
//  orderjer
//
//  Created by Izzaty on 17/09/2019.
//  Copyright © 2019 Izzaty. All rights reserved.
//

import UIKit

extension UITextField {
    func setIcon(_ image: UIImage) {
        let iconView = UIImageView(frame: CGRect(x: 10, y: 5, width: 20, height: 20))
        iconView.image = image
        
        let iconContainerView: UIView = UIView(frame: CGRect(x: 20, y: 0, width: 30, height: 30))
        iconContainerView.addSubview(iconView)
        
        leftView = iconContainerView
        leftViewMode = .always
    }
}
