//  
//  SearchVC.swift
//  ItunesApp
//
//  Created by Farid Guliyev on 02.02.2021.
//

import UIKit
import RxSwift
import RxCocoa
import RxDataSources

final class SearchVC: ViewController<SearchView> {

    //MARK: - Properties
    let viewModel: ISearchViewModel
    let bag = DisposeBag()
    
    
    //MARK: - Init
    required init(viewModel: ISearchViewModel) {
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
        bindSearchBar()
        bindCollectionView()
    }
    
    func bindSearchBar() {
        mainView.searchBar.rx.text
            .skip(1)
            .debounce(.seconds(2), scheduler: MainScheduler.instance)
            .distinctUntilChanged()
            .map { result -> String? in
                if result?.trimmingCharacters(in: .whitespacesAndNewlines) == "" {
                    return nil
                }
                return result
            }
            .bind(to: viewModel.input.search)
            .disposed(by: bag)
    }
    
    func bindCollectionView() {
        let dataSource = RxCollectionViewSectionedReloadDataSource<ContentSection> { (ds, cv, indexPath, item) -> UICollectionViewCell in
            guard let cell = cv.dequeueReusableCell(withReuseIdentifier: ContentCVC.cellID, for: indexPath) as? ContentCVC else {
                return UICollectionViewCell()
            }
            cell.configure(model: item)
            return cell
        }
        
        viewModel.output.content.asObservable()
            .map { rows -> [ContentSection] in
                let section = ContentSection(header: "", items: rows)
                return [section]
            }
            .bind(to: mainView.collectionView.rx.items(dataSource: dataSource))
            .disposed(by: bag)
    }
    
}


