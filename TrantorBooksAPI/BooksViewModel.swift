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
    @Published var authors:[AuthorDetail] = []
    
    @Published var showAlertErrorNetwork = false
    @Published var errorMsg = ""
    
    
    init() {
        Task {
            await getAllAuthors()
            await getLatestBooks()
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
