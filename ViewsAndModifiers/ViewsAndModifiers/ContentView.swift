//
//  ContentView.swift
//  ViewsAndModifiers
//
//  Created by Pawan Kumar on 31/05/20.
//  Copyright © 2020 Pawan Kumar. All rights reserved.
//

import SwiftUI

struct ContentView: View {
    @State var useRedText: Bool = true
    var body: some View {
        VStack {
            Text("Step 1")
                .font(.largeTitle)
                .blur(radius: 0)
            Text("Step 2")
            Text("Step 3")
            Text("Step 4")
        }
        .font(.title)
        .blur(radius: 3.0)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
