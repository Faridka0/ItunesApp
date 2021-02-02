//  
//  DetailView.swift
//  ItunesApp
//
//  Created by Farid Guliyev on 03.02.2021.
//

import UIKit
import RxSwift
import RxCocoa

class DetailView: MainView {

    //MARK: - Views
    
    
    
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
        backgroundColor = .white
        addSubviews()
    }
    
}


