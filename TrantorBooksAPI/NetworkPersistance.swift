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
        let (data, _) = try await URLSession.shared.data(from: .getLatestBooks)
        return try JSONDecoder().decode([Book].self, from: data)
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
