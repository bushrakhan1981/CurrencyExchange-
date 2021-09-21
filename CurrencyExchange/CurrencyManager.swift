//
//  CurrencyManager.swift
//  CurrencyExchange
//
//  Created by Bushra Khan on 9/19/21.
//

import Foundation

struct
CurrencyExchange{
    static var shared = CurrencyExchange()
    
    func getExchange(urlString: String,completition: @escaping ([DataModel]?, ErrorTypes?) -> ()){
        guard let url = URL(string: urlString) else {return}
        var request = URLRequest(url: url)
        request.httpMethod = "GET"
        NetworkService.shared.networkCall(url: request) {data,Response, error in
            if error == nil {
                let decoder =  try! JSONDecoder().decode([DataModel].self, from: data as! Data)
                DispatchQueue.main.async {
                    completition(decoder,nil)
                    print(decoder)
                }
            } else {
                completition(nil,.networkError
                )
            }
        }
    }
}
