//  
//  DetailVC.swift
//  ItunesApp
//
//  Created by Farid Guliyev on 03.02.2021.
//

import UIKit
import RxSwift
import RxCocoa

final class DetailVC: ViewController<DetailView> {

    //MARK: - Properties
    let viewModel: IDetailViewModel
    let bag = DisposeBag()
    
    
    //MARK: - Init
    init(viewModel: IDetailViewModel) {
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
        viewModel.output.content
            .asObservable()
            .skip(1)
            .map({ $0 ?? [] })
            .bind(to: mainView.tableView.rx.items(cellIdentifier: DetailTVC.cellID, cellType: DetailTVC.self)) { index, element, cell in
                cell.configure(element.trackName)
            }.disposed(by: bag)
        
        viewModel.output.content
            .asObservable()
            .skip(1)
            .map({ $0?.first })
            .bind(to: mainView.configureBinder())
            .disposed(by: bag)
        
        
    }
}


