//
//  RealmService.swift
//  ItunesApp
//
//  Created by Farid Guliyev on 04.02.2021.
//

import Foundation
import RealmSwift

protocol IRealmService: class {
    /// This function save data in database for a given `object`.
    ///
    /// ```
    /// save(HistoryRM(text: "Hello"))
    /// ```
    ///
    /// - Parameter object: The realm model `object`.
    func save(_ object: Object)
    
    /// This function return array of data in database for a given object `type`.
    ///
    /// ```
    /// read(HistoryRM.self)
    /// ```
    ///
    /// - Parameter type: The realm model  object  `type`.
    /// - Returns: array of `type`.
    func read<T: Object>(by type: T.Type) -> [T]
}

final class RealmService: IRealmService {
    
    let realm = try! Realm()
    
    func save(_ object: Object) {
        try? realm.write {
            realm.add(object)
        }
    }
    
    func read<T: Object>(by type: T.Type) -> [T] {
        return Array(realm.objects(T.self))
    }
}
