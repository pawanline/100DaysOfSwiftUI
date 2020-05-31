//
//  ContentView.swift
//  ViewsAndModifiers
//
//  Created by Pawan Kumar on 31/05/20.
//  Copyright © 2020 Pawan Kumar. All rights reserved.
//

import SwiftUI

struct ContentView: View {
    let text1 = Text("Text 1")
    var motto: some View {
        HStack {
             Text("fsfsf")
             Text("fsfsf")
             Text("fsfsf")
             Text("fsfsf")
        }
       
    }
    let text2 = Text("Text 2")
    var body: some View {
        VStack {
           text1
        text2
            motto
    }
}
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
