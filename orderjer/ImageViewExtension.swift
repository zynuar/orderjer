//
//  ImageViewExtension.swift
//  orderjer
//
//  Created by Izzaty on 18/09/2019.
//  Copyright © 2019 Izzaty. All rights reserved.
//

import UIKit

extension UIImageView {
    public func roundCorners(_ corners: UIRectCorner, radius: CGFloat){
        let maskPath = UIBezierPath(roundedRect: bounds, byRoundingCorners: corners, cornerRadii: CGSize(width: radius, height: radius))
        let shape = CAShapeLayer()
        shape.path = maskPath.cgPath
        layer.mask = shape
    }
}
