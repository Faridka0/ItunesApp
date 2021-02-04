//  
//  SearchViewModel.swift
//  ItunesApp
//
//  Created by Farid Guliyev on 02.02.2021.
//

import UIKit
import RxSwift
import RxCocoa

struct SearchViewModelInput {
    let search: BehaviorRelay<String?>
    
}

struct SearchViewModelOutput {
    
    let content: BehaviorRelay<[Content]>
    let searchBarIsHidden: BehaviorRelay<Bool>
    
}

protocol ISearchViewModel {
    
    var input: SearchViewModelInput { get }
    var output: SearchViewModelOutput { get }
    
    func saveHistory(_ query: String?)
    
}

class SearchViewModel: ISearchViewModel {
    
    //MARK: - Properties
    @LazyInjected
    private var service: IAPI
    
    @LazyInjected
    private var realmService: IRealmService
    
    private let bag = DisposeBag()
    let input: SearchViewModelInput
    let output: SearchViewModelOutput
    let isLoading: BehaviorRelay<Bool> = BehaviorRelay(value: false)
    
    //MARK: - For input
    private let search: BehaviorRelay<String?> = BehaviorRelay(value: nil)
    
    //MARK: - For output
    private let content: BehaviorRelay<[Content]> = BehaviorRelay(value: [])
    private let searchBarIsHidden: BehaviorRelay<Bool> = BehaviorRelay(value: false)
    
    //MARK: - Init
    init() {
        input = SearchViewModelInput(search: search)
        output = SearchViewModelOutput(content: content, searchBarIsHidden: searchBarIsHidden)
        
        search.asObservable()
            .bind(to: getContentBinder())
            .disposed(by: bag)
    }
    
    func getContentBinder() -> Binder<String?> {
        Binder(self) { (vm: SearchViewModel, query: String?) in
            vm.service
                .search(query)
                .asObservable()
                .map({ result -> [Content] in
                    return result?.results?.compactMap({ $0.map() }).sorted(by: { $0.title > $1.title }) ?? []
                })
                .bind(to: vm.content)
                .disposed(by: vm.bag)
        }
    }
    
    func saveHistory(_ query: String?) {
        guard let query = query else { return }
        let obj = HistoryRM(text: query)
        realmService.save(obj)
    }
    
}
