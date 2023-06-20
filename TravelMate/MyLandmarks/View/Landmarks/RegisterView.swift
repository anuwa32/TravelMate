//
//  RegisterView.swift
//  MyLandmarks
//
//  Created by anupriya on 2023-06-13.
//

import SwiftUI

struct RegisterView: View {
    @StateObject var viewModel = RegisterViewModel()
    
    var body: some View {
        VStack {
            //Header
            HeaderView(title: "Wonder Of Nature",
                        subtitle: "Register Here",
                        angle: -15,
                        background: .blue)
            
            Form {
                TextField("Enter your name", text: $viewModel.name)
                    .textFieldStyle(RoundedBorderTextFieldStyle())
                    .autocorrectionDisabled()
                    
                TextField("Enter your email address", text: $viewModel.email)
                    .textFieldStyle(RoundedBorderTextFieldStyle())
                    .autocapitalization(.none)
                    .autocorrectionDisabled()
                    
                SecureField("Enter your password", text: $viewModel.password)
                    .textFieldStyle(RoundedBorderTextFieldStyle())
                    
                
                ButtonView(title: "Register", background: .blue){
                    //Attempt Registration
                    viewModel.register()
                }
                .padding(.top, 20)
                    
            }
            .offset(y: -5)
            Spacer()
        }
    }
}

struct RegisterView_Previews: PreviewProvider {
    static var previews: some View {
        RegisterView()
    }
}
