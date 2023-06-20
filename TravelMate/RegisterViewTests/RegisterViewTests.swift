//
//  RegisterViewTests.swift
//  RegisterViewTests
//
//  Created by anupriya on 2023-06-16.
//

import XCTest
@testable import MyLandmarks

class RegisterViewModelTests: XCTestCase {
    var viewModel: RegisterViewModel!
    
    override func setUp() {
        super.setUp()
        viewModel = RegisterViewModel()
    }
    
    override func tearDown() {
        viewModel = nil
        super.tearDown()
    }
    
    func testRegistrationWithValidInput() {
        // Set up valid input values
        viewModel.name = "Angelo mathews"
        viewModel.email = "dd@example.com"
        viewModel.password = "password123"
        
        // Perform registration
        viewModel.register()
        
    }
    
    func testRegistrationWithInvalidInput() {
        // Set up invalid input values
        viewModel.name = ""
        viewModel.email = "ddddddd"
        viewModel.password = "short"
        
        // Perform registration
        viewModel.register()
        
    }
    
}

