//
//  LoginComponent.swift
//  TrantorBooksAPI
//
//  Created by Aitor Salgado on 31/3/23.
//

import SwiftUI

struct LoginComponent: View {
    @EnvironmentObject var userVM:UserViewModel
    @Environment (\.dismiss) var dismiss
    @State var userEmail = ""
    var body: some View {
        VStack() {
            Text("Login")
                .font(.largeTitle)
                .bold()
            GroupBox() {
                Text("User")
                    .font(.headline)
                    .frame(maxWidth: .infinity,alignment: .leading)
                TextField("Enter your user email address", text: $userEmail)
                    .textContentType(.username)
                    .autocorrectionDisabled()
                    .textInputAutocapitalization(.never)
                    .keyboardType(.emailAddress)
                Button {
                    Task {
                        if await userVM.authenticateUser(userEmail: userEmail) {
                            dismiss()
                        }
                    }
                } label: {
                    Text("Access")
                }
                .buttonStyle(.borderedProminent)
                .padding(.top)

            } label: {
                Text("Start reading some books!")
                    .bold()
                    .padding(.bottom)
            }
            .textFieldStyle(.roundedBorder)
        }
        .padding()
        .alert(userVM.userAlertHeadMsg, isPresented: $userVM.showAlerUser) {
            Button(action: {}) {
                Text("OK")
            }
        } message: {
            Text(userVM.userAlertMsg)
        }
    }
}

struct LoginComponent_Previews: PreviewProvider {
    static var previews: some View {
        LoginComponent()
            .environmentObject(UserViewModel())
    }
}
