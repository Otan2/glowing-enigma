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
    var dateFormatter = DateFormatter()
    let isoDateFormatter = ISO8601DateFormatter()
    var dateDate:Date?
    var dateString:String = ""
    
    init(date:String){
        self.dateISO = date
        dateFormatter.dateFormat = "MMM d, h:mm a"
        
        
        isoDateFormatter.timeZone = TimeZone(abbreviation: "UTC")
        isoDateFormatter.formatOptions = [
            .withFullDate,
            .withFullTime,
            .withDashSeparatorInDate,
            .withFractionalSeconds]
        
        
        
        self.ISO8601toDate()
       
        self.DatetoString()
    }
  
    
    func ISO8601toDate()  {
        self.dateDate = self.isoDateFormatter.date(from: self.dateISO)
    }
    
    func DatetoString() {
        if let unwrapped = self.dateDate {
        self.dateString =  self.dateFormatter.string(from: unwrapped)
        }
       
    }
    
  
    
}
