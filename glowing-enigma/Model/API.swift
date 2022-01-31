//
//  API.swift
//  glowing-enigma
//
//  Created by Antonin Boulnois on 31/01/2022.
//  Copyright © 2022 Antonin Boulnois. All rights reserved.
//

import Foundation

class API {

enum TypeError {
        case Success
        case Error
        case ErrorHttpResponce
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

}
