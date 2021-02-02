//
//  HttpClient.swift
//  ItunesApp
//
//  Created by Farid Guliyev on 26.01.2021.
//

import Foundation
import RxSwift
import RxCocoa

enum HTTPMethod: String {
    case post = "POST"
    case get = "GET"
    case put = "PUT"
    case del = "DELETE"
}

protocol IHttpClient: class {
    func request<T: Codable>(method: HTTPMethod,
                             type: T.Type,
                             url: URL,
                             parameters: [String: Any]?) -> Observable<T?>
    
}

extension IHttpClient {
    func request<T: Codable>(method: HTTPMethod = .post,
                             type: T.Type,
                             url: URL,
                             parameters: [String: Any]? = nil) -> Observable<T?> {
        return request(method: method, type: type, url: url, parameters: parameters)
    }
}

class HttpClient: IHttpClient {
    
    private let bag = DisposeBag()
    
    func request<T: Codable>(method: HTTPMethod,
                             type: T.Type,
                             url: URL,
                             parameters: [String: Any]?) -> Observable<T?> {
        
        let result: BehaviorRelay<T?> = BehaviorRelay(value: nil)
        
        if var request = requestBuilder(method: method, url: url) {
            
            if let params = parameters {
                let data = try? JSONSerialization.data(withJSONObject: params, options: .prettyPrinted)
                request.httpBody = data
            }
            
            URLSession.shared.rx.response(request: request)
                .debug()
                .map ({ response, data -> Data in
                    
                    return data
                })
                .map(T.self)
                .bind(to: result)
                .disposed(by: bag)
        }
        return result.asObservable().skip(1)
    }
    
    private func requestBuilder(method: HTTPMethod, url: URL) -> URLRequest? {
        var request = URLRequest(url: url)
        request.allHTTPHeaderFields = ["Content-Type": "application/json", "Accept": "application/json"]
        request.httpMethod = method.rawValue
        return request
    }
}
