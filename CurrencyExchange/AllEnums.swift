//
//  AllEnums.swift
//  CurrencyExchange
//
//  Created by Bushra Khan on 9/19/21.
//

import Foundation

enum CurrencyUrl: String {
    case baseUrl = "https://api.nomics.com/v1/exchange-rates?key=79b084b15be33b94c3f20f79c84b9db3f88453c7&ids"
}

enum ErrorTypes: Error {
    case decodingError
    case networkError
}
