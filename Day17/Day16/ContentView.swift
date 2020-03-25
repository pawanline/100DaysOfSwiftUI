//
//  ContentView.swift
//  Day16
//
//  Created by Pawan Kumar on 25/03/20.
//  Copyright © 2020 Pawan Kumar. All rights reserved.
//

import SwiftUI

struct ContentView: View {
 
    @State var checkAmount: String = ""
    @State var numberOFPeople: Int = 2
    @State var tipPercentage: Int = 2
    
    var totalPerPerson: Double {
        let peopleCount = Double(numberOFPeople + 2)
        let tipSelection = Double(tipPercentages[tipPercentage])
        let orderAmount = Double(checkAmount) ?? 0

        let tipValue = orderAmount / 100 * tipSelection
        let grandTotal = orderAmount + tipValue
        let amountPerPerson = grandTotal / peopleCount

        return amountPerPerson
    }
    
    var tipPercentages: [Int] = [5,10,15,20]
    var body: some View {
        NavigationView {
            Form {
                Section {
            TextField("Amount",text: $checkAmount)
                .keyboardType(.decimalPad)
               
                    Picker("Number of people",selection: $numberOFPeople) {
                        ForEach ( 0 ..< 100) {
                            Text("\($0) people")
                        }
                    }
                }
                
                Section(header: Text("How much tips you want to leave")) {
                    Picker("tip percentatge",selection: $tipPercentage) {
                        ForEach (0 ..< self.tipPercentages.count) {
                            Text("\(self.tipPercentages[$0])%")
                        }
                    }
                .pickerStyle(SegmentedPickerStyle())
                }
                Section {
                   Text("$\(totalPerPerson, specifier: "%.2f")")
                }
            }
            .navigationBarTitle("We Split", displayMode: .automatic)
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
