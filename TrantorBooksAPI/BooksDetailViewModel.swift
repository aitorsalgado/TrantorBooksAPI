//
//  BooksDetailViewModel.swift
//  TrantorBooksAPI
//
//  Created by Aitor Salgado on 1/3/23.
//

import Foundation

final class BooksDetailViewModel: ObservableObject {
    let persistance = NetworkPersistance.shared
    let book:Book
    
    @Published var authorName = ""
    
    init(book:Book) {
        self.book = book
        Task {
            await getAuthorDetailNameByID(id: book.author)
        }
    }
    
    @MainActor func getAuthorDetailNameByID(id:UUID) async {
        do {
            authorName  = try await persistance.getAuthorDetailByID(id: id).name
        } catch {
            authorName = "Author Unknown"
        }
    }
}
