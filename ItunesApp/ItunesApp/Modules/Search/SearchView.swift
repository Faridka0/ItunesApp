//  
//  SearchView.swift
//  ItunesApp
//
//  Created by Farid Guliyev on 02.02.2021.
//

import UIKit
import RxSwift
import RxCocoa

class SearchView: MainView {

    //MARK: - Views
    let searchBar: UISearchBar = {
        let sb = UISearchBar()
        sb.backgroundImage = UIImage()
        sb.tintColor = .white
        sb.barTintColor = .white
        (sb.value(forKey: "searchField") as? UITextField)?.textColor = .white
        return sb
    }()
    
    let collectionView: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        layout.minimumInteritemSpacing = 16
        layout.itemSize = CGSize(width: UIScreen.main.bounds.width, height: 200)
        let cv = UICollectionView(frame: .zero, collectionViewLayout: layout)
        cv.register(ContentCVC.self, forCellWithReuseIdentifier: ContentCVC.cellID)
        cv.backgroundColor = .clear
        return cv
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
        backgroundColor = .white
        addSubviews(searchBar, collectionView)
        
        searchBar.snp.makeConstraints { (make) in
            make.leading.trailing.equalToSuperview().inset(16)
            make.top.equalTo(self.snp.topMargin)
        }
        
        collectionView.snp.makeConstraints { (make) in
            make.top.equalTo(searchBar.snp.bottom).offset(16)
            make.leading.trailing.bottom.equalToSuperview()
        }
    }
    
}


