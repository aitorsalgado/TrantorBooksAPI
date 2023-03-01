//
//  AuthorDetailViewModel.swift
//  TrantorBooksAPI
//
//  Created by Aitor Salgado on 1/3/23.
//

import Foundation

final class AuthorDetailViewModel:ObservableObject {
    let persistance = NetworkPersistance.shared
//    @Published var authorDetail:AuthorDetail
    
    @Published var showAlertErrorNetwork = false
    @Published var errorMsg = ""
    
//    init(authorDetail: AuthorDetail) {
//        self.authorDetail = authorDetail
//    }
    
    @MainActor func getAuthorDetailByID(id:UUID) async -> AuthorDetail {
        do {
            return try await persistance.getAuthorDetailByID(id: id)
        } catch {
            return AuthorDetail(id: UUID(uuidString: "0")!, name: "Author Unknown")
        }
    }
}
