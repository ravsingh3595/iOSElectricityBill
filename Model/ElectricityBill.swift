//
//  ElectricityBill.swift
//  ElectricityBill
//
//  Created by user on 2018-08-08.
//  Copyright © 2018 RavSingh. All rights reserved.
//

import Foundation

enum Gender: String {
    case Male = "Male"
    case Female = "Female"
}

struct ElectricityBill {
    var customerId: String!
    var customerName: String!
    var billDate: String!
    var unitConsumed: Double = 0
    var gender: Gender!
    var total = Double()
    mutating func calTotal() -> Double
    {
        total = 0
            if unitConsumed <= 100
            {
                total = unitConsumed * 0.75
            }
            else if unitConsumed <= 250
            {
                total = 75 + (unitConsumed - 100) * 1.25
            }
            else if unitConsumed <= 450
            {
                total = 262.5 + (unitConsumed - 250) * 1.75
            }
            else if unitConsumed > 450
            {
                total = 612.5 + (unitConsumed - 450) * 2.25
        }
        return total
    }
}
