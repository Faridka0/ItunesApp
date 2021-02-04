//
//  HistoryTVC.swift
//  ItunesApp
//
//  Created by Farid Guliyev on 03.02.2021.
//

import UIKit

class HistoryTVC: UITableViewCell {
    
    static let cellID: String = "HistoryTVC"
    
    //MARK: - Views
    private let titleLabel: UILabel = {
        let label = UILabel()
        label.font = .systemFont(ofSize: 20, weight: .bold)
        label.textColor = .white
        label.textAlignment = .left
        return label
    }()
    
    //MARK: - Init
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        fill()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    //MARK: - Configure
    private func fill() {
        backgroundColor = .clear
        contentView.backgroundColor = .clear
        accessoryType = .disclosureIndicator
        selectionStyle = .none
        contentView.addSubview(titleLabel)
        
        titleLabel.snp.makeConstraints { (make) in
            make.edges.equalToSuperview().inset(20)
        }
    }
    
    func configure(text: String) {
        titleLabel.text = text
    }
}
