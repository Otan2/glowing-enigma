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
    
    let manager = API()
    var errorSchedule:API.TypeError?
    var errorEventLocation:API.TypeError?
    var errorTopics:API.TypeError?
    var errorSpeaker:API.TypeError?
    
    override func setUpWithError() throws {
      
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

  
    
    func testFuncGetScheduleListReturnParametersSuccessful() throws {
       
        let expectation = XCTestExpectation(description: "Download Schedule")
        
       
            self.manager.getScheduleList
                {
                     (error,response) in
                   self.errorSchedule = error.errorType
                    
                     expectation.fulfill()
            }
        
        wait(for: [expectation], timeout: 5.0)
         XCTAssertEqual(self.errorSchedule, API.TypeError.Success)
        
    }
    
    func testFuncGetEventLocationListReturnParametersSuccessful() throws {
       
        let expectation = XCTestExpectation(description: "Download Event Location")
        
        self.manager.getEventLocationList()
            {
                 (error,response) in
             
                self.errorEventLocation = error.errorType
                
                 expectation.fulfill()
               
              
        }
        
         wait(for: [expectation], timeout: 5.0)
        
        XCTAssertEqual(self.errorEventLocation, API.TypeError.Success)
       
        
    }
    
    func testFuncGetTopics_ThemesListReturnParametersSuccessful() throws {
      
        let expectation = XCTestExpectation(description: "Download Topics and Themes")
       
        self.manager.getTopics_ThemesList()
            {
                 (error,response) in
                 self.errorTopics = error.errorType
                                   
                                   
                 expectation.fulfill()
        }
        
        wait(for: [expectation], timeout: 5.0)
         XCTAssertEqual(self.errorTopics, API.TypeError.Success)
    }
    
    func testFuncGetSpeakersListReturnParametersSuccessful() throws {
      
        let expectation = XCTestExpectation(description: "Download Speakers")
       
        self.manager.getSpeakersList()
            {
                 (error,response) in
                 self.errorSpeaker = error.errorType
                                   
                expectation.fulfill()
        }
        
        wait(for: [expectation], timeout: 5.0)
        XCTAssertEqual(self.errorSpeaker, API.TypeError.Success)
        
    }
    
    
  
    
   
    

}
    
   
