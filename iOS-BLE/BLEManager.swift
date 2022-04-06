//
//  BLEManager.swift
//  iOS-BLE
//
//  Created by Alex Tweed on 4/4/22.
//  Copyright © 2022 Alex Tweed. All rights reserved.
//

import Foundation
import CoreBluetooth

class BLEManager: NSObject, ObservableObject, CBCentralManagerDelegate {

    var myCentral: CBCentralManager!

    @Published var isSwitchedOn = false

    override init() {
        super.init()

        myCentral = CBCentralManager(delegate: self, queue: nil)
        myCentral.delegate = self
    }

    func centralManagerDidUpdateState(_ central: CBCentralManager) {
        if central.state == .poweredOn {
            isSwitchedOn = true
        }
        else {
            isSwitchedOn = false
        }
    }

}
