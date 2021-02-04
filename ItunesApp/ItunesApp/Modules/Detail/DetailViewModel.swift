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
    
    let collectionID: BehaviorRelay<Int?>
    
}

struct DetailViewModelOutput {
    
    let content: BehaviorRelay<[Content]?>
}

protocol IDetailViewModel {
    
    var input: DetailViewModelInput { get }
    var output: DetailViewModelOutput { get }
    
}

class DetailViewModel: IDetailViewModel {
    
    //MARK: - Properties
    @LazyInjected
    private var service: IAPI
    
    private let bag = DisposeBag()
    let input: DetailViewModelInput
    let output: DetailViewModelOutput
    
    //MARK: - For input
    private let collectionID: BehaviorRelay<Int?> = BehaviorRelay(value: nil)
    
    //MARK: - For output
    private let content: BehaviorRelay<[Content]?> = BehaviorRelay(value: nil)
    
    //MARK: - Init
    init() {
        input = DetailViewModelInput(collectionID: collectionID)
        output = DetailViewModelOutput(content: content)
        
        collectionID
            .asObservable()
            .bind(to: loadDataBinder())
            .disposed(by: bag)
    }
    
    func loadDataBinder() -> Binder<Int?> {
        Binder(self) { (vm: DetailViewModel, value: Int?) in
            guard let id = value else { return }
            vm.service.getSongs(by: id)
                .asObservable()
                .map({ $0?.results?.compactMap({ $0.map() }) })
                .bind(to: vm.content)
                .disposed(by: vm.bag)
        }
    }
    
}
