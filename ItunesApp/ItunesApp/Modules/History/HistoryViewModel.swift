//  
//  HistoryViewModel.swift
//  ItunesApp
//
//  Created by Farid Guliyev on 02.02.2021.
//

import UIKit
import RxSwift
import RxCocoa

struct HistoryViewModelInput {
    
    
}

struct HistoryViewModelOutput {
    
    
}

protocol IHistoryViewModel {
    
    var input: HistoryViewModelInput { get }
    var output: HistoryViewModelOutput { get }
    
}

class HistoryViewModel: IHistoryViewModel {
    
    //MARK: - Properties
//    @LazyInjected
//    private var service: IServiceService
    
    private let bag = DisposeBag()
    let input: HistoryViewModelInput
    let output: HistoryViewModelOutput
    let isLoading: BehaviorRelay<Bool> = BehaviorRelay(value: false)
    
    //MARK: - For input
    
    
    //MARK: - For output
    
    
    //MARK: - Init
    init() {
        input = HistoryViewModelInput()
        output = HistoryViewModelOutput()
    }
    
}
