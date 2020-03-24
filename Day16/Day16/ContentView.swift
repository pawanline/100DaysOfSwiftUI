//
//  ContentView.swift
//  Day16
//
//  Created by Pawan Kumar on 25/03/20.
//  Copyright © 2020 Pawan Kumar. All rights reserved.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        NavigationView {
            Form {
                      Section {
                          Text("Hello World")
                      }
                  }
        }
        .navigationBarTitle(Text("Hello"))
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
