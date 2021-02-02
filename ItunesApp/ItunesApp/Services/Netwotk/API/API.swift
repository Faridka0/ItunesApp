//
//  API.swift
//  ItunesApp
//
//  Created by Farid Guliyev on 02.02.2021.
//

import Foundation
import RxSwift
import RxCocoa

protocol IAPI: class {
    func search(_ query: String?) -> Observable<APIResponse<[ContentAPIModel]>?>
    
}

class API: IAPI {
    
    
    @LazyInjected
    private var httpClient: IHttpClient
    
    func search(_ query: String?) -> Observable<APIResponse<[ContentAPIModel]>?> {
        let url = APIURLBuilder.searchURL(by: query)
        return httpClient.request(method: .get, type: APIResponse<[ContentAPIModel]>.self, url: url)
    }
}
