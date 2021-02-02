//  
//  HistoryAssembly.swift
//  ItunesApp
//
//  Created by Farid Guliyev on 02.02.2021.
//

import UIKit

final class HistoryAssembly {

    static func module() -> UIViewController {
        let viewModel = HistoryViewModel()
        let viewController = HistoryVC(viewModel: viewModel)
        viewController.title = Text.Tab.history.rawValue
        return viewController
    }
    
}


