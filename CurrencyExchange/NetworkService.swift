//
//  NetworkService.swift
//  CurrencyExchange
//
//  Created by Bushra Khan on 9/19/21.
//

import Foundation


struct NetworkService {
    
    static let shared = NetworkService()
    
    func networkCall(url: URLRequest, completion:@escaping( Any?,HTTPURLResponse?,Error?)->()) {
        URLSession.shared.dataTask(with:url) { data,response,error in
            let Response = response as! HTTPURLResponse
            if error == nil{
                completion(data,Response,nil)
            }else{
                completion(nil,Response,error)
                print(String(describing: error))
            }
        }.resume()
    }
}
