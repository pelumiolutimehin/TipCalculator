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
    
        if overrideUserInterfaceStyle == .dark{
            defaults.set(true, forKey:"darkMode")
        }
        else{
            defaults.set(false, forKey:"darkMode")
        }
        
        defaults.synchronize()
    }
    
    var tipPercentages: [Double] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        self.title = "Tip Calculator"
                
        let defaults = UserDefaults.standard
        
        let lastSavedTimeStamp = defaults.value(forKey: "lastSavedTimeStamp")
        if lastSavedTimeStamp != nil{
            let timeInterval = NSDate().timeIntervalSince(lastSavedTimeStamp as! Date)
            
            if (timeInterval < (600)){
                self.billAmountTextField.text =  defaults.string(forKey: "lastSavedBillAmount")
            }
        }

        
        self.billAmountTextField.becomeFirstResponder()
    }
        
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        print("View will appear")
        tipControl.backgroundColor = .lightGray
        tipControl.selectedSegmentTintColor = .white
        tipControl.setTitleTextAttributes([.foregroundColor: UIColor.black], for: .normal)
        billAmountTextField.backgroundColor = .white
        billAmountTextField.textColor = .black
        
        let defaults = UserDefaults.standard
        
        if defaults.bool(forKey: "darkMode"){
            overrideUserInterfaceStyle = .dark
            
            let textAttributes = [NSAttributedString.Key.foregroundColor:UIColor.white]
            navigationController?.navigationBar.titleTextAttributes = textAttributes
        }
        else{
            overrideUserInterfaceStyle = .light
            
            let textAttributes = [NSAttributedString.Key.foregroundColor:UIColor.black]
            navigationController?.navigationBar.titleTextAttributes = textAttributes        }
        
        self.billAmountTextField.becomeFirstResponder()
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
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        print("view will disappear")
    }
    
    override func viewDidDisappear(_ animated: Bool) {
        super.viewDidAppear(animated)
        print("view did disappear")
    }
    
    @IBAction func calculateTip(_ sender: Any) {
        let bill = Double(billAmountTextField.text!) ?? 0
      
        let tip = bill * tipPercentages[tipControl.selectedSegmentIndex] / 100
        let total = bill + tip
        
        tipAmountLabel.text = String(format: "$%.2f",tip)
        totalLabel.text = String(format: "$%.2f",total)
    }

    
    @IBAction func saveBillAmount(_ sender: Any) {
        let defaults = UserDefaults.standard
        
        defaults.set(billAmountTextField.text!, forKey: "lastSavedBillAmount")
        defaults.set(NSDate(), forKey: "lastSavedTimeStamp")
        defaults.synchronize()
        print("Saved")
    }
}

