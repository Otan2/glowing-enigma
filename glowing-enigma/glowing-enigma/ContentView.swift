//
//  ContentView.swift
//  glowing-enigma
//
//  Created by Antonin Boulnois on 31/01/2022.
//  Copyright © 2022 Antonin Boulnois. All rights reserved.
//

import SwiftUI

struct ContentView: View {
    
   @ObservedObject var listEvents = API()
    
    var body: some View {
      NavigationView{
        VStack{
            if listEvents.parsed == true {
               
                List(listEvents.records) { event in
                    NavigationLink(destination: Details(event: event)) {
                    Block(event: event)
                    }
                }
            }
            else{
                 Text("Loading data ...")
                 
            }
        }
        }
        .navigationBarTitle(" Incomming events")

    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
