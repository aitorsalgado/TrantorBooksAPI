//
//  ContentView.swift
//  TrantorBooksAPI
//
//  Created by Aitor Salgado on 18/2/23.
//

import SwiftUI

struct ContentView: View {
    @EnvironmentObject var booksVM:BooksViewModel
    @State var showUserMenu = false
    var body: some View {
        NavigationStack {
            List(booksVM.latestBooks){ book in
                NavigationLink(value: book) {
                    BookRow(bookDetailViewModel: BooksDetailViewModel(book: book))
                }
            }
            .navigationTitle("Trantor Latest Books")
            .navigationDestination(for: Book.self) { book in
                BookDetailView(booksDetailVM: BooksDetailViewModel(book: book))
            }
            .listStyle(.inset)
            .toolbar {
                ToolbarItem(placement: .confirmationAction) {
                    Button {
                        showUserMenu.toggle()
                    } label: {
                        Image(systemName:"person.circle")
                            .tint(Color.gray)
                    }
                    .padding()
                }
            }
        }
        .alert("Network Error", isPresented: $booksVM.showAlertErrorNetwork) {
            Button(action: {}) {
                Text("OK")
            }
        } message: {
            Text(booksVM.errorMsg)
        }
        .sheet(isPresented: $showUserMenu) {
            LoginUserView()
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static let booksVMPreview = BooksViewModel()
    static var previews: some View {
        ContentView()
            .environmentObject(booksVMPreview)
            .environmentObject(UserViewModel())
    }
}
