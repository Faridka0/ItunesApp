//
//  UIView+Ext.swift
//  ItunesApp
//
//  Created by Farid Guliyev on 26.01.2021.
//

import UIKit

extension UIView {
    func addSubviews(_ views: UIView...) {
        views.forEach({ addSubview($0) })
    }
}
