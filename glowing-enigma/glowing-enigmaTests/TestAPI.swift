//
//  TestAPI.swift
//  glowing-enigmaTests
//
//  Created by Antonin Boulnois on 31/01/2022.
//  Copyright © 2022 Antonin Boulnois. All rights reserved.
//

import XCTest
@testable import glowing_enigma

class TestAPI: XCTestCase {

    override func setUpWithError() throws {
      
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

  
    
    func testFuncGetScheduleListReturnParametersSuccessful() throws {
        let manager = API()
        
        manager.getScheduleList
            {
                 (error,response) in
                XCTAssert(error.errorType == API.TypeError.Success)
                XCTAssert(response != nil)
        }
        
    }

}
    
   
