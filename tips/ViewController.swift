//
//  ViewController.swift
//  tips
//
//  Created by Victoria Zhou on 3/11/16.
//  Copyright (c) 2016 Victoria Zhou. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var billField: UITextField!
    @IBOutlet weak var tipLabel: UILabel!
    @IBOutlet weak var totalLabel: UILabel!
    @IBOutlet weak var tipController: UISegmentedControl!
    
    var set = false
    var tipPercentages = [0.18, 0.20, 0.22]
    var lowString = ""
    var midString = ""
    var highString = ""
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        tipLabel.text = "$0.00"
        totalLabel.text = "$0.00"
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func setTipStrings(){
        lowString = tipsValues.objectForKey("one") as! String
        midString = tipsValues.objectForKey("two") as! String
        highString = tipsValues.objectForKey("three") as! String
    }
    
    func editSegmentView(){
        tipController.setTitle(lowString + "%", forSegmentAtIndex: 0)
        tipController.setTitle(midString + "%", forSegmentAtIndex: 1)
        tipController.setTitle(highString + "%", forSegmentAtIndex: 2)
    }
    
    func setTipVals(){
        tipPercentages[0] =  (NSString(string: lowString).doubleValue) / 100
        tipPercentages[1] =  (NSString(string: midString).doubleValue) / 100
        tipPercentages[2] =  (NSString(string: highString).doubleValue) / 100
    }
    
    override func viewWillAppear(animated: Bool) {
        super.viewWillAppear(animated)
        //print("view will appear")
        if(set){
            setTipStrings()
            editSegmentView()
            setTipVals()
        }
        else{
            set = true;
        }
    }
    
    override func viewDidAppear(animated: Bool) {
        super.viewDidAppear(animated)
        billField.becomeFirstResponder()
        //print("view did appear")
    }
    
    override func viewWillDisappear(animated: Bool) {
        super.viewWillDisappear(animated)
        //print("view will disappear")
    }
    
    override func viewDidDisappear(animated: Bool) {
        super.viewDidDisappear(animated)
        //print("view did disappear")
    }
    
    
    @IBAction func onEditingChanged(sender: AnyObject) {
        var tipPercentage = tipPercentages[tipController.selectedSegmentIndex]
        
        let billAmount = NSString(string: billField.text!).doubleValue
        
        let tip = billAmount * tipPercentage
        let total = billAmount + tip
        
        //tipLabel.text = String(format: "%.2f", tip)
        //totalLabel.text = String(format: "$%.2f", total)
        tipLabel.text = tip.asLocaleCurrency
        totalLabel.text = total.asLocaleCurrency
        
    }

    @IBAction func onTap(sender: AnyObject) {
        view.endEditing(true)
    }
}

extension Double {
    var asLocaleCurrency:String {
        var formatter = NSNumberFormatter()
        formatter.numberStyle = .CurrencyStyle
        formatter.locale = NSLocale.currentLocale()
        formatter.maximumFractionDigits = 2
        formatter.groupingSize = 3
        formatter.groupingSeparator = ","
        return formatter.stringFromNumber(self)!
    }
}

