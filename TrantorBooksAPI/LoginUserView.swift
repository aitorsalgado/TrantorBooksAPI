//
//  LoginUserView.swift
//  TrantorBooksAPI
//
//  Created by Aitor Salgado on 28/3/23.
//

import SwiftUI

struct LoginUserView: View {
    //@ObservedObject var userVM:UserViewModel
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
