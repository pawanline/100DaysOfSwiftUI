//
//  ContentView.swift
//  ViewsAndModifiers
//
//  Created by Pawan Kumar on 31/05/20.
//  Copyright © 2020 Pawan Kumar. All rights reserved.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        Text("Hello World")
        .padding()
        .background(Color.red)
        .padding()
        .background(Color.blue)
        .padding()
        .background(Color.yellow)

    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
