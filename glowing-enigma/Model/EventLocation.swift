//
//  EventLocation.swift
//  glowing-enigma
//
//  Created by Antonin Boulnois on 31/01/2022.
//  Copyright © 2022 Antonin Boulnois. All rights reserved.
//

import Foundation

struct ListEventLocation: Codable {
     var records:[EventLocation]
}

struct EventLocation: Codable {
    var id:String
      var fields:Fields?
      
      struct Fields: Codable {
        var name:String
        var location:String
        
        
        enum CodingKeys: String, CodingKey {
        case name = "Space name"
        case location = "Building location"
        }
    }
}
