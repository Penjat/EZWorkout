

import UIKit
import Foundation

class WorkoutRecVC: UIViewController {
  
  @IBOutlet weak var timerLabel: UILabel!
  
  let speechInputManager = SpeechInputManager()
  var speechRecognizer: SpeechRecognizer!
  var timer = Timer()
  
  
  
  override func viewDidLoad() {
    super.viewDidLoad()
    
    //start a workout timer
    timer = Timer.scheduledTimer(timeInterval: 1.0, target: self, selector:#selector(self.tick) , userInfo: nil, repeats: true)
    
    
    speechRecognizer = SpeechRecognizer(delegate: self)
  }
  
  @objc func tick() {
    timerLabel.text = DateFormatter.localizedString(from: Date(),
                                                    dateStyle: .medium,
                                                    timeStyle: .medium)
  }
  
  @IBAction func recordButtonAction(_ sender: Any) {
    speechRecognizer.toggleRecording()
    
    
    
  }
  
  
  
  
  
  
}
