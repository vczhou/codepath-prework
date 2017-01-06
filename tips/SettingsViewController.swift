//
//  SettingsViewController.swift
//  tips
//
//  Created by Victoria Zhou on 3/11/16.
//  Copyright (c) 2016 Victoria Zhou. All rights reserved.
//

import UIKit
let tipsValues = NSUserDefaults.standardUserDefaults()

class SettingsViewController: UIViewController {
    
    @IBOutlet weak var highField: UITextField!
    @IBOutlet weak var midField: UITextField!
    @IBOutlet weak var lowField: UITextField!
    @IBOutlet weak var saveButton: UIButton!
    var set = false;
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override func viewWillAppear(animated: Bool) {
        super.viewWillAppear(animated)
        //println("view will appear")
        if(!set) {
            lowField.text = "18"
            midField.text = "20"
            highField.text = "22"
            set = true
        } else{
            print("hello");
            lowField.text = tipsValues.objectForKey("one") as! String
            midField.text = tipsValues.objectForKey("two") as! String
            highField.text = tipsValues.objectForKey("three") as! String
        }
    }

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

    @IBAction func onSettingsTap(sender: AnyObject) {
        view.endEditing(true)
    }
    
    @IBAction func updateLow(sender: AnyObject) {
        if(lowField.text.isEmpty){
            lowField.text = "18"
        }
        tipsValues.setObject(lowField.text, forKey: "one")
        tipsValues.synchronize()
        set = true;
    }

    @IBAction func updateMid(sender: AnyObject) {
        if(midField.text.isEmpty){
            midField.text = "20"
        }
        tipsValues.setObject(midField.text, forKey: "two")
        tipsValues.synchronize()
        set = true;
    }
    
    @IBAction func updateHigh(sender: AnyObject) {
        if(highField.text.isEmpty){
            highField.text = "22"
        }
        tipsValues.setObject(highField.text, forKey: "three")
        tipsValues.synchronize()
        set = true;
    }
    
    @IBAction func updateAll(sender: AnyObject) {
        
        if(lowField.text.isEmpty){
            lowField.text = "18"
        }
        tipsValues.setObject(lowField.text, forKey: "one")
        tipsValues.synchronize()
        
        if(midField.text.isEmpty){
            midField.text = "20"
        }
        tipsValues.setObject(midField.text, forKey: "two")
        tipsValues.synchronize()
        
        if(highField.text.isEmpty){
            highField.text = "22"
        }
        tipsValues.setObject(highField.text, forKey: "three")
        tipsValues.synchronize()
        set = true;
        
    }
}
