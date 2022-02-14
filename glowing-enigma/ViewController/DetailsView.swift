//
//  Detail.swift
//  glowing-enigma
//
//  Created by Antonin Boulnois on 13/02/2022.
//  Copyright © 2022 Antonin Boulnois. All rights reserved.
//

import Foundation
import SwiftUI

struct Details: View {

    let event:Event
    
    var dateHandlerStart:DateHandler
    var dateHandlerEnd:DateHandler
    
    init(event:Event){
        self.event = event
        self.dateHandlerStart = DateHandler(date: event.dateStart)
        self.dateHandlerEnd = DateHandler(date: event.dateEnd)
    }
     
    var body : some View {
        VStack{
            Text(self.event.activity)
            .padding(10)
                .font(.title)
            Text(self.event.type)
                .foregroundColor(Color.white)
                .padding()
                .background(LinearGradient(gradient: Gradient(colors: [Color.red, Color.orange]), startPoint: .leading, endPoint: .trailing))
                .cornerRadius(15.0)
            .padding(10)
                
            HStack{
                Text("From: " + self.dateHandlerStart.dateString)
                Spacer()
                Text("To: " + self.dateHandlerEnd.dateString)
            }
            
            VStack{
          Text("Speaker(s):")
                .fontWeight(.bold)
                .padding(10)
                
           
            
           if (self.event.speakers.count > 1){
              List(self.event.speakers) {
                   speaker in
                  Text(speaker.fields.name)
                  }
          }
           else if (self.event.speakers.count != 0){
              Text(self.event.speakers[0].fields.name)
          }
           else {
                Text("no information about the speaker(s)...")
                }
            
            Text("Theme(s) and Topic(s):")
            .fontWeight(.bold)
            .padding(10)
              
            if (self.event.topics_themes.count > 1){
                
                List(self.event.topics_themes) {
                      topic in
                      Text(topic.fields.theme)
                  }
            }
            else if (self.event.topics_themes.count != 0){
                Text(self.event.topics_themes[0].fields.theme)
            }
            else {
                Text("no information about the topic...")
            }
            
            
             if (self.event.notes != ""){
                Text("Notes from speaker(s):")
                    .fontWeight(.bold)
                .padding(10)
             
                Text(self.event.notes)
                .padding(10)
            }
            Text("Location:")
                .fontWeight(.bold)
            .padding(10)
            Text(self.event.location?.fields?.location ?? "")
             .frame(alignment: .leading)
            Text(self.event.location?.fields?.name ?? "")
             .frame(alignment: .leading)
                
            Spacer()
            }
        }
        
    }
}
