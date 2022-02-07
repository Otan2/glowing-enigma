//
//  Event.swift
//  glowing-enigma
//
//  Created by Antonin Boulnois on 31/01/2022.
//  Copyright © 2022 Antonin Boulnois. All rights reserved.
//

import Foundation


struct Event: Identifiable {
    var id:String = ""
    var notes:String = ""
    var dateEnd:String = ""
    var activity:String = ""
    var type:String = ""
    var dateStart:String = ""
    var speakers:[Speaker] = []
    var topics_themes:[Topics_Themes] = []
    var location:EventLocation?
}
