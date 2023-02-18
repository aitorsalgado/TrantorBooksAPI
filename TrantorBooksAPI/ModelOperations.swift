//
//  ModelOperations.swift
//  TrantorBooksAPI
//
//  Created by Aitor Salgado on 18/2/23.
//

import Foundation

//Get Books info that contains the string search in the title.
struct BooksQuery: Codable {
    let title:String
}

//Get Author Name by id.
struct AuthorQuery: Codable {
    let id:UUID
}
