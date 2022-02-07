//
//  Speakers.swift
//  glowing-enigma
//
//  Created by Antonin Boulnois on 31/01/2022.
//  Copyright © 2022 Antonin Boulnois. All rights reserved.
//

import Foundation

struct ListSpeakers: Codable {
    var records:[Speaker]
}


struct Speaker: Codable, Identifiable {
    var id:String
    var fields:Fields
    
    struct Fields: Codable {
        
        var name:String
        
        enum CodingKeys: String, CodingKey {
            case name = "Name"
        }
        
    }
    
}
