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
    
    @IBAction func numberPressed(button: UIButton!) {
        playSound()
        
        runningNumber += "\(button.tag)"
        outputLabel.text = runningNumber
    }
    
    @IBAction func onDividePressed(button: UIButton!) {
        processOperation(Operation.Divide)
    }
    
    @IBAction func onMultiplyPressed(button: UIButton!) {
        processOperation(Operation.Multiply)
    }
    
    @IBAction func onSubtractPressed(button: UIButton!) {
        processOperation(Operation.Subtract)
    }
    
    @IBAction func onAddPressed(button: UIButton!) {
        processOperation(Operation.Add)
    }
    
    @IBAction func onEqualPressed(button: UIButton!) {
        processOperation(Operation.Equals)
    }
    
    func processOperation(operation: Operation) {
        playSound()
        
        if currentOperation != Operation.Empty {
            
        } else {
            //This is the first time an operator has been pressed
            leftValueString = runningNumber
            runningNumber = ""
            currentOperation = operation
        }
    }
    
    func playSound() {
        if buttonSound.playing {
            buttonSound.stop()
        }
        
        buttonSound.play()
    }
}

