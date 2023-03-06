//
//  BooksViewModel.swift
//  TrantorBooksAPI
//
//  Created by Aitor Salgado on 19/2/23.
//

import SwiftUI

final class BooksViewModel: ObservableObject {
    let persistance = NetworkPersistance.shared
    
    @Published var latestBooks:[Book] = []
    @Published var allBooks:[Book] = []
    @Published var authors:[AuthorDetail] = []
    
    @Published var showAlertErrorNetwork = false
    @Published var errorMsg = ""
    
    @Published var searchBookTitle = ""
    
    var filteredBooks:[Book] {
        if searchBookTitle.isEmpty {
            return allBooks.sorted( by: { $0.id < $1.id } )
        }
        return allBooks.filter { book in
            book.title.lowercased().contains(searchBookTitle.lowercased())
        }.sorted( by: { $0.id < $1.id } )
    }
    
    
    
    init() {
        Task {
            await getAllAuthors()
            await getLatestBooks()
            await getAllBooks()
        }
    }
    
    @MainActor func getLatestBooks() async {
        do {
            latestBooks = try await persistance.getLatestBooks()
        } catch  {
            errorMsg = error.localizedDescription
            showAlertErrorNetwork.toggle()
        }
    }
    
    @MainActor func getAllBooks() async {
        do {
            allBooks = try await persistance.getAllBooks()
        } catch  {
            errorMsg = error.localizedDescription
            showAlertErrorNetwork.toggle()
        }
    }
    
    @MainActor func getBooksByTitle(titleToSearch: String) async -> [Book] {
        do {
            return try await persistance.getBooksByTitle(titleToSearch: titleToSearch)
        } catch  {
            errorMsg = error.localizedDescription
            showAlertErrorNetwork.toggle()
            return []
        }
    }
    
    @MainActor func getAllAuthors() async {
        do {
            authors = try await persistance.getAllAuthors()
        } catch {
            errorMsg = error.localizedDescription
            showAlertErrorNetwork.toggle()
        }
    }
    
    //TODO: Test not passed.
    func getAuthorNameById(id: UUID) -> String {
        authors.first(where: { $0.id == id })?.name ?? "Author unkown"
    }
    
}
