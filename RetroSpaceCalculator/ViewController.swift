//
//  ViewController.swift
//  RetroSpaceCalculator
//
//  Created by Emanuel  Guerrero on 1/22/16.
//  Copyright © 2016 Project Omicron. All rights reserved.
//

import UIKit
import AVFoundation

class ViewController: UIViewController {
    enum Operation: String {
        case Divide = "/"
        case Multiply = "*"
        case Subtract = "-"
        case Add = "+"
        case Equals = "="
        case Empty = "Empty"
    }
    
    @IBOutlet weak var outputLabel: UILabel!
    
    var buttonSound: AVAudioPlayer!
    var runningNumber = ""
    var leftValueString = ""
    var rightValueString = ""
    var currentOperation: Operation = Operation.Empty

    override func viewDidLoad() {
        super.viewDidLoad()
        
        let path = NSBundle.mainBundle().pathForResource("btn", ofType: "wav")
        let soundURL = NSURL(fileURLWithPath: path!)
        
        do {
            try buttonSound = AVAudioPlayer(contentsOfURL: soundURL)
            buttonSound.prepareToPlay()
        } catch let err as NSError {
            print(err.debugDescription)
        }
    }
    
    @IBAction func numberPressed(sender: UIButton!) {
        buttonSound.play()
    }
    
    @IBAction func onDividePressed(sender: AnyObject) {
        
    }
    
    @IBAction func onMultiplyPressed(sender: AnyObject) {
    }
    
    @IBAction func onSubtractPressed(sender: AnyObject) {
    }
    
    @IBAction func onAddPressed(sender: AnyObject) {
    }
    
    @IBAction func onEqualPressed(sender: AnyObject) {
    }
}

