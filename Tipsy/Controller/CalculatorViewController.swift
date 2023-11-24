//
//  ViewController.swift
//  Tipsy
//
//  Created by Suraj KY on 20/11/23.
//

import UIKit

class CalculatorViewController: UIViewController {
    
    var tipsyBrain = TipsyBrain()
    
    @IBOutlet weak var billTextField: UITextField!
    @IBOutlet weak var zeroPctButton: UIButton!
    @IBOutlet weak var tenPctButton: UIButton!
    @IBOutlet weak var twentyPctButton: UIButton!
    @IBOutlet weak var splitNumberLabel: UILabel!

    @IBAction func tipChanged(_ sender: UIButton) {
        billTextField.endEditing(true)
        
        zeroPctButton.isSelected = false
        tenPctButton.isSelected = false
        twentyPctButton.isSelected = false
        sender.isSelected = true
        
        tipsyBrain.updateTip(title: sender.currentTitle!)
    }
    
    
    @IBAction func stepperValueChanged(_ sender: UIStepper) {
        splitNumberLabel.text = String(format: "%.0f", sender.value)
        
        tipsyBrain.updateSplit(value: Int(sender.value))
    }
    
    
    @IBAction func calculatePressed(_ sender: UIButton) {
        
        tipsyBrain.calculateBill(bill: billTextField.text!)
        
        self.performSegue(withIdentifier: "goToResults", sender: self)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "goToResults" {
            let destinationVC = segue.destination as! ResultsViewController
            
            destinationVC.splitBill = tipsyBrain.getSplitBill()
            destinationVC.tip = tipsyBrain.getTip()
            destinationVC.splitBetween = tipsyBrain.getSplitBetween()
        }
    }
    
    
}

