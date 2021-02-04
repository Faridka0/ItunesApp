//  
//  HistoryView.swift
//  ItunesApp
//
//  Created by Farid Guliyev on 02.02.2021.
//

import UIKit
import RxSwift
import RxCocoa

class HistoryView: MainView {

    //MARK: - Views
    let tableView: UITableView = {
        let tb = UITableView(frame: .zero, style: .grouped)
        tb.backgroundColor = .clear
        tb.register(HistoryTVC.self, forCellReuseIdentifier: HistoryTVC.cellID)
        return tb
    }()
    
    
    //MARK: - Init
    required init() {
        super.init()
        fill()
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    //MARK: - Fill view
    private func fill() {
        addSubview(tableView)
        
        tableView.snp.makeConstraints { (make) in
            make.leading.trailing.equalToSuperview()
            make.top.bottom.equalToSuperview().inset(16)
        }
    }
    
}


