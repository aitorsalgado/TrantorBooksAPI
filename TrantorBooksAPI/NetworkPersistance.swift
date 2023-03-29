//
//  NetworkPersistance.swift
//  TrantorBooksAPI
//
//  Created by Aitor Salgado on 19/2/23.
//

import SwiftUI

final class NetworkPersistance {
    static let shared = NetworkPersistance()
    
    func getLatestBooks() async throws -> [Book] {
        try await queryJSON(request: .requestGET(url: .getLatestBooks), type: [Book].self)
    }
    
    func getAllBooks() async throws -> [Book] {
        try await queryJSON(request: .requestGET(url: .getBooks), type: [Book].self)
    }
    
    func getBooksByTitle(titleToSearch:String) async throws -> [Book] {
        try await queryJSON(request: .requestGET(url: .getBooksByTitle(titleToSearch: titleToSearch)), type: [Book].self)
    }
    
    func getAllAuthors() async throws -> [AuthorDetail] {
        try await queryJSON(request: .requestGET(url: .getAuthors), type: [AuthorDetail].self)
    }
    
    func getAuthorDetailByID(id:UUID) async throws -> AuthorDetail {
        try await queryJSON(request: .requestGET(url: .getAuthorDetailByID(id: id)), type: AuthorDetail.self)
    }
    
    func getUserInfo(userDetail:UserDetail) async throws -> UserDetail {
        try await queryJSON(request: .requestWithBody(url: .getUserInfo, method: .post, body: userDetail), type: UserDetail.self)
    }
    
    func queryJSON<T:Codable>(request: URLRequest,
                              type: T.Type,
                              decoder: JSONDecoder = JSONDecoder(),
                              statusOK:Int = 200 ) async throws -> T {
        do {
            let (data, response) = try await URLSession.shared.data(for: request)
            guard let response = response as? HTTPURLResponse else { throw APIErrors.nonHTTP }
            if response.statusCode == statusOK {
                do {
                    return try decoder.decode(type, from: data)
                } catch {
                    throw APIErrors.json(error)
                }
            } else {
                throw APIErrors.status(response.statusCode)
            }
        } catch let error as APIErrors {
            throw error
        } catch {
            throw APIErrors.general(error)
        }
    }
}
