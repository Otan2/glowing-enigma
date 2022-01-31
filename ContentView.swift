//
//  ContentView.swift
//  glowing-enigma
//
//  Created by Antonin Boulnois on 31/01/2022.
//  Copyright © 2022 Antonin Boulnois. All rights reserved.
//

import SwiftUI

struct ContentView: View {
    
    @State private var showDetails = false
    
    var body: some View {
        
        VStack(alignment: .leading) {
                    Button("Add event") {
                        showDetails.toggle()
                    }

                    if showDetails {
                        TextField("Title of the event", text: $name)
                        TextField("Start", text: $begin)
                        TextField("End", text: $end)
                        TextField("Theme", text: theme)
                        TextField("Location", text: location)
                    }
                }
        
        VStack {
            block(name: "Samba", begin: "0", end: "1", theme: "Danse", location: "Paris")
            block(name: "Samba", begin: "10", end: "11", theme: "Danse", location: "Paris")
        }
    }
    
    var rectangle: some View {
        let rectangle = Rectangle()
        return rectangle
            .fill(Color(red: 200, green: 200, blue: 255))
            //.stroke(Color.green)
            .frame(width: 250, height: 30)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
