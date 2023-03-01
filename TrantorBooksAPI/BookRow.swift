//
//  BookRow.swift
//  TrantorBooksAPI
//
//  Created by Aitor Salgado on 1/3/23.
//

import SwiftUI

struct BookRow: View {
    let book:Book
    
    var body: some View {
        HStack {
            AsyncImage(url: book.cover) { image in
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
                Text(book.title)
                    .font(.headline)
                Text(book.author.description)
                    .font(.caption)
            }
            Spacer()
            Text(book.price.formatted(.currency(code: "EUR").locale(Locale(identifier: "es-ES"))))
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
        BookRow(book: Book.bookTest)
    }
}
