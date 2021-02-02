//  
//  TabBarAssembly.swift
//  ItunesApp
//
//  Created by Farid Guliyev on 02.02.2021.
//

import UIKit

final class TabBarAssembly {
    
    static func module() -> UIViewController {
        let storyboard = UIStoryboard(name: "TabBar", bundle: nil)
        let viewModel = TabBarViewModel()
        let vc = storyboard.instantiateViewController(withIdentifier: "TabBarVC") as! TabBarVC
        vc.viewModel = viewModel
        
        vc.viewControllers = [
            SearchAssembly.module(),
            HistoryAssembly.module()
        ]
        return vc
    }
}
