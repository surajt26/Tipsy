//
//  ResultsViewController.swift
//  Tipsy
//
//  Created by Suraj KY on 22/11/23.
//

import UIKit

class ResultsViewController: UIViewController {
    
    @IBOutlet weak var totalLabel: UILabel!
    @IBOutlet weak var settingsLabel: UILabel!
    
    var splitBill = "0.0"
    var tip = 10
    var splitBetween = 2
    
    override func viewDidLoad() {
        super.viewDidLoad()

        totalLabel.text = splitBill
        settingsLabel.text = "Split between \(splitBetween) people, with \(tip)% tip."
    }

    @IBAction func recalculatePressed(_ sender: UIButton) {
        self.dismiss(animated: true, completion: nil)
    }
}
