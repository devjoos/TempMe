//
//  ContentView.swift
//  TempMe
//
//  Created by Sam Joos on 8/5/22.
//

// select a temp to convert, sgmented - section one
// select a second segmented temp - the output - section 2
// text field for the temp - section one temp
// text field showing the result

import SwiftUI

struct ContentView: View {
    let tempSelect = ["Fahrenheit ℉", "Celsius ℃", "Kelvin"]
    @State private var selectedCurrentTemp = "Fahrenheit ℉"
    @State private var selectedOutputTemp = "Celsius ℃"
    @State private var tempInput = 32.0
    
    var convertedTemp: Double {
        var FtoC = tempInput
        if selectedCurrentTemp == "Fahrenheit ℉" && selectedOutputTemp == "Celsius ℃" {
            let temp = (tempInput - 32) * 5/9
            FtoC = temp
        } else if selectedCurrentTemp == "Fahrenheit ℉" && selectedOutputTemp == "Kelvin"  {
            let temp = (tempInput - 32) * 5/9 + 273.15
            FtoC = temp
        } else if selectedCurrentTemp == "Celsius ℃" && selectedOutputTemp == "Fahrenheit ℉" {
            let temp = tempInput * 9/5 + 32
            FtoC = temp
        } else if selectedCurrentTemp == "Celsius ℃" && selectedOutputTemp == "Kelvin" {
            let temp = tempInput + 273.15
            FtoC = temp
        } else if selectedCurrentTemp == "Kelvin" && selectedOutputTemp == "Fahrenheit ℉" {
            let temp = (tempInput - 273.15) * 9/5 + 32
            FtoC = temp
        } else if selectedCurrentTemp == "Kelvin" && selectedOutputTemp == "Celsius ℃" {
            let temp = tempInput - 273.15
            FtoC = temp
        }
        return FtoC
    }
    
    
    
    var body: some View {
        NavigationView {
            Form {
                Section(header: Text("Chose the temp scale to convert from")) {
                    Picker("Which temp to convert from", selection: $selectedCurrentTemp){
                        ForEach(tempSelect, id: \.self) {
                            Text($0)
                        }}
                    .pickerStyle(.segmented)
                    
                }
                Section(header: Text("Input a Temperture Amount")) {
                    TextField("Input a Temperture Amount", value: $tempInput, format: .number)
                }
                Section(header: Text("Chose the temp scale to convert to")) {
                    Picker("Which temp to convert from", selection: $selectedOutputTemp){
                        ForEach(tempSelect, id: \.self) {
                            Text($0)
                        }}
                    .pickerStyle(.segmented)
                }
                Section {
                    Text("\(tempInput.formatted()) \(selectedCurrentTemp) is \(convertedTemp.formatted()) in \(selectedOutputTemp)")
                }
                
            }
            
            .navigationTitle("TempMe")
        }
        
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
