//
//  NetworkInterface.swift
//  TrantorBooksAPI
//
//  Created by Aitor Salgado on 18/2/23.
//

import Foundation

let serverURL = URL.productionServer

extension URL {
    static let productionServer = URL(string: "https://trantorapi-acacademy.herokuapp.com/api/")!
    
    static let getBooks = serverURL.appending(component: "list")
    static let getLatestBooks = serverURL.appending(component: "latest")
}
