//
//  Builder.swift
//  glowing-enigma
//
//  Created by goldorak on 31/01/2022.
//  Copyright © 2022 Antonin Boulnois. All rights reserved.
//

import Foundation
import SwiftUI

struct block: View {
    var name: String
    //var begin: Date
    //var end: Date
    var begin: String
    var end: String
    var theme: String
    var location: String
    
    //init(name: String, begin: Date, end: Date, theme: String, location: String) {
    init(name: String, begin: String, end: String, theme: String, location: String) {
        self.name = name
        self.begin = begin
        self.end = end
        self.theme = theme
        self.location = location
    }
    
    var body: some View {
        VStack(alignment: .leading) {
                    Text(name)
                        .font(.title)

                    HStack {
                        Text(theme)
                            .font(.subheadline)
                        Spacer()
                        Text(location)
                            .font(.subheadline)
                    }
                }
                .padding()

    }
}
