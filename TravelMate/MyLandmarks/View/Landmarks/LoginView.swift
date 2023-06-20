//
//  LoginView.swift
//  MyLandmarks
//
//  Created by anupriya on 2023-06-13.
//

import SwiftUI

struct LoginView: View {
    
    @StateObject var viewModel = LoginViewModel()
    //@SceneStorage("isLoggedIn") var isLoggedIn = false
    
    var body: some View {
        NavigationView{
            VStack {
                //Header
                HeaderView(title: "Wonder Of Nature",
                           subtitle: "Get things done",
                           angle: 15,
                           background: .blue)
                                
                //Login form
                Form {
                    //Chech error message occurs
                    if !viewModel.errorMessage.isEmpty {
                        Text(viewModel.errorMessage)
                            .foregroundColor(Color.red)
                    }
                    
                    TextField("Enter your email address", text: $viewModel.email)
                        .textFieldStyle(RoundedBorderTextFieldStyle())
                        .autocapitalization(.none)
                        
                    
                    SecureField("Enter your password", text: $viewModel.password)
                        .textFieldStyle(RoundedBorderTextFieldStyle())
                        

                    ButtonView(title: "Log In", background: .blue){
                        //Attempt Log In
                        viewModel.login()
                    }
                    .padding()
                    
                }
                .offset(y: -50)
                //Create a Account
                VStack {
                    Text("New user?")
                    NavigationLink("Create An Account", destination: RegisterView())
                }
                .padding(.bottom, 50)
                
                Spacer()
            }
        }
    }
}

struct LoginView_Previews: PreviewProvider {
    static var previews: some View {
        LoginView()
    }
}
