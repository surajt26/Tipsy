//
//  TipsyBrain.swift
//  Tipsy
//
//  Created by Suraj KY on 22/11/23.
//

import Foundation

struct TipsyBrain {
    
    var tip = 0.10
    var splitBetween = 2
    var billTotal = 0.0
    var splitBill = "0.0"
    
    mutating func updateTip(title: String) {
        let buttonTitle = title
        let buttonTitleMinusPercentSign = String(buttonTitle.dropLast())
        let buttonTitleAsNumber = Double(buttonTitleMinusPercentSign)!
        tip = buttonTitleAsNumber / 100
    }
    
    mutating func updateSplit(value: Int) {
        splitBetween = value
    }
    
    mutating func calculateBill(bill: String) {
        if bill != "" {
            billTotal = Double(bill)!
            let result = billTotal * (1 + tip) / Double(splitBetween)
            splitBill = String(format: "%.2f", result)
        }
    }
    
    func getSplitBill() -> String {
        return splitBill
    }
    
    func getTip() -> Int {
        let tipConvert = Int(tip * 100)
        return tipConvert
    }
    
    func getSplitBetween() -> Int {
        return splitBetween
    }
}
