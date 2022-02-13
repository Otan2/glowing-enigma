//
//  Builder2.swift
//  glowing-enigma
//
//  Created by Antonin Boulnois on 13/02/2022.
//  Copyright © 2022 Antonin Boulnois. All rights reserved.
//

import Foundation
import SwiftUI

struct Block: View {
    var event:Event
   
    let newFormatter = ISO8601DateFormatter()
    var dateFormatter = DateFormatter()
    

    
    init(event:Event) {
        self.event = event
        
        dateFormatter.dateFormat = "MMM d, h:mm a"
       
    }
    
    var body: some View {
        VStack(alignment: .leading) {
            Text(self.event.activity)
                 //.fontWeight(.bold)
                 .font(.system(size: 25))
                .padding(10)
                    HStack {
                        Text(self.event.type)
                            .font(.subheadline)
                        Spacer()
                        Text(self.dateFormatter.string(from: self.newFormatter.date(from: self.event.dateStart) ?? Date()) )
                       
                       
                      
                    }
                }
                .padding()

    }
}
