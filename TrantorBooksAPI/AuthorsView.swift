//
//  AuthorsView.swift
//  TrantorBooksAPI
//
//  Created by Aitor Salgado on 7/3/23.
//

import SwiftUI

struct AuthorsView: View {
    @EnvironmentObject var booksVM:BooksViewModel
    var body: some View {
        NavigationStack {
            List(booksVM.authors) { author in
                NavigationLink(value: author) {
                    Text(author.name)
                        .font(.headline)
                }
            }
            .navigationTitle("Authors")
            .navigationDestination(for: AuthorDetail.self) { author in
                BooksByAuthor(authorID: author.id)
            }
            .navigationDestination(for: Book.self) { book in
                BookDetailView(booksDetailVM: BooksDetailViewModel(book: book))
            }
        }
        .alert("Network Error", isPresented: $booksVM.showAlertErrorNetwork) {
            Button(action: {}) {
                Text("OK")
            }
        } message: {
            Text(booksVM.errorMsg)
        }
    }
}

struct AuthorsView_Previews: PreviewProvider {
    static var previews: some View {
        AuthorsView()
            .environmentObject(BooksViewModel())
    }
}
