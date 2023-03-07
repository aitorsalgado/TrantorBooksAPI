//
//  BooksByAuthor.swift
//  TrantorBooksAPI
//
//  Created by Aitor Salgado on 7/3/23.
//

import SwiftUI

struct BooksByAuthor: View {
    @EnvironmentObject var booksVM:BooksViewModel
    var authorID:UUID
    var body: some View {
        List(booksVM.allBooksByAuthor(authorId: authorID)){ book in
            NavigationLink(value: book) {
                BookRow(bookDetailViewModel: BooksDetailViewModel(book: book))
            }
        }
        .listStyle(.inset)
        .navigationTitle("\(booksVM.getAuthorNameById(id: authorID)) Books")
        .navigationBarTitleDisplayMode(.inline)
        .searchable(text: $booksVM.searchBookTitle)
    }
}

struct BooksByAuthor_Previews: PreviewProvider {
    static var previews: some View {
        NavigationStack {
            BooksByAuthor(authorID: UUID(uuidString: "531EDFA6-A361-4E15-873F-45E4EA0AF120")!)
                .environmentObject(BooksViewModel())
        }
    }
}
