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
        bindTableView()
    }
    
    func bindTableView() {
        viewModel.output.history
            .asObservable()
            .bind(to: mainView.tableView.rx.items(cellIdentifier: HistoryTVC.cellID, cellType: HistoryTVC.self)) { _, element, cell in
                cell.configure(text: element.text)
            }
            .disposed(by: bag)
        
        mainView.tableView.rx.itemSelected.bind { [unowned self] indexPath in
            guard let item = self.viewModel.output.history.value[safe: indexPath.row] else { return }
            let newVC = SearchAssembly.module()
            newVC.viewModel.input.search.accept(item.text)
            newVC.viewModel.output.searchBarIsHidden.accept(true)
            self.present(newVC, animated: true)
        }.disposed(by: bag)
    }
    
}


