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
        if self.useRedText {
            return Text("Hello world")
                .background(Color.green)
        } else {
            return Text("Hello Red View background Color")
                .background(Color.red)
        }

    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
