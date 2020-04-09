//
//  LoginView.swift
//  Citadels
//
//  Created by Yongkun Li on 4/8/20.
//  Copyright © 2020 Yongkun Li. All rights reserved.
//

import SwiftUI

struct LoginView: View {
    @EnvironmentObject var GM:GameManager
    @Binding var isAuthenticated:Bool
    
    @State private var credentials:Credentials = Credentials()
    
    var body: some View {
        VStack{
            TextField("Username", text: $credentials.username)
                .textFieldStyle(RoundedBorderTextFieldStyle())
                .textContentType(.username)
                .padding()
            SecureField("Password", text: $credentials.password)
                .textContentType(.password)
                .textFieldStyle(RoundedBorderTextFieldStyle())
                .padding()
            HStack{
                Button(action:{
                    self.GM.login(username: self.credentials.username, password: self.credentials.password)
                    self.isAuthenticated = self.GM.gs.isAuthenticated()
                }){
                    Text("Log In")
                }
                .padding()
                Button(action:{
                    
                }){
                    Text("Sign Up")
                }
                .padding()
            }
        }
        
    }
}

struct LoginView_Previews: PreviewProvider {
    @State static var isAuthenticated:Bool = false
    static var previews: some View {
        LoginView(isAuthenticated: $isAuthenticated)
    }
}


// security setting up
struct Credentials {
    var username: String = ""
    var password: String = ""
}

enum KeychainError: Error {
    case noPassword
    case unexpectedPasswordData
    case unhandledError(status: OSStatus)
}
