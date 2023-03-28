//
//  LoginUserView.swift
//  TrantorBooksAPI
//
//  Created by Aitor Salgado on 28/3/23.
//

import SwiftUI

struct LoginUserView: View {
    @State var userEmail = ""
    @State var userPassword = ""
    var body: some View {
        VStack() {
            Text("Login")
                .font(.largeTitle)
                .bold()
            GroupBox() {
                Text("User")
                    .font(.headline)
                    .frame(maxWidth: .infinity,alignment: .leading)
                TextField("User email", text: $userEmail)
                    .textContentType(.username)
                    .autocorrectionDisabled()
                    .textInputAutocapitalization(.never)
                    .keyboardType(.emailAddress)
                Text("Password")
                    .font(.headline)
                    .frame(maxWidth: .infinity,alignment: .leading)
                SecureField("User password", text: $userPassword)
                    .textContentType(.password)
                Button {
                    
                } label: {
                    Text("Access")
                }
                .buttonStyle(.borderedProminent)
                .padding(.top)

            } label: {
                Text("Start buying some books!")
                    .bold()
                    .padding(.bottom)
            }
            .textFieldStyle(.roundedBorder)
        }
        .padding()
    }
}

struct LoginUserView_Previews: PreviewProvider {
    static var previews: some View {
        LoginUserView()
    }
}
