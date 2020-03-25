//
//  ContentView.swift
//  Day16
//
//  Created by Pawan Kumar on 25/03/20.
//  Copyright © 2020 Pawan Kumar. All rights reserved.
//

import SwiftUI

struct ContentView: View {
    
    var studentsName: [String] =  ["Pawan","Pooja","Deepak"]
   @State  var selectedStudent: String  = "Pawan"
    var body: some View {
        NavigationView {
            Picker("select your student",selection: $selectedStudent) {
                ForEach(0 ..< self.studentsName.count) {
        Text("\(self.studentsName[$0])")
                }
            }
//                    Form {
//            //            TextField("Enter your name",text: $name)
//            //            Text("your name is \(name)")
////                        ForEach(1..<100) {
////                            Text("Row \($0)")
////                        }
//                    }
                .navigationBarTitle("Swift UI", displayMode: .automatic)
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
