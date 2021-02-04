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
    /// This function make search request by given `query` and return observable  APIResponse.
    ///
    /// ```
    /// search("Hello")
    /// ```
    ///
    /// - Parameter query: The user searching value text `query`.
    /// - Returns: observable response.
    func search(_ query: String?) -> Observable<APIResponse<[ContentAPIModel]>?>
    
    /// This function make get songs request by given `collectionID` and return observable  APIResponse.
    ///
    /// ```
    /// getSongs(by: 1324354241)
    /// ```
    ///
    /// - Parameter collectionID: The collectionID of albums `collectionID`.
    /// - Returns: observable response.
    func getSongs(by collectionID: Int) -> Observable<APIResponse<[ContentAPIModel]>?>
}

class API: IAPI {
    
    
    @LazyInjected
    private var httpClient: IHttpClient
    
    func search(_ query: String?) -> Observable<APIResponse<[ContentAPIModel]>?> {
        let url = APIURLBuilder.searchURL(by: query)
        return httpClient.request(method: .get, type: APIResponse<[ContentAPIModel]>.self, url: url)
    }
    
    func getSongs(by collectionID: Int) -> Observable<APIResponse<[ContentAPIModel]>?> {
        let url = APIURLBuilder.songsURL(by: collectionID)
        return httpClient.request(method: .get, type: APIResponse<[ContentAPIModel]>.self, url: url)
    }
}
