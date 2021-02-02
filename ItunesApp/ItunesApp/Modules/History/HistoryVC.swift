//  
//  HistoryVC.swift
//  ItunesApp
//
//  Created by Farid Guliyev on 02.02.2021.
//

import UIKit
import RxSwift
import RxCocoa

final class HistoryVC: ViewController<HistoryView> {

    //MARK: - Properties
    let viewModel: IHistoryViewModel
    let bag = DisposeBag()
    
    
    //MARK: - Init
    required init(viewModel: IHistoryViewModel) {
        self.viewModel = viewModel
        super.init()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    //MARK: - Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        configure()
        binding()
    }
    
    //MARK: - Configure UI
    func configure() {
        
    }
    
    
    //MARK: - Binding
    func binding() {
        
    }
    
}


