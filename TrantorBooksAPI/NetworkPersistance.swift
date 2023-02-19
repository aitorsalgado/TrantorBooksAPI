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
}
