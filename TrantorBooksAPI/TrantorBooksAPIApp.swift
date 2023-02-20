//
//  TrantorBooksAPIApp.swift
//  TrantorBooksAPI
//
//  Created by Aitor Salgado on 18/2/23.
//

import SwiftUI

@main
struct TrantorBooksAPIApp: App {
    @StateObject var booksVM = BooksViewModel()
    
    var body: some Scene {
        WindowGroup {
            ContentView()
                .environmentObject(booksVM)
        }
    }
}
