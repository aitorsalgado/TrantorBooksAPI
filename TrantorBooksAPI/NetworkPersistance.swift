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
        do {
            let (data, response) = try await URLSession.shared.data(from: .getLatestBooks)
            guard let response = response as? HTTPURLResponse else { throw APIErrors.nonHTTP }
            if response.statusCode == 200 {
                do {
                    return try JSONDecoder().decode([Book].self, from: data)
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
    
    func getAllBooks() async throws -> [Book] {
        do {
            let (data, response) = try await URLSession.shared.data(from: .getBooks)
            guard let response = response as? HTTPURLResponse else { throw APIErrors.nonHTTP }
            if response.statusCode == 200 {
                do {
                    return try JSONDecoder().decode([Book].self, from: data)
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
    
    func getBooksByTitle(titleToSearch:String) async throws -> [Book] {
        do {
            let (data, response) = try await URLSession.shared.data(from: .getBooksByTitle(titleToSearch: titleToSearch))
            guard let response = response as? HTTPURLResponse else { throw APIErrors.nonHTTP }
            if response.statusCode == 200 {
                do {
                    return try JSONDecoder().decode([Book].self, from: data)
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
    
    func getAllAuthors() async throws -> [AuthorDetail] {
        do {
            let (data, response ) = try await URLSession.shared.data(from: .getAuthors)
            guard let response = response as? HTTPURLResponse else { throw APIErrors.nonHTTP }
            if response.statusCode == 200 {
                do {
                    return try JSONDecoder().decode([AuthorDetail].self, from: data)
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
    
    func getAuthorDetailByID(id:UUID) async throws -> AuthorDetail {
        try await queryJSON(request: .requestGET(url: .getAuthorDetailByID(id: id)), type: AuthorDetail.self)
    }
    
    func queryJSON<T:Codable>(request: URLRequest,
                              type: T.Type,
                              decoder: JSONDecoder = JSONDecoder(),
                              statusOK:Int = 200 ) async throws -> T {
        do {
            let (data, response) = try await URLSession.shared.data(for: request)
            guard let response = response as? HTTPURLResponse else { throw APIErrors.nonHTTP }
            if response.statusCode == 200 {
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
