//  
//  TabBarViewModel.swift
//  ItunesApp
//
//  Created by Farid Guliyev on 02.02.2021.
//

import UIKit
import RxSwift
import RxCocoa

struct TabBarViewModelInput {
    
    
}

struct TabBarViewModelOutput {
    
    
}

protocol ITabBarViewModel {
    
    var input: TabBarViewModelInput { get }
    var output: TabBarViewModelOutput { get }
    
}

class TabBarViewModel: ITabBarViewModel {
    
    //MARK: - Properties
//    @LazyInjected
//    private var service: IServiceService
    
    private let bag = DisposeBag()
    let input: TabBarViewModelInput
    let output: TabBarViewModelOutput
    
    //MARK: - For input
    
    
    //MARK: - For output
    
    
    //MARK: - Init
    init() {
        input = TabBarViewModelInput()
        output = TabBarViewModelOutput()
    }
    
}
