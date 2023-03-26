//
//  NetworkInterface.swift
//  TrantorBooksAPI
//
//  Created by Aitor Salgado on 18/2/23.
//

import Foundation

enum HttpMethod:String {
    case get = "GET"
    case post = "POST"
    case put = "PUT"
    case delete = "DELETE"
}

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

extension URLRequest {
    static func requestGET(url:URL, method: HttpMethod = .get) -> URLRequest {
        var request = URLRequest(url: url)
        request.httpMethod = method.rawValue
        request.addValue("application/json; charset=utf-8", forHTTPHeaderField: "Content-Type")
        request.addValue("application/json", forHTTPHeaderField: "Accept")
        return request
    }
    
    static func requestWithBody<T:Codable>(url:URL, method: HttpMethod ,body:T ) -> URLRequest {
        var request = URLRequest(url: url)
        request.httpMethod = method.rawValue
        request.httpBody = try? JSONEncoder().encode(body)
        request.addValue("application/json; charset=utf-8", forHTTPHeaderField: "Content-Type")
        request.addValue("application/json", forHTTPHeaderField: "Accept")
        return request
    }
}
