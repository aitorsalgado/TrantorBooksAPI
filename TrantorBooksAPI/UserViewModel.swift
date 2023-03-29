//
//  UserViewModel.swift
//  TrantorBooksAPI
//
//  Created by Aitor Salgado on 29/3/23.
//

import Foundation

final class UserViewModel: ObservableObject {
    let persistance = NetworkPersistance.shared
    var user:UserDetail
    
    init(user:UserDetail) {
        self.user = user
    }
    
    @MainActor func authenticateUser(userEmail:String) async -> Bool {
        do {
            user  = try await persistance.getUserInfo(userDetail: UserDetail(email: userEmail))
            return true
        } catch {
            return false
        }
    }
    
}
