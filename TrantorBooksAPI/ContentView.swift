//
//  ContentView.swift
//  TrantorBooksAPI
//
//  Created by Aitor Salgado on 18/2/23.
//

import SwiftUI

struct ContentView: View {
    @EnvironmentObject var booksVM:BooksViewModel
    var body: some View {
        NavigationStack {
            List(booksVM.books){ book in
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
            .navigationTitle("Trantor Latest Books")
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

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
            .environmentObject(BooksViewModel())
    }
}
