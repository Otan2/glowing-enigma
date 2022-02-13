//
//  TestParser.swift
//  glowing-enigmaTests
//
//  Created by Antonin Boulnois on 13/02/2022.
//  Copyright © 2022 Antonin Boulnois. All rights reserved.
//

import XCTest
@testable import glowing_enigma

let listSchedule = ListSchedule.init(records: [Schedule(id: "id2", fields: Schedule.Fields.init(theme: ["id4"], speakers: ["id1"], notes: "note", dateEnd: "date", activity: "activity", type: "type", dateStart: "date", location: ["id3"]))])
let listSpeakers:ListSpeakers = ListSpeakers.init(records: [Speaker(id: "id1", fields:  Speaker.Fields(name: "NameSpeaker"))])
let listTopics_Themes = ListTopics_Themes.init(records: [Topics_Themes.init(id: "id4", fields: Topics_Themes.Fields.init(theme: "theme"))])
let listEventLocation = ListEventLocation.init(records: [EventLocation.init(id: "id3", fields: EventLocation.Fields.init(name: "name", location: "somewhere"))])

class TestParser: XCTestCase {
    
    
    
    var parser:Parser = Parser(listSchedule: listSchedule, listSpeakers: listSpeakers, listTopics_Themes: listTopics_Themes, listEventLocation: listEventLocation)


    
    
    override func setUpWithError() throws {
       
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    func testFuncGetLocationFromIdReturn() throws {
        let result = self.parser.getLocationFromId(id: "id3")
        
        XCTAssertEqual( result?.fields?.name, "name")
    }
    
    func testFuncFetTopics_ThemesFromIdReturn() throws {
        let result = self.parser.getTopics_ThemesFromId(id: "id4")
        
        XCTAssertEqual(result?.fields.theme, "theme")
    }
    
    func testfuncGetSpeakersFromIdResult() throws {
        let result = self.parser.getSpeakersFromId(id: "id1")
        
        XCTAssertEqual(result?.fields.name, "NameSpeaker")
        
    }
    
    func testFuncParserReturn() throws {
        let result = self.parser.parse()
        
        
        XCTAssertEqual(result[0].id, "id2")
        XCTAssertEqual(result[0].activity, "activity")
        XCTAssertEqual(result[0].dateEnd, "date")
        XCTAssertEqual(result[0].dateStart, "date")
        XCTAssertEqual(result[0].notes, "note")
        // Missing fields are tested separately
    }
}
