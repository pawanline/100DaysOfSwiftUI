//
//  ContentView.swift
//  GuessTheFlag
//
//  Created by Pawan Kumar on 08/04/20.
//  Copyright © 2020 Pawan Kumar. All rights reserved.
//

import SwiftUI

struct ContentView: View {
    @State private var showingAlert = false
    var body: some View {
        Button("showing Alert") {
            self.showingAlert = true
        }
        .alert(isPresented: $showingAlert) {
            Alert(title: Text("This is a test Alert"), message: Text("Are you liking the alert?"), dismissButton: .default(Text("Ok")))
        }
        }
    }

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
