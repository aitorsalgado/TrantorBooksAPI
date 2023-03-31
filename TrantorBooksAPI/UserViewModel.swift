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
    
    @Published var showAlerUser = false
    @Published var userAlertMsg = ""
    @Published var userAlertHeadMsg = ""
    
    init() {
        user = UserDetail(email: "")
    }
    
    @MainActor func authenticateUser(userEmail:String) async -> Bool {
        do {
            user  = try await persistance.getUserInfo(userDetail: UserDetail(email: userEmail))
            return true
        } catch {
            userAlertMsg = error.localizedDescription.description
            userAlertHeadMsg = "User Invalid"
            showAlerUser.toggle()
            return false
        }
    }
    
}
