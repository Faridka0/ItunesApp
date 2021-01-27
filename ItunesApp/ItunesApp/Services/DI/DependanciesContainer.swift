//
//  DependanciesContainer.swift
//  ItunesApp
//
//  Created by Farid Guliyev on 26.01.2021.
//

import Foundation

class DependanciesContainer {
    private var resolutionsMap: [String: Any] = [:]
    
    func register<Interface>(_ interface: Interface.Type, registrationBlock: ()->Interface) {
        let id = String(describing: interface)
        let implementation = registrationBlock()
        resolutionsMap[id] = implementation
    }
    
    func resolve<Interface>(_ interface: Interface.Type) -> Interface? {
        let id = String(describing: interface)
        return resolutionsMap[id] as? Interface
    }
}
