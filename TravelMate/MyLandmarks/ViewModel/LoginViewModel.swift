//
//  LoginViewModel.swift
//  MyLandmarks
//
//  Created by anupriya on 2023-06-13.
//

import FirebaseAuth
import Foundation

class LoginViewModel: ObservableObject {
    
    @Published var email = ""
    @Published var password = ""
    @Published var errorMessage = ""
    
    init() {}
    
    func login(){
        guard validate() else {
            return
        }
        
        //Try to log in
        Auth.auth().signIn(withEmail: email, password: password) 
    }
    
    private func validate() -> Bool{
        
        errorMessage = ""
        guard !email.trimmingCharacters(in: .whitespaces).isEmpty,
              !password.trimmingCharacters(in: .whitespaces).isEmpty else {
            errorMessage = "Please Fill in all fields."
            return false
        }
        
        //email validation
        guard email.contains("@") && email.contains(".") else {
            errorMessage = "Please enter valid email."
            return false
        }
        
        return true
    }
    

}
