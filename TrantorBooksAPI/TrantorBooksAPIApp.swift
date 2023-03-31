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
    @StateObject var userVM = UserViewModel()
    
    var body: some Scene {
        WindowGroup {
            TrantorBooksTabView()
                .environmentObject(booksVM)
                .environmentObject(userVM)
        }
    }
     
}
