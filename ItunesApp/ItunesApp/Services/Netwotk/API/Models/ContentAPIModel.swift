//
//  ContentAPIModel.swift
//  ItunesApp
//
//  Created by Farid Guliyev on 02.02.2021.
//

import Foundation

struct ContentAPIModel: Codable {
    let collectionId: Int?
    let artistName, collectionName, artworkUrl100: String?
}


extension ContentAPIModel {
    func map() -> Content? {
        guard let id = collectionId, let title = collectionName, let artistName = artistName else { return nil }
        return Content(id: id, title: title, artistName: artistName, imageURL: URL(string: artworkUrl100 ?? ""))
    }
}
