//
//  DataStructure.swift
//  glowing-enigma
//
//  Created by Antonin Boulnois on 31/01/2022.
//  Copyright © 2022 Antonin Boulnois. All rights reserved.
//

import Foundation

struct ListSchedule: Codable {
    var records:[Schedule]
}


struct Schedule: Codable {
    var id:String
    var fields:Fields?
    
    struct Fields: Codable {
        
        var theme:[String]?
        var speakers:[String]?
        var notes:String?
        var dateEnd:String
        var activity:String
        var type:String
        var dateStart:String
        var location:[String]
        
        enum CodingKeys: String, CodingKey {
            case theme = "Topic / theme"
            case speakers = "Speaker(s)"
            case dateEnd = "End"
            case activity = "Activity"
            case type = "Type"
            case dateStart = "Start"
            case location = "Location"
            case notes = "Notes"
        }
        
    }
    
}
