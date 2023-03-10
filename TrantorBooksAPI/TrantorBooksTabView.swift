//
//  TabView.swift
//  TrantorBooksAPI
//
//  Created by Aitor Salgado on 6/3/23.
//

import SwiftUI

struct TrantorBooksTabView: View {
    var body: some View {
        TabView {
            ContentView()
                .tabItem {
                    Label("Recommended books", systemImage: "book.fill")
                }
            AllBooksView()
                .tabItem {
                    Label("Library", systemImage: "books.vertical.fill")
                }
            AuthorsView()
                .tabItem {
                    Label("Author", systemImage: "character.book.closed.fill")
                }
        }
    }
}

struct TabView_Previews: PreviewProvider {
    static var previews: some View {
        TrantorBooksTabView()
            .environmentObject(BooksViewModel())
    }
}
