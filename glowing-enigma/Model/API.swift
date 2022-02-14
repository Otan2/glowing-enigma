//
//  API.swift
//  glowing-enigma
//
//  Created by Antonin Boulnois on 31/01/2022.
//  Copyright © 2022 Antonin Boulnois. All rights reserved.
//

import Foundation

class API:ObservableObject {
@Published var loaded:Bool = false
@Published var parsed:Bool = false
@Published var records:[Event] = []
@Published var caughtError:Bool = false
@Published var errorObject:(errorType: TypeError?, errorMessage: String?)?
var listSchedule:ListSchedule?

var listSpeakers:ListSpeakers?
var listTopics_Themes:ListTopics_Themes?
var listEventLocation:ListEventLocation?


    
    
    
    
    enum TypeError {
        case Success
        case Error
        case ErrorHttpResponce
        
        var toString : String {
          switch self {
        
          case .Success: return "Success"
          case .Error: return "Error"
          case .ErrorHttpResponce: return "ErrorHttpResponce"
          }
        }
}
    
    init(){
        self.loadData()
    }

    func loadData() {
        self.getScheduleList{
            error,data in
            
            if error.errorType == API.TypeError.Success
            {
                     self.listSchedule = data
                     self.getEventLocationList{
                               error,data in
                               
                               if error.errorType == API.TypeError.Success
                               {
                                   self.listEventLocation = data
                                   self.getSpeakersList{
                                       error,data in
                                                  
                                      if error.errorType == API.TypeError.Success
                                      {
                                            self.listSpeakers = data
                                            self.getTopics_ThemesList{
                                                       error,data in
                                                                             
                                                     if error.errorType == API.TypeError.Success
                                                     {
                                                           self.listTopics_Themes = data
                                                        let parser = Parser(listSchedule: self.listSchedule, listSpeakers: self.listSpeakers, listTopics_Themes: self.listTopics_Themes, listEventLocation: self.listEventLocation)
                                                            let events_temp = parser.parse()
                                                           
                                                            DispatchQueue.main.async {
                                                                self.records = events_temp
                                                                self.parsed = true
                                                                         }
                                                        
                                                     }
                                                     else {
                                                         DispatchQueue.main.async {
                                                             self.caughtError = true
                                                             self.errorObject = error
                                                        }
                                                     }
                                                                 
                                                       
                                                   }
                                      }
                                      else {
                                         DispatchQueue.main.async {
                                              self.caughtError = true
                                              self.errorObject = error
                                        }
                                      }
                                                  
                                      
                                   }
                               }
                               else {
                                    DispatchQueue.main.async {
                                       self.caughtError = true
                                       self.errorObject = error
                                }
                               }
                               
                              
                           }
                 
                
            }
            else {
                     DispatchQueue.main.async {
                    self.caughtError = true
                    self.errorObject = error
                }
            }
            
           
        }
        

      

        

       
         print(self.caughtError)

    }
    
func createRequest(urlStr: String,method: String) -> URLRequest {
        let url = URL(string: urlStr)!
        let token = "key4hyVs8ERbFO7Em"
        
        var request = URLRequest(url: url)
        request.httpMethod = method
        request.addValue("Bearer "+token,forHTTPHeaderField: "Authorization")
        
        return request
    }

    func getScheduleList(callback: @escaping ((errorType: TypeError?, errorMessage: String?),ListSchedule?) -> Void) {
       let session = URLSession(configuration: .default)
       let task = session.dataTask(with: createRequest(urlStr: "https://api.airtable.com/v0/appXKn0DvuHuLw4DV/Schedule",method:"GET")) { (data, response, error) in
           
           if let data = data, error == nil {
               let responseHttp =  response as? HTTPURLResponse
               if responseHttp?.statusCode == 200 {
                   let list = try? JSONDecoder().decode(ListSchedule.self, from: data)
                   callback((TypeError.Success,"nil"),list)
               }
               callback((TypeError.ErrorHttpResponce,String(responseHttp!.statusCode)),nil)
           }
           else{
           callback((TypeError.Error,error.debugDescription),nil)
           }
       }
       
       task.resume()
   }
    
    func getEventLocationList(callback: @escaping ((errorType: TypeError?, errorMessage: String?),ListEventLocation?) -> Void) {
          let session = URLSession(configuration: .default)
          let task = session.dataTask(with: createRequest(urlStr: "https://api.airtable.com/v0/appXKn0DvuHuLw4DV/Event%20locations",method:"GET")) { (data, response, error) in
              
              if let data = data, error == nil {
                  let responseHttp =  response as? HTTPURLResponse
                  if responseHttp?.statusCode == 200 {
                      let list = try? JSONDecoder().decode(ListEventLocation.self, from: data)
                      callback((TypeError.Success,"nil"),list)
                  }
                  callback((TypeError.ErrorHttpResponce,String(responseHttp!.statusCode)),nil)
              }
              else{
              callback((TypeError.Error,error.debugDescription),nil)
              }
          }
          
          task.resume()
      }
    
    func getTopics_ThemesList(callback: @escaping ((errorType: TypeError?, errorMessage: String?),ListTopics_Themes?) -> Void) {
             let session = URLSession(configuration: .default)
             let task = session.dataTask(with: createRequest(urlStr: "https://api.airtable.com/v0/appXKn0DvuHuLw4DV/Topics%20%26%20themes",method:"GET")) { (data, response, error) in
                 
                 if let data = data, error == nil {
                     let responseHttp =  response as? HTTPURLResponse
                     if responseHttp?.statusCode == 200 {
                         let list = try? JSONDecoder().decode(ListTopics_Themes.self, from: data)
                         callback((TypeError.Success,"nil"),list)
                     }
                     callback((TypeError.ErrorHttpResponce,String(responseHttp!.statusCode)),nil)
                 }
                 else{
                 callback((TypeError.Error,error.debugDescription),nil)
                 }
             }
             
             task.resume()
         }

        func getSpeakersList(callback: @escaping ((errorType: TypeError?, errorMessage: String?),ListSpeakers?) -> Void) {
            let session = URLSession(configuration: .default)
            let task = session.dataTask(with: createRequest(urlStr: "https://api.airtable.com/v0/appXKn0DvuHuLw4DV/Speakers%20%26%20attendees",method:"GET")) { (data, response, error) in
                
                if let data = data, error == nil {
                    let responseHttp =  response as? HTTPURLResponse
                    if responseHttp?.statusCode == 200 {
                        let list = try? JSONDecoder().decode(ListSpeakers.self, from: data)
                        callback((TypeError.Success,"nil"),list)
                    }
                    callback((TypeError.ErrorHttpResponce,String(responseHttp!.statusCode)),nil)
                }
                else{
                callback((TypeError.Error,error.debugDescription),nil)
                }
            }
            
            task.resume()
        }

}
