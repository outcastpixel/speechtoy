//
//  ViewController.swift
//  speechtoy
//
//  Created by Kevin Cox on 3/9/19.
//  Copyright © 2019 Kevin Cox. All rights reserved.
//

import Cocoa

class ViewController: NSViewController {

    @IBOutlet weak var Speak: NSButton!
    @IBOutlet weak var EnglishTextField: NSTextField!
    @IBOutlet weak var PhoneticsTextField: NSTextField!
    @IBOutlet weak var SpeechRateSlider: NSSlider!
    
    
    
    var speechSynthesizer : NSSpeechSynthesizer?
    
    override func viewDidLoad() {
        super.viewDidLoad()

        EnglishTextField.stringValue = "This is Amiga speaking!"
        
        // Setup NSSpeech Synthesizer
        speechSynthesizer = NSSpeechSynthesizer()
        speechSynthesizer?.rate = SpeechRateSlider.floatValue
        
    }

    override var representedObject: Any? {
        didSet {
        // Update the view, if already loaded.
        }
    }

    
    func setupDefaultSpeech() {
        
    }
    
    @IBAction func Speak(_ sender: Any) {
        speechSynthesizer?.startSpeaking(EnglishTextField.stringValue)
    }
    
    @IBAction func Translate(_ sender: Any) {
        let phonethics: String = speechSynthesizer?.phonemes(from: EnglishTextField.stringValue) ?? ""
        
        PhoneticsTextField.stringValue = phonethics
    }
    
    
    @IBAction func ChangeSpeechRate(_ sender: NSSlider) {
        speechSynthesizer?.rate = sender.floatValue
    }
    
}

