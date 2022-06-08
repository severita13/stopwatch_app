//
//  ViewController.swift
//  StopWatch_zarni
//
//  Created by Zarnigar Abdullaeva on 6/6/22.
//

import UIKit

class ViewController2: UIViewController {
    @IBOutlet weak var timerLabel: UILabel!
    @IBOutlet weak var resetButton: UIButton!
    @IBOutlet weak var pauseButton: UIButton!
    @IBOutlet weak var playButton: UIButton!
    @IBOutlet weak var toolBar: UIToolbar!
//    @IBOutlet weak var firstView: UIView!
//    @IBOutlet weak var secondView: UIView!
    
    var timer = Timer()
    var count = 30
    var timerCounting = false
//    var hour:Int = 0
//    var minutes:Int = 0
//    var seconds:Int = 0
//    let picker = UIPickerView()
    override func viewDidLoad() {
        super.viewDidLoad()
        
//        picker.center = CGPoint(x: view.bounds.midX, y: view.bounds.midY)
//        picker.delegate = self
//        picker.dataSource = self
//        self.view.addSubview(picker)
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
      
        count -= 1
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

    }
//extension ViewController2:UIPickerViewDelegate,UIPickerViewDataSource {
//
//    func numberOfComponents(in pickerView: UIPickerView) -> Int {
//
//        return 3
//
//    }
//
//    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
//
//        switch component {
//
//        case 0:
//
//            return 25
//
//        case 1,2:
//
//            return 60
//
//        default:
//
//            return 0
//
//        }
//
//    }
//
//    func pickerView(_ pickerView: UIPickerView, widthForComponent component: Int) -> CGFloat {
//
//        return pickerView.frame.size.width/3
//
//    }
//
//    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
//
//        switch component {
//
//        case 0:
//
//            return "\(row) h"
//
//        case 1:
//
//            return "\(row) min"
//
//        case 2:
//
//            return "\(row) s"
//
//        default:
//
//            return ""
//
//        }
//
//    }
//
//    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
//
//        switch component {
//
//        case 0:
//
//            hour = row
//
//        case 1:
//
//            minutes = row
//
//        case 2:
//
//            seconds = row
//
//        default:
//
//            break;
//
//        }
//
//    }
//
//}
//
//extension TimeInterval {
//
//    func stringFromTimeInterval() -> String {
//
//                let time = NSInteger(self)
//
////                let ms = Int((self.truncatingRemainder(dividingBy: 1)) * 1000)
//
//                let seconds = time % 60
//
//                let minutes = (time / 60) % 60
//
//                let hours = (time / 3600)
//
//                return String(format: "%0.2d:%0.2d:%0.2d",hours,minutes,seconds)
//
//            }
//
//        }



