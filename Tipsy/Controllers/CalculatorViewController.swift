//
//  ViewController.swift
//  Tipsy
//
//  Created by Shakhaidar Miras
//

import UIKit

class CalculatorViewController: UIViewController {

    @IBOutlet weak var billTextField: UITextField!
    @IBOutlet weak var zeroPctButton: UIButton!
    @IBOutlet weak var tenPctButton: UIButton!
    @IBOutlet weak var twentyPctButton: UIButton!
    @IBOutlet weak var splitNumberLabel: UILabel!
    
    var tipPct: Double? = 0.1
    var billAmount: Double?
    var splitNumber: Double = 2
    var calculatePayment: Double?
    var totalPayment: String?
    @IBAction func tipChanged(_ sender: UIButton) {
        if sender.currentTitle == "0%"{
            tenPctButton.isSelected = false
            sender.isSelected = true
            tipPct = 0.0
        } else if sender.currentTitle == "10%"{
            zeroPctButton.isSelected = false
            twentyPctButton.isSelected = false
            sender.isSelected = true
            tipPct = 0.1
        } else{
            zeroPctButton.isSelected = false
            tenPctButton.isSelected = false
            sender.isSelected = true
            tipPct = 0.2
        }
        billTextField.endEditing(true)
    }
    
    @IBAction func stepperValueChanged(_ sender: UIStepper) {
        splitNumberLabel.text = String(Int(sender.value))
        splitNumber = sender.value
    }
    
    @IBAction func calculatePressed(_ sender: UIButton) {
        billAmount = Double(billTextField.text!) ?? 0.0
        calculatePayment = (billAmount! + (billAmount! * tipPct!)) / splitNumber
        totalPayment = String(format: "%.2f", calculatePayment!)
        self.performSegue(withIdentifier: "goToResult", sender: self)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "goToResult" {
            let destinationVC = segue.destination as! ResultsViewController
            destinationVC.splitAmount = totalPayment
            destinationVC.howManyPeople = splitNumberLabel.text
            destinationVC.tipPct = String(tipPct! * 100)
        }
    }
    
    
}

