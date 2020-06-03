//
//  ContentView.swift
//  BetterRest
//
//  Created by Pawan Kumar on 04/06/20.
//  Copyright © 2020 Pawan Kumar. All rights reserved.
//

import SwiftUI

struct ContentView: View {
    
    @State var wakeUpDate = Date()
    var body: some View {
//        let now = Date()
//        let tomorrow = now.addingTimeInterval(86400)
        DatePicker("Please enter a Date", selection: $wakeUpDate, in: Date()...)
        .labelsHidden()
        
        }
    func dateformatting() {
        var components = DateComponents()
        components.hour = 8
        components.minute = 0

        let date = Calendar.current.date(from: components) ?? Date()

        let componentsTest = Calendar.current.dateComponents([.hour,.minute], from: Date())
        let hour = componentsTest.hour ?? 0
        let minute = componentsTest.minute ?? 0

        let fomatter = DateFormatter()
        fomatter.dateStyle = .medium
        let dateString = fomatter.string(from: Date())

    }
    }

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
