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
        ScrollView {
            VStack {
                AsyncImage(url: booksDetailVM.book.cover) { image in
                    image
                        .resizable()
                        .scaledToFit()
                } placeholder: {
                    Image(systemName: "text.book.closed")
                        .resizable()
                        .scaledToFit()
                        .frame(width: 400, height: 400)
                }
                Spacer()
                Text(booksDetailVM.book.title)
                    .font(.title)
                Text(booksDetailVM.authorName)
                    .font(.title2)
                Text(booksDetailVM.book.price.formatted(.currency(code: "EUR").locale(Locale(identifier: "es-ES"))))
                    .bold()
                    .padding(5)
                    .padding(.horizontal, 8)
                    .background {
                        RoundedRectangle(cornerRadius: 20, style: .continuous)
                            .fill(.gray.opacity(0.2))
                    }
                Text(booksDetailVM.book.plot ?? "")
                    .font(.caption)
                    .lineLimit(10, reservesSpace: true)
                    .padding()
                Section {
                    HStack(spacing: 50) {
                        VStack {
                            Text("Length")
                                .font(.headline)
                            Text(booksDetailVM.book.pages?.description ?? "0")
                        }
                        VStack {
                            Text("Year")
                                .font(.headline)
                            Text(booksDetailVM.book.year.description)
                        }
                    }
                }
            }
        }
        .navigationTitle(booksDetailVM.book.title)
        .navigationBarTitleDisplayMode(.inline)
    }
}

struct BookDetailView_Previews: PreviewProvider {
    static var previews: some View {
        BookDetailView(booksDetailVM: BooksDetailViewModel(book: .bookTest))
    }
}
