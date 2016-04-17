//
//  MeetUpGroupUITests.swift
//  MeetUpGroupUITests
//
//  Created by ChongSun on 29/03/2016.
//  Copyright © 2016 RMIT. All rights reserved.
//

import XCTest

class MeetUpGroupUITests: XCTestCase {
        
    override func setUp() {
        super.setUp()
        
        // Put setup code here. This method is called before the invocation of each test method in the class.
        
        // In UI tests it is usually best to stop immediately when a failure occurs.
        continueAfterFailure = false
        // UI tests must launch the application that they test. Doing this in setup will make sure it happens for each test method.
        XCUIApplication().launch()

        // In UI tests it’s important to set the initial state - such as interface orientation - required for your tests before they run. The setUp method is a good place to do this.
    }
    
    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        super.tearDown()
    }
    
    func testExample() {
        // Get a reference of app
        let app = XCUIApplication()
        
        // Test that the initial label text
        var string = app.staticTexts.elementMatchingType(.Any, identifier: "Password:").label
        XCTAssertEqual(string, "Password:")
        
        // Test that there is no image dispayed on the view
        XCTAssertEqual(app.images.count, 0)
        
        // Test that there is only 2 buttons on the view
        XCTAssertEqual(app.buttons.count, 2)
        
        //nevigation
        
        XCUIDevice.sharedDevice().orientation = .Portrait
        
        let typeInAnEmailAddressTextField = app.textFields["Type in an email address"]
        typeInAnEmailAddressTextField.tap()
        typeInAnEmailAddressTextField.typeText("abc")
        
        let moreNumbersKey = app.keys["more, numbers"]
        moreNumbersKey.tap()
        typeInAnEmailAddressTextField.typeText("@")
        
        let moreLettersKey = app.keys["more, letters"]
        moreLettersKey.tap()
        typeInAnEmailAddressTextField.typeText("gmail")
        moreNumbersKey.tap()
        typeInAnEmailAddressTextField.typeText(".")
        moreLettersKey.tap()
        typeInAnEmailAddressTextField.typeText("com")
        
        let typeInYourPasswordTextField = app.textFields["Type in your password"]
        typeInYourPasswordTextField.tap()
        typeInYourPasswordTextField.typeText("abc")
        app.otherElements.containingType(.StaticText, identifier:"MeetUp Group").element.tap()
        app.buttons["Login"].tap()
        
        

        
        // Test the Name label
        string = app.staticTexts.elementMatchingType(.Any, identifier: "Name").label
        XCTAssertEqual(string, "Name")
        
        let meNavigationBar = app.navigationBars["Me"]
        
        var editButton = meNavigationBar.buttons["Edit"]
        var buttonLabel = editButton.label
        XCTAssertEqual(buttonLabel,  "Edit")
        
        //The title of the button changed after tapped
        XCTAssertEqual(editButton.exists,true)
        editButton.tap()
        XCTAssertEqual(editButton.exists,false)
        
        editButton = meNavigationBar.buttons["Confirm"]
        buttonLabel = editButton.label
        XCTAssertEqual(buttonLabel,  "Confirm")
    }
    
}
