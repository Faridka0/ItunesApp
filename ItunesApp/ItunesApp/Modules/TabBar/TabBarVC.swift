//  
//  TabBarVC.swift
//  ItunesApp
//
//  Created by Farid Guliyev on 02.02.2021.
//

import UIKit
import RxSwift
import RxCocoa

final class TabBarVC: UITabBarController {

    //MARK: - Properties
    var viewModel: ITabBarViewModel!
    let bag = DisposeBag()
    private let images: [String] = ["magnifyingglass.circle", "clock"]

    
    //MARK: - Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        configure()
    }
    
    
    private func configure() {
        if let count = self.tabBar.items?.count {
            for i in 0..<count {
                self.tabBar.items?[i].image = UIImage(systemName: images[i])
            }
        }
    }
}


