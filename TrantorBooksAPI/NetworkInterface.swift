//
//  NetworkInterface.swift
//  TrantorBooksAPI
//
//  Created by Aitor Salgado on 18/2/23.
//

import Foundation

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
