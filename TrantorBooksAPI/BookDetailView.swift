//
//  BookDetailView.swift
//  TrantorBooksAPI
//
//  Created by Aitor Salgado on 1/3/23.
//

import SwiftUI

struct BookDetailView: View {
    @ObservedObject var booksDetailVM:BooksDetailViewModel
    
    var body: some View {
        Text(booksDetailVM.book.title)
    }
}

struct BookDetailView_Previews: PreviewProvider {
    static var previews: some View {
        BookDetailView(booksDetailVM: BooksDetailViewModel(book: .bookTest))
    }
}
