//
//  DetailTVC.swift
//  ItunesApp
//
//  Created by Farid Guliyev on 04.02.2021.
//

import UIKit

class DetailTVC: UITableViewCell {
    
    static let cellID: String = "DetailTVC"

    //MARK: - IBOutlets
    @IBOutlet weak var titleLabel: UILabel!
    
    //MARK: - Configure
    func configure(_ title: String) {
        titleLabel.text = title
    }
}
