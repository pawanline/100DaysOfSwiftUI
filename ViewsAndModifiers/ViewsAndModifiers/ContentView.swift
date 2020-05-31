//
//  ContentView.swift
//  ViewsAndModifiers
//
//  Created by Pawan Kumar on 31/05/20.
//  Copyright © 2020 Pawan Kumar. All rights reserved.
//

import SwiftUI

struct CapsuleText: View {
    var text: String
    
    var body: some View {
        Text(text)
        .font(.largeTitle)
        .padding()
            
        .foregroundColor(.white)
        .background(Color.blue)
            .clipShape(Capsule())
    }
}
struct ContentView: View {
    var body: some View {
        VStack {
            CapsuleText(text: "First One")
                .padding()
            CapsuleText(text: "Second One")
    }
}
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
