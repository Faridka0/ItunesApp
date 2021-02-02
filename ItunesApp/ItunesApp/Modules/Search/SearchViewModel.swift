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
    
}

protocol ISearchViewModel {
    
    var input: SearchViewModelInput { get }
    var output: SearchViewModelOutput { get }
    
}

class SearchViewModel: ISearchViewModel {
    
    //MARK: - Properties
    @LazyInjected
    private var service: IAPI
    
    private let bag = DisposeBag()
    let input: SearchViewModelInput
    let output: SearchViewModelOutput
    let isLoading: BehaviorRelay<Bool> = BehaviorRelay(value: false)
    
    //MARK: - For input
    private let search: BehaviorRelay<String?> = BehaviorRelay(value: nil)
    
    //MARK: - For output
    private let content: BehaviorRelay<[Content]> = BehaviorRelay(value: [])
    
    //MARK: - Init
    init() {
        input = SearchViewModelInput(search: search)
        output = SearchViewModelOutput(content: content)
        
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
                    return result?.results?.compactMap({ $0.map() }) ?? []
                })
                .bind(to: vm.content)
                .disposed(by: vm.bag)
        }
    }
    
}
