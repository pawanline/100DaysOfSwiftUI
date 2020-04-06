//
//  ContentView.swift
//  Day16
//
//  Created by Pawan Kumar on 25/03/20.
//  Copyright © 2020 Pawan Kumar. All rights reserved.
//

import SwiftUI

struct ContentView: View {
 
    @State var inputUnit: String = "Kelvin"
    @State var outputUnit: String = "Celsius"
    @State var inputNumber: String = ""
    var temperatureConversion : [String] = ["Celsius","Fahrenheit","Kelvin"]

    
    var convertedUnit: Double {
        var result: Double = 0
        if inputUnit == "Kelvin" {
            let kelvin = Measurement(value: Double(inputNumber) ?? 0.0, unit: UnitTemperature.kelvin)
            if outputUnit == "Celsius" {
                result = kelvin.converted(to: .celsius).value
            } else if outputUnit == "Fahrenheit" {
                result = kelvin.converted(to: .fahrenheit).value
            } else if outputUnit == "Kelvin" {
                result = kelvin.converted(to: .kelvin).value
            }
        } else if inputUnit == "Celsius" {
            let celsius = Measurement(value: Double(inputNumber) ?? 0.0, unit: UnitTemperature.celsius)
                       if outputUnit == "Kelvin" {
                           result = celsius.converted(to: .kelvin).value
                       } else if outputUnit == "Fahrenheit" {
                           result = celsius.converted(to: .fahrenheit).value
                       } else if outputUnit == "Celsius" {
                           result = celsius.converted(to: .celsius).value
                       }
        } else if inputUnit == "Fahrenheit" {
            let fahrenheit = Measurement(value: Double(inputNumber) ?? 0.0, unit: UnitTemperature.fahrenheit)
                                  if outputUnit == "Kelvin" {
                                      result = fahrenheit.converted(to: .kelvin).value
                                  } else if outputUnit == "Fahrenheit" {
                                      result = fahrenheit.converted(to: .fahrenheit).value
                                  } else if outputUnit == "Celsius" {
                                      result = fahrenheit.converted(to: .celsius).value
           }
        }
   
                return result
       }
   
    var body: some View {
        NavigationView {
            Form {
                Section(header: Text("Enter Bill Amount")) {
                    TextField("Amount",text: $inputNumber)
                        .keyboardType(.decimalPad)
                }
                Section(header: Text("Input Unit")) {
                    Picker("Input",selection: $inputUnit) {
                        ForEach (0 ..< self.temperatureConversion.count) {
                            Text("\(self.temperatureConversion[$1])")
                        }
                    }
                    .pickerStyle(SegmentedPickerStyle())
                }
            Section(header: Text("Output Unit")) {
                    Picker("Output unit",selection: $outputUnit) {
                        ForEach( 0 ..< self.temperatureConversion.count) {
                            Text("\(self.temperatureConversion[$0])")
                        }
                    }
                    .pickerStyle(SegmentedPickerStyle())
                    
                }
                
                Section(header: Text("Result")) {
                    Text("\(convertedUnit,specifier: "%.2f")")
                }
            }
            .navigationBarTitle("Temperature conversion", displayMode: .automatic)
        }
    }
}
struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
