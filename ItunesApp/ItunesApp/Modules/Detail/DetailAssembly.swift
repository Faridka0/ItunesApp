//  
//  DetailAssembly.swift
//  ItunesApp
//
//  Created by Farid Guliyev on 03.02.2021.
//

import UIKit

final class DetailAssembly {

    static func module() -> DetailVC {
        let viewModel = DetailViewModel()
        let viewController = DetailVC(viewModel: viewModel)
        return viewController
    }
    
}


