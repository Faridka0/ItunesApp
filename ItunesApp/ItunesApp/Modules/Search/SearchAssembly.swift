//  
//  SearchAssembly.swift
//  ItunesApp
//
//  Created by Farid Guliyev on 02.02.2021.
//

import UIKit

final class SearchAssembly {

    static func module() -> UIViewController {
        let viewModel = SearchViewModel()
        let viewController = SearchVC(viewModel: viewModel)
        viewController.title = Text.Tab.search.rawValue
        return viewController
    }
    
}


