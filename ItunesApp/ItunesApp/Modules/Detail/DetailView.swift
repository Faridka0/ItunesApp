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
    private let albumImageView: UIImageView = {
        let imgv = UIImageView()
        imgv.contentMode = .scaleAspectFit
        imgv.layer.cornerRadius = 16
        return imgv
    }()
    
    private let albumTitleLabel: UILabel = {
       let label = UILabel()
        label.font = .systemFont(ofSize: 14, weight: .bold)
        label.textAlignment = .center
        label.numberOfLines = 0
        label.textColor = .white
        return label
    }()
    
    let tableView: UITableView = {
       let tb = UITableView()
        tb.register(UINib(nibName: DetailTVC.cellID, bundle: nil), forCellReuseIdentifier: DetailTVC.cellID)
        tb.backgroundColor = .clear
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
        backgroundColor = .white
        addSubviews(albumImageView, albumTitleLabel, tableView)
        
        albumImageView.snp.makeConstraints { (make) in
            make.width.equalToSuperview().multipliedBy(0.5).offset(-16)
            make.height.equalTo(albumImageView.snp.width)
            make.leading.top.equalToSuperview().inset(16)
        }
        
        albumTitleLabel.snp.makeConstraints { (make) in
            make.trailing.equalToSuperview().inset(16)
            make.leading.equalTo(albumImageView.snp.trailing).offset(16)
            make.centerY.equalTo(albumImageView)
        }
        
        tableView.snp.makeConstraints { (make) in
            make.leading.trailing.equalToSuperview()
            make.top.equalTo(albumImageView.snp.bottom).offset(16)
            make.bottom.equalToSuperview().inset(16)
        }
    }
    
    func configureBinder() -> Binder<Content?> {
        Binder(self) { (view, model: Content?) in
            view.albumImageView.sd_setImage(with: model?.imageURL)
            view.albumTitleLabel.text = model?.title
        }
    }
    
}


