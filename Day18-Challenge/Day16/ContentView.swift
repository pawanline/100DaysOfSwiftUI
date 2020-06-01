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
    @State var numberOFPeople: String = "2"
    @State var tipPercentage: Int = 0
    
    var totalPerPerson: Double {
        let peopleCount = Double(numberOFPeople) ?? 0
        let tipSelection = Double(tipPercentages[tipPercentage])
        let orderAmount = Double(checkAmount) ?? 0

        let tipValue = orderAmount / 100 * tipSelection
        let grandTotal = orderAmount + tipValue
        let amountPerPerson = grandTotal / peopleCount

        return amountPerPerson
    } 
    
    var totalAmountForCheck: Double {
             let tipSelection = Double(tipPercentages[tipPercentage])
             let orderAmount = Double(checkAmount) ?? 0

             let tipValue = orderAmount / 100 * tipSelection
             let grandTotal = orderAmount + tipValue

             return grandTotal
    }
    
    var tipPercentages: [Int] = [0,5,10,15,20]
    var body: some View {
        NavigationView {
            Form {
                Section(header: Text("Enter Bill Amount")){
                    TextField("Amount",text: $checkAmount)
                        .keyboardType(.decimalPad)
                }
                
                Section(header: Text("Number of People")) {
                    TextField("Number of people",text: $numberOFPeople)
                        .keyboardType(.numberPad)
                }
                
                Section(header: Text("How much tips you want to leave")) {
                    Picker("tip percentatge",selection: $tipPercentage) {
                        ForEach (0 ..< self.tipPercentages.count) {
                            Text("\(self.tipPercentages[$0])%")
                        }
                    }
                    .pickerStyle(SegmentedPickerStyle())
                }
                
                Section(header: Text("Total amount for check")) {
                    if tipPercentage == 0 {
                        Text("$\(totalAmountForCheck,specifier: "%.2f")")
                            .background(Color.red)
                    } else {
                        Text("$\(totalAmountForCheck,specifier: "%.2f")")
                        .background(Color.clear)
                    }
                }
                Section(header: Text("Amount per person")) {
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
