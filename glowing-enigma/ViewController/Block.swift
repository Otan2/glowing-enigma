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
   
    var dateHandler:DateHandler
    

    
    init(event:Event) {
        self.event = event
        
        self.dateHandler = DateHandler(date: event.dateStart)
       
    }
    
    var body: some View {
         
        VStack(alignment: .leading) {
            Text(self.event.activity)
                 .font(.system(size: 25))
                .padding(10)
                    HStack {
                        Text(self.event.type)
                            .font(.subheadline)
                        Spacer()
                        Text(self.dateHandler.dateString )
                       
                       
                      
                    }
                }
                .padding()

    
    }
    
}
