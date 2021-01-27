//
//  Injected.swift
//  ItunesApp
//
//  Created by Farid Guliyev on 26.01.2021.
//

import Foundation

@propertyWrapper
struct LazyInjected<Service> {

    private(set) lazy var service = ServiceLocator.shared.resolve(Service.self)

    var wrappedValue: Service {
        mutating get { return service }
        mutating set { service = newValue }
    }
}
