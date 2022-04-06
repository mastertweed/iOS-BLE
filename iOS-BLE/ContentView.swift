//
//  ContentView.swift
//  iOS-BLE
//
//  Created by Alex Tweed on 4/4/22.
//  Copyright © 2022 Alex Tweed. All rights reserved.
//

import SwiftUI
import CoreBluetooth

var centralManager: CBCentralManager!

struct ContentView: View {
    @State var heartRate = 60
    @State var ledColor = Color.red
    
    @ObservedObject var bleManager = BLEManager()
    
    var body: some View {
        
        VStack() {
            Text("iOS-BLE")
                .font(.largeTitle)
                .fontWeight(.bold)
                .padding(.all)
            
            HStack() {
                
                Button(action: {
                    print("Button Pressed!")
                    self.heartRate += 1
                    self.ledColor = Color.green
                }) {
                    Text("Connect Sensor")
                        .foregroundColor(Color.white)
                    .padding(.all)
                }
                .background(Color.blue)
                .cornerRadius(20)
                                
                Text("Disconnected")
                    .font(.headline)
                    .padding(.leading)
                
                Circle()
                    .frame(width: 30.0, height: 30.0)
                    .padding(.all)
                    .foregroundColor(self.ledColor)
            }
            .padding(.bottom)
            
            
            // Status goes here
            if bleManager.isSwitchedOn {
                Text("Bluetooth is switched on")
                    .foregroundColor(.green)
            }
            else {
                Text("Bluetooth is NOT switched on")
                    .foregroundColor(.red)
            }
                
            Spacer()
            
            Text(String(self.heartRate))
                .font(.system(size: 120.0))
            
            Spacer()
            
            HStack() {
                Button(action: {
                    print("Button Pressed!")
                    self.heartRate -= 1
                }) {
                    Text("Send Data")
                        .foregroundColor(Color.white)
                        .padding(.horizontal, 60)
                        .padding(.vertical)
                    
                }
                .background(Color.blue)
                .cornerRadius(20)
                
            }
        }
        
        
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

