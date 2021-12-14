//
//  SettingsViewController.swift
//  Prework
//
//  Created by Oluwapelumi Olutimehin on 12/12/21.
//

import UIKit

class SettingsViewController: UIViewController {

    @IBOutlet weak var tipPercent1TextField: UITextField!
    @IBOutlet weak var tipPercent2TextField: UITextField!
    @IBOutlet weak var tipPercent3TextField: UITextField!
    override func viewDidLoad() {
        super.viewDidLoad()

        
        // Do any additional setup after loading the view.
        let defaults = UserDefaults.standard
        
        
        let tipPercent1 = defaults.string(forKey: "tipPercent1")
        // Get a Double value.
        let tipPercent2 = defaults.string(forKey: "tipPercent2")
        // Get a Bool value.
        let tipPercent3 = defaults.string(forKey: "tipPercent3")
        
        tipPercent1TextField.text = tipPercent1?.appending("%")
        tipPercent2TextField.text = tipPercent2?.appending("%")
        tipPercent3TextField.text = tipPercent3?.appending("%")
    }

    let defaults = UserDefaults.standard
    
    @IBAction func saveTip1(_ sender: Any) {
        var tipPercent = ""
        
        for char in tipPercent1TextField.text!{
            if char.isNumber{
                tipPercent.append(char)
            }
        }
        defaults.set(tipPercent, forKey: "tipPercent1")
        defaults.synchronize()
    }
    @IBAction func saveTip2(_ sender: Any) {
        var tipPercent = ""
        
        for char in tipPercent2TextField.text!{
            if char.isNumber{
                tipPercent.append(char)
            }
        }
        defaults.set(tipPercent, forKey: "tipPercent2")
        defaults.synchronize()
    }
    @IBAction func saveTip3(_ sender: Any) {
        var tipPercent = ""
        
        for char in tipPercent3TextField.text!{
            if char.isNumber{
                tipPercent.append(char)
            }
        }
        defaults.set(tipPercent, forKey: "tipPercent3")
        defaults.synchronize()
    }

    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
