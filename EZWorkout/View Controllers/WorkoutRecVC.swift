

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
  
  func createExerciseView(exerciseModel: ExerciseModel){
    print("creating exercise view")
    
    let exerciseView = ExerciseView()
    exerciseView.setUp(exerciseModel: exerciseModel)
    
    //exerciseView!.frame = CGRect(x: 100, y: 100, width: 300, height: 80)
    view.addSubview(exerciseView)
    
    exerciseView.translatesAutoresizingMaskIntoConstraints = false
    exerciseView.topAnchor.constraint(equalTo: view.centerYAnchor).isActive = true
    exerciseView.heightAnchor.constraint(equalToConstant: 100).isActive = true
    exerciseView.leadingAnchor.constraint(equalTo: view.leadingAnchor).isActive = true
    exerciseView.trailingAnchor.constraint(equalTo: view.trailingAnchor).isActive = true
    exerciseView.alpha = 0.0
    
    
    
    let translate = CGAffineTransform(translationX: 0, y: -100)
    
    let outAnimation = {
      UIView.animate(withDuration: 1.0, delay: 2.0, options: [], animations: {
        exerciseView.transform = CGAffineTransform(translationX: 0, y: -200)
        exerciseView.alpha = 0.0
      }, completion: nil)
      
    }
    
    UIView.animate(withDuration: 1.0, animations: {
      exerciseView.transform = translate
      exerciseView.alpha = 1.0
      
    }, completion: { (finished: Bool) in
      outAnimation()
    })
    
    
  }
  
  
  
  
  
  
}
