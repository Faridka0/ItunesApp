//
//  HistoryRM.swift
//  ItunesApp
//
//  Created by Farid Guliyev on 04.02.2021.
//

import Foundation
import RealmSwift

class HistoryRM: Object {

    @objc dynamic var text: String = ""
    
    convenience init(text: String) {
        self.init()
        self.text = text
    }

}

