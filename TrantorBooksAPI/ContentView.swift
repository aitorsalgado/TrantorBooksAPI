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
                Text(book.title)
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
