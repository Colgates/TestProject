//
//  UIView + Extensions.swift
//  TestProjects
//
//  Created by Evgenii Kolgin on 24.05.2022.
//

import UIKit

extension UIView {
    func addSubviews(_ views: UIView...) {
        views.forEach { addSubview($0) }
    }
}

