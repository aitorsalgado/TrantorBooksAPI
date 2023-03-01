//
//  NetworkInterface.swift
//  TrantorBooksAPI
//
//  Created by Aitor Salgado on 18/2/23.
//

import Foundation

enum APIErrors:Error {
case general(Error)
    case json(Error)
    case nonHTTP
    case status(Int)
    case invalidData
    
    var description:String {
        switch self {
        case .general(let error):
            return "General error: \(error)"
        case .json(let error):
            return "JSON error: \(error)"
        case .nonHTTP:
            return "Non HTTP connection."
        case .status(let int):
            return "Status error: Code \(int)"
        case .invalidData:
            return "Invalid data."
        }
    }
}

let serverURL = URL.productionServer

extension URL {
    static let productionServer = URL(string: "https://trantorapi-acacademy.herokuapp.com/api")!
    
    static let getLatestBooks = serverURL.appending(component: "books").appending(component: "latest")
    static let getBooks = serverURL.appending(component: "books").appending(component: "list")
    static let getAuthors = serverURL.appending(component: "books").appending(component: "authors")
    
    static func getBooksByTitle(titleToSearch:String) -> URL {
        //Not necessary lowercased because the API is not case sensitive
        serverURL.appending(component: "books").appending(component: "find").appending(component: "\(titleToSearch)")
    }
    
    static func getAuthorDetailByID(id: UUID) -> URL {
        serverURL.appending(component: "books").appending(component: "getAuthor").appending(component: "\(id)")
    }
}
