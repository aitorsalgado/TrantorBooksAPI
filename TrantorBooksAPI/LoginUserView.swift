//
//  LoginUserView.swift
//  TrantorBooksAPI
//
//  Created by Aitor Salgado on 28/3/23.
//

import SwiftUI

enum Screens {
    case login
    case create
    case detail
}

struct LoginUserView: View {
    @State var screen:Screens = .login
    
    var body: some View {
        Group {
            switch screen {
            case .login:
                LoginComponent()
                Button {
                    screen = .create
                } label: {
                    Text("Create an account")
                }
            case .create:
                CreateUserView()
            case .detail:
                Text("Not today")
            }
        }
    }
}

struct LoginUserView_Previews: PreviewProvider {
    static var previews: some View {
        LoginUserView()
            .environmentObject(UserViewModel())
    }
}
