//
//  DataParser.swift
//  glowing-enigma
//
//  Created by Antonin Boulnois on 31/01/2022.
//  Copyright © 2022 Antonin Boulnois. All rights reserved.
//

import Foundation


class Parser {
    
    var listSchedule:ListSchedule?
    var listSpeakers:ListSpeakers?
    var listTopics_Themes:ListTopics_Themes?
    var listEventLocation:ListEventLocation?
    
    var events:[Event]
    
  
    
    init(listSchedule:ListSchedule?, listSpeakers:ListSpeakers?, listTopics_Themes:ListTopics_Themes?,listEventLocation:ListEventLocation?){
        
        self.listSchedule = listSchedule
        self.listSpeakers = listSpeakers
        self.listTopics_Themes = listTopics_Themes
        self.listEventLocation = listEventLocation
        
        self.events = []
        
        
        
    }
    
    func parse() -> [Event] {
      
        
        if let records = listSchedule?.records {
            
            for schedule in records{
                       var item = Event()
                       item.id = schedule.id
                       item.type = schedule.fields?.type ?? ""
                       item.notes = schedule.fields?.notes ?? ""
                       item.activity = schedule.fields?.activity ?? ""
                       item.dateStart = schedule.fields?.dateStart ?? ""
                       item.dateEnd = schedule.fields?.dateEnd ?? ""
                       
                       
                       if let speakers = schedule.fields?.speakers{
                           for speakerId in speakers {
                               let speaker = self.getSpeakersFromId(id: speakerId)
                                if let speaker = speaker {
                                   item.speakers.append(speaker)
                                }
                           }
                       }
                       
                       if let themes = schedule.fields?.theme {
                           for themeId in themes {
                               let theme = self.getTopics_ThemesFromId(id: themeId)
                               if let theme = theme {
                               item.topics_themes.append(theme)
                                }
                           }
                       }
                       
                       if let locationId = schedule.fields?.location[0] {
                           let location = self.getLocationFromId(id: locationId)
                        if let location = location {
                           item.location = location
                        }
                       }
                       
                       events.append(item)
                   }
                   
                  
               }
         return events
        }
       
    
    
    
    func getLocationFromId(id: String) -> EventLocation? {
      
         let result = self.listEventLocation?.records.filter { $0.id == id }
            
         if result?.count ?? 0 >= 1 {
               return result![0]
               
           }
           else{
               return nil
           }
        
    }
    
    func getTopics_ThemesFromId(id: String) -> Topics_Themes? {
        let result = self.listTopics_Themes?.records.filter { $0.id == id }
        
        if result?.count ?? 0 >= 1 {
            return result![0]
            
        }
        else{
            return nil
        }
    }
    
    func getSpeakersFromId(id: String) -> Speaker? {
        
       let result = self.listSpeakers?.records.filter { $0.id == id }
        
        
        if result?.count ?? 0 >= 1 {
            return result![0]
            
        }
        else{
            return nil
        }
    
    }
    
}

extension Collection where Indices.Iterator.Element == Index {
    subscript (safe index: Index) -> Iterator.Element? {
        return indices.contains(index) ? self[index] : nil
    }
}
