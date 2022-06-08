//
//  ViewController.swift
//  StopWatch_zarni
//
//  Created by Zarnigar Abdullaeva on 6/6/22.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet weak var timerLabel: UILabel!
    @IBOutlet weak var resetButton: UIButton!
    @IBOutlet weak var pauseButton: UIButton!
    @IBOutlet weak var playButton: UIButton!
    @IBOutlet weak var firstView: UIView!
    @IBOutlet weak var secondView: UIView!
    @IBOutlet weak var icon: UIImageView!
    var timer = Timer()
    var count = 0
    var timerCounting = false
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

    @IBAction func stopTap(_ sender: UIButton) {
        self.count = 0
        self.timer.invalidate()
        self.timerLabel.text = self.makeTimeString(hours: 0, minutes: 0, seconds: 0)
        resetButton.setImage(UIImage(named:"stop_yellow.png"),for:UIControl.State.normal)
        pauseButton.setImage(UIImage(named:"pause_balck.png"),for:UIControl.State.normal)
        playButton.setImage(UIImage(named:"play_black.png"),for:UIControl.State.normal)

//        let alert = UIAlertController (title: <#T##String?#>, message: <#T##String?#>, preferredStyle: <#T##UIAlertController.Style#>)
    }
    
    @IBAction func pauseTap(_ sender: Any) {
        timerCounting = false
        timer.invalidate()
        resetButton.setImage(UIImage(named:"stop_black.png"),for:UIControl.State.normal)
        pauseButton.setImage(UIImage(named:"pause_yellow.png"),for:UIControl.State.normal)
        playButton.setImage(UIImage(named:"play_black.png"),for:UIControl.State.normal)
        
    }
    @IBAction func playTap(_ sender: Any) {
        if !timerCounting {
            timer = Timer.scheduledTimer(timeInterval: 1, target: self, selector: #selector(timerCounter), userInfo: nil, repeats: true)
            timerCounting = true
            resetButton.setImage(UIImage(named:"stop_black.png"),for:UIControl.State.normal)
            pauseButton.setImage(UIImage(named:"pause_balck.png"),for:UIControl.State.normal)
            playButton.setImage(UIImage(named:"play_yellow.png"),for:UIControl.State.normal)
        }
        
        }
    @objc func timerCounter () {
      
        count += 1
        let time = secondsToHoursMinutesSeconds(seconds: count)
        let timeString = makeTimeString(hours: time.0, minutes: time.1, seconds: time.2)
        timerLabel.text = timeString
    }
    func secondsToHoursMinutesSeconds(seconds:Int) -> (Int, Int, Int){
        
        return (seconds / 3600, (seconds % 3600)/60, (seconds % 3600)%60)
    }
    func makeTimeString (hours: Int, minutes: Int, seconds: Int) -> String{
        var timeString = ""
        timeString += String(format: "%02d", hours)
        timeString += " : "
        timeString += String(format: "%02d", minutes)
        timeString += " : "
        timeString += String(format: "%02d", seconds)
        return (timeString)
    }
    
    @IBAction func switchViews(_ sender: UISegmentedControl) {
        if sender.selectedSegmentIndex == 0 {
//            icon.image = UIImage (named: "timer.png")
            firstView.alpha = 1
            secondView.alpha = 0
            
        } else {
//            icon.image = UIImage (named: "stopwatch.png")
            firstView.alpha = 0
            secondView.alpha = 1
        }
    }
    
    }



