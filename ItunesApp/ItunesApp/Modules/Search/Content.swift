//
//  Content.swift
//  ItunesApp
//
//  Created by Farid Guliyev on 02.02.2021.
//

import RxDataSources

struct ContentSection {
    var header: String
    var items: [Item]
    var canDelete: Bool = false
}

extension ContentSection : AnimatableSectionModelType {
    
    typealias Item = Content

    var identity: String {
        return header
    }

    init(original: ContentSection, items: [Item]) {
        self = original
        self.items = items
    }
}

struct Content {
    let id: Int
    let title: String
    let artistName: String
    let trackName: String
    let imageURL: URL?
}

extension Content: IdentifiableType, Equatable  {
    
    typealias Identity = Int

    var identity: Int {
        return id
    }

}
