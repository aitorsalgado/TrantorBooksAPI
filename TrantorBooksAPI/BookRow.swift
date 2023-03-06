//
//  BookRow.swift
//  TrantorBooksAPI
//
//  Created by Aitor Salgado on 1/3/23.
//

import SwiftUI

struct BookRow: View {
    @ObservedObject var bookDetailViewModel: BooksDetailViewModel
    
    var body: some View {
        HStack {
            AsyncImage(url: bookDetailViewModel.book.cover) { image in
                image
                    .resizable()
                    .scaledToFit()
                    .frame(width: 50, height: 100)
                    .clipShape(Rectangle())
            } placeholder: {
                Image(systemName: "text.book.closed")
                    .resizable()
                    .scaledToFit()
                    .frame(width: 50, height: 100)
                    .clipShape(Rectangle())
                
            }
            VStack(alignment: .leading) {
                Text(bookDetailViewModel.book.title)
                    .font(.headline)
                Text(bookDetailViewModel.authorName)
                    .font(.caption)
            }
            Spacer()
            Text(bookDetailViewModel.book.price.formatted(.currency(code: "EUR").locale(Locale(identifier: "es-ES"))))
                .bold()
                .padding(5)
                .padding(.horizontal, 8)
                .background {
                    RoundedRectangle(cornerRadius: 20, style: .continuous)
                        .fill(.gray.opacity(0.2))
                }
        }
    }
}

struct BookRow_Previews: PreviewProvider {
    static var previews: some View {
        BookRow(bookDetailViewModel: BooksDetailViewModel(book: .bookTest))
    }
}
