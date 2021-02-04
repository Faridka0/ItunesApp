//
//  ServiceLocator.swift
//  ItunesApp
//
//  Created by Farid Guliyev on 26.01.2021.
//

import Foundation

class ServiceLocator {
    
    func resolve<Service>(_ service: Service.Type) -> Service {
        guard let resolution = container?.resolve(Service.self) else {
            fatalError("Can not resolve service for type \(service)")
        }
        
        return resolution
    }
    
    private(set) var container: DependanciesContainer?
    
    static let shared = ServiceLocator()
    
    private init() {}
    
    func createContainer() {
        let container = DependanciesContainer()
        container.register(IHttpClient.self, registrationBlock: HttpClient.init)
        container.register(IAPI.self, registrationBlock: API.init)
        container.register(IRealmService.self, registrationBlock: RealmService.init)
        self.container = container
    }
}
