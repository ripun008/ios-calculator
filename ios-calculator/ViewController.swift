//
//  ViewController.swift
//  ios-calculator
//
//  Created by Enjelina on 03/03/20.
//  Copyright © 2020 enjelhutasoit. All rights reserved.
//

import UIKit

// MARK: - Enums
enum modes {
    case notSet
    case addition
    case substraction
    case multiplication
    case devision
}

class ViewController: UIViewController {
    
    @IBOutlet weak var label: UILabel!
    
    // MARK: - Vars
    var labelString: String = "0"
    var currentMode: modes = .notSet
    var savedNum: Int = 0
    var lastButtonWasMode: Bool = false
    
    // MARK: - Funcs
    func updateText() {
        guard let labelInt: Int = Int(labelString) else {
            label.text = "Error"
            return
        }
        
        if currentMode == .notSet {
            savedNum = labelInt
        }
        
        let formatter: NumberFormatter = NumberFormatter()
        formatter.numberStyle = .decimal
        let num: NSNumber = NSNumber(value: labelInt)
        
        label.text = formatter.string(from: num)
    
    }
    
    func changeModes(newMode: modes) {
        if savedNum == 0 {
            return
        }
        currentMode = newMode
        lastButtonWasMode = true
    }

    // MARK: - Modes
    @IBAction func didPressPlus(_ sender: Any) {
        changeModes(newMode: .addition)
    }
    @IBAction func didPressMinus(_ sender: Any) {
        changeModes(newMode: .substraction)
    }
    @IBAction func didPressMultiply(_ sender: Any) {
        changeModes(newMode: .multiplication)
    }
    @IBAction func didPressDevided(_ sender: Any) {
        changeModes(newMode: .devision)
    }
    
    
    @IBAction func didPressEquals(_ sender: Any) {
        guard let labelInt: Int = Int(labelString) else {
            label.text = "Error"
            return
        }
        if currentMode == .notSet || lastButtonWasMode {
            return
        }
        if currentMode == .addition {
            savedNum += labelInt
        }
        else if  currentMode == .substraction {
            savedNum -= labelInt
        }
        else if currentMode == .multiplication {
            savedNum *= labelInt
        }
        else if currentMode == .devision {
            savedNum /= labelInt
        }
        
        currentMode = .notSet
        labelString = "\(savedNum)"
        updateText()
        lastButtonWasMode = true
    }
    
    
    
    @IBAction func didPressClear(_ sender: Any) {
        labelString = "0"
        currentMode = .notSet
        savedNum = 0
        lastButtonWasMode = false
        label.text = "0"
    }
    
    
    @IBAction func didPressNumber(_ sender: UIButton) {
        guard let stringValue: String = sender.titleLabel?.text else {
            label.text = "Error"
            return
        }
        if lastButtonWasMode {
            lastButtonWasMode = false
            labelString = "0"
        }
        
        labelString = labelString.appending(stringValue)
        updateText()
    }
    
    
    
}

