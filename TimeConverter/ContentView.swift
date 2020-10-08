//
//  ContentView.swift
//  TimeConverter
//
//  Created by Amber Spadafora on 10/8/20.
//  Copyright © 2020 Amber Spadafora. All rights reserved.
//

import SwiftUI

struct ContentView: View {
    @State private var amount: String = ""
    @ObservedObject var timeConverter = TimeConverter()
    
    var enteredAmount: Double {
        return Double(amount) ?? 0
    }
    var conversion: Double {
        print("original Unit: \(timeConverter.originalUnit)  convertedUnit: \(timeConverter.convertedUnit)")
        if let enteredAmountToConvert = Double(amount) {
            return timeConverter.convert(original: enteredAmountToConvert)
        } else {
            print("Could not convert \(amount) to a Double")
            return 0
        }
    }
    
    var body: some View {
        NavigationView {
            Form {
                Section(header: Text("Choose the units you would like to convert between")) {
                    Picker("Original Unit", selection: $timeConverter.originalUnit) {
                        ForEach(0..<TimeConverter.units.count) {
                            Text("\(TimeConverter.units[$0])")
                        }
                    }
                    Picker("Converted Unit", selection: $timeConverter.convertedUnit) {
                        ForEach(0..<TimeConverter.units.count) {
                            Text("\(TimeConverter.units[$0])")
                        }
                    }
                }
                Section(header: Text("Enter an amount to convert")) {
                    TextField("\(TimeConverter.units[timeConverter.originalUnit])", text: $amount).keyboardType(.decimalPad)
                }
                Section(header: Text("Converted amount")) {
                    
                    
                    Text("\(enteredAmount) \(TimeConverter.units[timeConverter.originalUnit]) equals \(conversion) \(TimeConverter.units[timeConverter.convertedUnit])")
                }
            }.navigationBarTitle("Time Conversion")
        }
    }
    
    
    
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView(timeConverter: TimeConverter())
    }
}
