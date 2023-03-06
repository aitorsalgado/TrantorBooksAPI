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
        let (data, _) = try await URLSession.shared.data(from: .getBooksByTitle(titleToSearch: titleToSearch))
        return try JSONDecoder().decode([Book].self, from: data)
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
        do {
            let (data, response) = try await URLSession.shared.data(from: .getAuthorDetailByID(id: id))
            guard let response = response as? HTTPURLResponse else { throw APIErrors.nonHTTP }
            if response.statusCode == 200 {
                do {
                    return try JSONDecoder().decode(AuthorDetail.self, from: data)
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
