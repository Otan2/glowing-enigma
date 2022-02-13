//
//  Dateformatter.swift
//  glowing-enigma
//
//  Created by Antonin Boulnois on 13/02/2022.
//  Copyright © 2022 Antonin Boulnois. All rights reserved.
//

import Foundation
import SwiftUI

class DateHandler {
    var dateISO:String
    let newFormatter = ISO8601DateFormatter()
    var dateFormatter = DateFormatter()
    
    var dateDate:Date = Date()
    var dateString:String = ""
    
    init(date:String){
        self.dateISO = date
         dateFormatter.dateFormat = "MMM d, h:mm a"
        
        self.ISO8601toDate()
        self.DatetoString()
    }
  
    
    func ISO8601toDate()  {
        self.dateDate = self.newFormatter.date(from: self.dateISO) ?? Date()
    }
    
    func DatetoString() {
        self.dateString =  self.dateFormatter.string(from: self.dateDate)
    }
    
  
    
}
