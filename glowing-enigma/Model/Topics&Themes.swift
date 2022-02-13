//
//  Topics&Themes.swift
//  glowing-enigma
//
//  Created by Antonin Boulnois on 31/01/2022.
//  Copyright © 2022 Antonin Boulnois. All rights reserved.
//

import Foundation

struct ListTopics_Themes: Codable {
    var records:[Topics_Themes]
}


struct Topics_Themes: Codable,Identifiable {
    var id:String
    var fields:Fields
    
    struct Fields: Codable {
        
        var theme:String
        
        enum CodingKeys: String, CodingKey {
            case theme = "Topic / theme"
        }
        
    }
    
}
