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
     
        VStack{
            if listEvents.parsed == true {
                List(listEvents.records) { event in
                    Block(event: event)
                }
            }
            else{
                 Text("Loading data ...")
                 
            }
      
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
