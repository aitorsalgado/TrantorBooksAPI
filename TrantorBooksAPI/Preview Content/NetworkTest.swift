//
//  NetworkTest.swift
//  TrantorBooksAPI
//
//  Created by Aitor Salgado on 20/2/23.
//

import SwiftUI

func getBooksDataTest() -> [Book] {
    guard let urlData = Bundle.main.url(forResource: "booksTestData", withExtension: "json") else { return [] }
    do {
        let dataTest = try Data(contentsOf: urlData)
        return try JSONDecoder().decode([Book].self, from: dataTest)
    } catch {
        print("Error loading JSON data test: \(error)")
        return []
    }
}
