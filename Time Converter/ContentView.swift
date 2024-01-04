//
//  ContentView.swift
//  Time Converter
//
//  Created by Macmaurice Osuji on 2/4/23.
//

import SwiftUI

struct ContentView: View {
    @State private var inputUnit = "Second"
    @State private var outputUnit = "Second"
    @State private var inputValue1 = 0
    @FocusState private var valueIsFocused: Bool
    
    let units = ["Second", "Minute", "Hour", "Day"]
    
   
    var display: Double {
        let inputValue = Double(inputValue1)
        
        if inputUnit == "Second" {
            if outputUnit == "Minute" {
                return (inputValue / 60)
            }
            else if outputUnit == "Hour" {
                return (inputValue / 3600)
            }
            if outputUnit == "Day"{
                return (inputValue / 86400)
            }
        }
        else if inputUnit == "Minute" {
            if outputUnit == "Second" {
                return (inputValue * 60)
            }
            if outputUnit == "Hour" {
                return (inputValue / 60)
            }
            if outputUnit == "Day"{
            }
        }
        else if inputUnit == "Hour" {
            if outputUnit == "Minute" {
                return (inputValue * 60)
            }
            if outputUnit == "Second" {
                return (inputValue * 3600)
            }
            if outputUnit == "Day"{
                return (inputValue / 24)
            }
        }
        else if inputUnit == "Day" {
            if outputUnit == "Minute" {
                return (inputValue * 1440)
            }
            if outputUnit == "Hour" {
                return (inputValue * 24)
            }
            if outputUnit == "Second"{
                return (inputValue * 86400)
            }
        }
    
            return inputValue
    }
    var count: String {
        if display > 1 {
            return "s"
        }
        else {
            return ""
        }
        
    }
    
    
    var body: some View {
        NavigationView {
            Form {
                Section {
                    Picker("What unit is your input", selection: $inputUnit){
                        ForEach(units, id: \.self){
                            Text($0)
                        }
                    }
                    .pickerStyle(.segmented)
                } header: {
                    Text("from?")
                }
                Section {
                    Picker("What unit is your input", selection: $outputUnit){
                        ForEach(units, id: \.self){
                            Text($0)
                        }
                    }
                    .pickerStyle(.segmented)
                } header: {
                    Text("to?")
                }
                Section {
                    TextField("Input your value", value: $inputValue1, formatter:    NumberFormatter())
                        .keyboardType(.numberPad)
                        .focused($valueIsFocused)
                }header: {
                    Text("value:")
                }
                
                Section {
                    Text("\(display) \(outputUnit)\(count)")
                }
                    .navigationBarTitleDisplayMode(.inline)
                    .navigationBarTitle("Time Converter")
                    .toolbar{
                        ToolbarItemGroup(placement: .keyboard){
                            Spacer()
                            Button("Done"){
                                valueIsFocused = false
                        }
                    }
                }
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
