//
//  BooksDetailViewModel.swift
//  TrantorBooksAPI
//
//  Created by Aitor Salgado on 1/3/23.
//

import Foundation

final class BooksDetailViewModel: ObservableObject {
    let book:Book
    
    init(book:Book) {
        self.book = book
    }
}
