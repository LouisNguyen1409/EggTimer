//
//  ViewController.swift
//  EggTimer
//

import UIKit
import AVFoundation

class ViewController: UIViewController {
    var timer = Timer()
    let eggTime = ["Soft": 5 /** 60*/, "Medium": 7 /** 60*/, "Hard": 12 /** 60*/]
    var player: AVAudioPlayer!
    @IBOutlet weak var questionTitle: UILabel!
    
    @IBOutlet weak var progressBar: UIProgressView!

    
    @IBAction func hardnessSelected(_ sender: UIButton) {
        timer.invalidate()
        progressBar.progress = 0
        var timePass = 0
        let hardness = sender.currentTitle!
        questionTitle.text = hardness
        var counter = eggTime[hardness]!
        
        timer = Timer.scheduledTimer(withTimeInterval: 1.0, repeats: true) { (Timer) in
            if timePass < counter {
                print ("\(timePass) seconds")
                timePass += 1
                self.progressBar.progress = Float(timePass) / Float(counter)
            } else {
                Timer.invalidate()
                self.questionTitle.text = "Done!!!"
                self.playSound()
            }
        }
    }
    func playSound() {
        let url = Bundle.main.url(forResource: "alarm_sound", withExtension: "mp3")
        player = try! AVAudioPlayer(contentsOf: url!)
        player.play()
                
    }


}
