//
//  APIURLBuilder.swift
//  ItunesApp
//
//  Created by Farid Guliyev on 02.02.2021.
//

import Foundation

enum APIURLBuilder {
    
    static let baseURL: URL = URL(string: "https://itunes.apple.com")!
    
    static let search: URL = baseURL.appendingPathComponent("search")
    
    static let lookup: URL = baseURL.appendingPathComponent("lookup")
    
    
    static func searchURL(by query: String?) -> URL {
        search.appending("term", value: query).appending("limit", value: "25")
    }
    
    
}
