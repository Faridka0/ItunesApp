//
//  Data+Ext.swift
//  ItunesApp
//
//  Created by Farid Guliyev on 26.01.2021.
//

import Foundation

extension Data {
    func decoded<T: Decodable>(_ type: T.Type) -> T? {
        let json = JSONDecoder()
        do {
            let jsonData = try json.decode(type.self, from: self)
            return jsonData
        } catch {
            print(NSString(data: self, encoding: 4) ?? "")
            print("Error to encode model \(T.self) (weight: \(self) to data: " + error.localizedDescription)
            return nil
        }
    }
}
