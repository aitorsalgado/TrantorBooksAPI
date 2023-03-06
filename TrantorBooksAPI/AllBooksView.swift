//
//  AllBooksView.swift
//  TrantorBooksAPI
//
//  Created by Aitor Salgado on 6/3/23.
//

import SwiftUI

struct AllBooksView: View {
    @EnvironmentObject var booksVM:BooksViewModel
    var body: some View {
        NavigationStack {
            List(booksVM.filteredBooks){ book in
                NavigationLink(value: book) {
                    BookRow(bookDetailViewModel: BooksDetailViewModel(book: book))
                }
            }
            .navigationTitle("Trantor Latest Books")
            .navigationDestination(for: Book.self) { book in
                BookDetailView(booksDetailVM: BooksDetailViewModel(book: book))
            }
            .listStyle(.inset)
        }
        .alert("Network Error", isPresented: $booksVM.showAlertErrorNetwork) {
            Button(action: {}) {
                Text("OK")
            }
        } message: {
            Text(booksVM.errorMsg)
        }
        .searchable(text: $booksVM.searchBookTitle)
    }
}

struct AllBooksView_Previews: PreviewProvider {
    static var previews: some View {
        AllBooksView()
            .environmentObject(BooksViewModel())
    }
}
