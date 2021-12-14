//
//  ViewController.swift
//  Prework
//
//  Created by Oluwapelumi Olutimehin on 12/9/21.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet weak var tipControl: UISegmentedControl!
    @IBOutlet weak var billAmountTextField: UITextField!
    @IBOutlet weak var totalLabel: UILabel!
    @IBOutlet weak var tipAmountLabel: UILabel!
    
    @IBAction func settingsButton(_ sender: Any) {
        let defaults = UserDefaults.standard
        
        defaults.set(tipControl.titleForSegment(at:0), forKey: "tipPercent1")
        defaults.set(tipControl.titleForSegment(at:1), forKey: "tipPercent2")
        defaults.set(tipControl.titleForSegment(at:2), forKey: "tipPercent3")
        defaults.synchronize()
    }
    
    var tipPercentages: [Double] = []
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        self.title = "Tip Calculator"
        
    }

    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        print("view did appear")
        let defaults = UserDefaults.standard
        
        
        let tipPercent1 = defaults.string(forKey: "tipPercent1")
        let tipPercent2 = defaults.string(forKey: "tipPercent2")
        let tipPercent3 = defaults.string(forKey: "tipPercent3")
        
        tipPercentages.removeAll()
        tipPercentages.append(Double(tipPercent1!) ?? 0)
        tipPercentages.append(Double(tipPercent2!) ?? 0)
        tipPercentages.append(Double(tipPercent3!) ?? 0)
        
        
        tipControl.setTitle(tipPercent1?.appending("%"), forSegmentAt: 0)
        tipControl.setTitle(tipPercent2?.appending("%"), forSegmentAt: 1)
        tipControl.setTitle(tipPercent3?.appending("%"), forSegmentAt: 2)
        
    }
    
    @IBAction func calculateTip(_ sender: Any) {
        let bill = Double(billAmountTextField.text!) ?? 0
      
        let tip = bill * tipPercentages[tipControl.selectedSegmentIndex] / 100
        let total = bill + tip
        
        tipAmountLabel.text = String(format: "$%.2f",tip)
        totalLabel.text = String(format: "$%.2f",total)
        
    }



}

