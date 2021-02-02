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
    
    
}

struct SearchViewModelOutput {
    
    
}

protocol ISearchViewModel {
    
    var input: SearchViewModelInput { get }
    var output: SearchViewModelOutput { get }
    
}

class SearchViewModel: ISearchViewModel {
    
    //MARK: - Properties
//    @LazyInjected
//    private var service: IServiceService
    
    private let bag = DisposeBag()
    let input: SearchViewModelInput
    let output: SearchViewModelOutput
    let isLoading: BehaviorRelay<Bool> = BehaviorRelay(value: false)
    
    //MARK: - For input
    
    
    //MARK: - For output
    
    
    //MARK: - Init
    init() {
        input = SearchViewModelInput()
        output = SearchViewModelOutput()
    }
    
}
