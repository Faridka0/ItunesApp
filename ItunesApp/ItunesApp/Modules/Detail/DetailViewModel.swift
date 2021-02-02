//  
//  DetailViewModel.swift
//  ItunesApp
//
//  Created by Farid Guliyev on 03.02.2021.
//

import UIKit
import RxSwift
import RxCocoa

struct DetailViewModelInput {
    
    
}

struct DetailViewModelOutput {
    
    
}

protocol IDetailViewModel {
    
    var input: DetailViewModelInput { get }
    var output: DetailViewModelOutput { get }
    
}

class DetailViewModel: IDetailViewModel {
    
    //MARK: - Properties
//    @LazyInjected
//    private var service: IServiceService
    
    private let bag = DisposeBag()
    let input: DetailViewModelInput
    let output: DetailViewModelOutput
    let isLoading: BehaviorRelay<Bool> = BehaviorRelay(value: false)
    
    //MARK: - For input
    
    
    //MARK: - For output
    
    
    //MARK: - Init
    init() {
        input = DetailViewModelInput()
        output = DetailViewModelOutput()
    }
    
}
