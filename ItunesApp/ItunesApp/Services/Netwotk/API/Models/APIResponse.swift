//
//  APIResponse.swift
//  ItunesApp
//
//  Created by Farid Guliyev on 02.02.2021.
//

import Foundation

struct APIResponse<T: Codable>: Codable {
    let resultCount: Int?
    let results: T?
}
