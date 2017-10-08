//
//  CustomTimerTableViewCell.swift
//  BikeRaceLapTimer
//
//  Created by Mitch Praag on 10/3/17.
//  Copyright © 2017 Mitch Praag. All rights reserved.
//

import UIKit

class CustomTimerTableViewCell: UITableViewCell {

    override func awakeFromNib() {
        super.awakeFromNib()
//        background?.layer.cornerRadius = 10.0
//        background?.layer.shadowRadius = 3.0
//        background?.layer.shadowOpacity = 0.5
//        background?.layer.shadowColor = UIColor.black.cgColor
//        background?.layer.shadowOffset = CGSize(width: 0, height: 2)
//
//        timerLabel.text = String(counter)
//        stopButton.isEnabled = false


    }
    @IBOutlet weak var nameField: UITextField!
    @IBOutlet weak var timerLabel: UILabel!
    @IBOutlet weak var firstTimeLabel: UILabel!
    @IBOutlet weak var secondTimeLabel: UILabel!
    @IBOutlet weak var thirdTimeLabel: UILabel!
    @IBOutlet weak var startButton: UIButton!
    @IBOutlet weak var lapButton: UIButton!
    @IBOutlet weak var stopButton: UIButton!
    @IBOutlet weak var resetButton: UIButton!
    @IBAction func startButtonTapped(_ sender: Any) {
        if(isPlaying) {
            return
        }
        startButton.isEnabled = false
        stopButton.isEnabled = true
        
        timer = Timer.scheduledTimer(timeInterval: 0.1, target: self, selector: #selector(UpdateTimer), userInfo: nil, repeats: true)
        isPlaying = true
        
    }
    @IBAction func lapButtonTapped(_ sender: Any) {
        
        if firstTimeLabel.text == "1st Time" {
            firstTimeLabel.text = timerLabel.text
        } else if secondTimeLabel.text == "2nd time" {
            secondTimeLabel.text = timerLabel.text
        } else if thirdTimeLabel.text == "3rd time" {
            thirdTimeLabel.text = timerLabel.text
        } else {
            return
        }
    }
    @IBAction func stopButtonTapped(_ sender: Any) {
        startButton.isEnabled = true
        stopButton.isEnabled = false
        
        timer.invalidate()
        isPlaying = false
    }
    
    @IBAction func resetButtonTapped(_ sender: Any) {
        startButton.isEnabled = true
        stopButton.isEnabled = false
        
        timer.invalidate()
        isPlaying = false
        counter = 0.0
        timerLabel.text = String(counter)
    }
    var rider: Rider? {
        didSet {
            updateViews()
        }
    }
    
    @objc func UpdateTimer() {
        counter = counter + 0.1

        timerLabel.text = String(format: "%.1f", counter) + " seconds"
    }
    
    @objc func updateViews() {
        guard let rider = rider else { return }
            let name = rider.name
            nameField.text = rider.name
    }
    
    var counter = 0.0
    var timer = Timer()
    var isPlaying = false
}
