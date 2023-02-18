//
//  ModelDefinition.swift
//  TrantorBooksAPI
//
//  Created by Aitor Salgado on 18/2/23.
//

import Foundation

struct Book: Codable, Identifiable, Hashable {
    let id: Int
    let isbn: String?
    let author: UUID
    let rating: Double?
    let title: String
    let plot: String?
    let cover: URL?
    let summary: String?
    let pages: Int?
    let year: Int
}

struct AuthorDetail: Codable, Identifiable, Hashable {
    let id: UUID
    let name: String
}
