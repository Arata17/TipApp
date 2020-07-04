//
//  ResultsViewController.swift
//  Tipsy
//
//  Created by Shakhaidar Miras
//

import UIKit

class ResultsViewController: UIViewController {

    @IBOutlet weak var totalLabel: UILabel!
    @IBOutlet weak var settingsLabel: UILabel!
    
    var splitAmount: String?
    var howManyPeople: String?
    var tipPct: String?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        totalLabel.text = splitAmount
        settingsLabel.text = "Split between \(howManyPeople!) people, with \(tipPct!)% tip."
    }
    

    @IBAction func recalculatePressed(_ sender: UIButton) {
        dismiss(animated: true, completion: nil)
    }

}
