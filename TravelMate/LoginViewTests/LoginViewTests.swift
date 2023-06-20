//
//  LoginViewTests.swift
//  LoginViewTests
//
//  Created by anupriya on 2023-06-16.
//

import XCTest
@testable import MyLandmarks

class LoginViewModelTests: XCTestCase {
    
    var viewModel: LoginViewModel!
    
    override func setUp() {
        super.setUp()
        viewModel = LoginViewModel()
    }
    
    override func tearDown() {
        viewModel = nil
        super.tearDown()
    }
    
    func testValidLogin() {
        // Arrange
        viewModel.email = "test@example.com"
        viewModel.password = "password"
        
        // Act
        viewModel.login()

    }
    
    func testInvalidLogin() {
        // Arrange
        viewModel.email = "iddgmailcom"
        viewModel.password = ""
        
        // Act
        viewModel.login()
        
    }
    

}

