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
    @State private var credentials:Credentials = Credentials()
    
    var body: some View {
        VStack{
            Image("CitadelsLogo")
                .resizable()
                .scaledToFit()
                .shadow(radius: 10)
                .padding(50)
            Spacer()
                .frame(height: 175)
            TextField("Username", text: $credentials.username)
                .textFieldStyle(RoundedBorderTextFieldStyle())
                .textContentType(.username)
                .padding(.horizontal, 80)
                .padding(.vertical, 10)
            SecureField("Password", text: $credentials.password)
                .textContentType(.password)
                .textFieldStyle(RoundedBorderTextFieldStyle())
                .padding(.horizontal, 80)
                .padding(.vertical, 10)
            HStack{
                Button(action:{
                    self.GM.login(username: self.credentials.username, password: self.credentials.password)
                }){
                    ZStack{
                        RoundedRectangle(cornerRadius: 10)
                        Text("Log In")
                            .font(.custom("Albertus Medium", size: 20))
                            .foregroundColor(.white)
                    }
                    .frame(width:100, height:50)
                }
                .padding()
                Button(action:{
                    
                }){
                    ZStack{
                        RoundedRectangle(cornerRadius: 10)
                        Text("Sign Up")
                            .font(.custom("Albertus Medium", size: 20))
                            .foregroundColor(.white)
                    }
                    .frame(width:100, height:50)
                }
                .padding()
            }
            Spacer()
        }
        .background(Image("LoginBG"))
    }
}

struct LoginView_Previews: PreviewProvider {
    static var previews: some View {
        LoginView()
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
