//
//  ContentCVC.swift
//  ItunesApp
//
//  Created by Farid Guliyev on 03.02.2021.
//

import UIKit

class ContentCVC: UICollectionViewCell {
    
    static let cellID: String = "ContentCVC"
    
    let titleLabel: UILabel = {
        let label = UILabel()
        label.font = .systemFont(ofSize: 12, weight: .bold)
        label.textColor = .white
        label.numberOfLines = 0
        label.adjustsFontSizeToFitWidth = true
        label.textAlignment = .center
        return label
    }()
    
    let artistNameLabel: UILabel = {
        let label = UILabel()
        label.textColor = .white
        label.textAlignment = .center
        label.numberOfLines = 0
        label.adjustsFontSizeToFitWidth = true
        label.font = .systemFont(ofSize: 11)
        return label
    }()
    
    let contentImageView: UIImageView = {
       let imgv = UIImageView()
        imgv.contentMode = .scaleAspectFit
        imgv.clipsToBounds = true
        imgv.layer.cornerRadius = 16
        return imgv
    }()
    
    let containerView: UIView = {
       let view = UIView()
        view.backgroundColor = UIColor(hexString: "352851")
        view.layer.cornerRadius = 20
        return view
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        fill()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func prepareForReuse() {
        super.prepareForReuse()
        contentImageView.image = nil
    }
    
    private func fill() {
        contentView.backgroundColor = .clear
        contentView.addSubview(containerView)
        containerView.addSubviews(titleLabel, artistNameLabel, contentImageView)
        
        containerView.snp.makeConstraints { (make) in
            make.leading.trailing.equalToSuperview().inset(16)
            make.top.bottom.equalToSuperview()
        }
        
        
        titleLabel.snp.makeConstraints { (make) in
            make.top.leading.trailing.equalToSuperview().inset(16)
        }
        
        artistNameLabel.snp.makeConstraints { (make) in
            make.leading.trailing.equalTo(titleLabel)
            make.top.equalTo(titleLabel.snp.bottom).offset(8)
        }
        
        contentImageView.snp.makeConstraints { (make) in
            make.top.equalTo(artistNameLabel.snp.bottom).offset(8)
            make.bottom.equalToSuperview().inset(16)
            make.width.equalTo(contentImageView.snp.height)
            make.centerX.equalToSuperview()
        }
    }
    
    func configure(model: Content) {
        titleLabel.text = model.title
        artistNameLabel.text = model.artistName
        contentImageView.sd_setImage(with: model.imageURL)
    }
}
