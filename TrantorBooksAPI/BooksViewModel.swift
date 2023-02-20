//
//  BooksViewModel.swift
//  TrantorBooksAPI
//
//  Created by Aitor Salgado on 19/2/23.
//

import SwiftUI

final class BooksViewModel: ObservableObject {
    let persistance = NetworkPersistance.shared
    
    @Published var books:[Book] = []
    
    @Published var showAlertErrorNetwork = false
    @Published var errorMsg = ""
    
    
    init() {
        Task {
            await getLatestBooks()
        }
    }
    
    @MainActor func getLatestBooks() async {
        do {
            books = try await persistance.getLatestBooks()
        } catch  {
            errorMsg = error.localizedDescription
            showAlertErrorNetwork.toggle()
        }
    }
    
}
