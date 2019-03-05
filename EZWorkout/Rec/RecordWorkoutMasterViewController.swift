

import UIKit

class RecordWorkoutMasterViewController: UIViewController {
  
  @IBOutlet weak var timerLabel: UILabel!
  
  let speechInputManager = SpeechInputManager()
  var startDate: Date?
  
  var workoutModel: WorkoutModel?
  var exercises: [ExerciseModel]?
  
  
  var isWorkingOut = false
  
  var speechRecognizer: SpeechRecognizer!
  
  var timer = Timer()
  
  
  override func viewDidLoad() {
    super.viewDidLoad()
    
    speechRecognizer = SpeechRecognizer(delegate: self)
  }
  
  @IBAction func recPressedDown(_ sender: Any) {
    speechRecognizer.startRecognizing()
  }
  @IBAction func recReleasedInside(_ sender: Any) {
    speechRecognizer.stopRecognizing()
  }
  @IBAction func recReleasedOutside(_ sender: Any) {
    speechRecognizer.stopRecognizing()
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
  @objc func tick() {
    let ti = Int(Date().timeIntervalSince(startDate!))
    let seconds = ti % 60
    let minutes = (ti / 60) % 60
    let hours = (ti / 3600)
    let hoursString = hours > 0 ?  "\(hours):" : ""
    
    timerLabel.text = NSString(format: "%@%0.2d:%0.2d",hoursString,minutes,seconds) as String
  }
  func startWorkoutTimer(){
    //start a workout timer
    timer = Timer.scheduledTimer(timeInterval: 1.0, target: self, selector:#selector(self.tick) , userInfo: nil, repeats: true)
  }
  func endWorkoutTimer(){
    timer.invalidate()
  }
  
  func startWorkout(){
    if !isWorkingOut {
      print("start workout")
      isWorkingOut = true
      startDate = Date()
      workoutModel = WorkoutModel()
      exercises = [ExerciseModel]()
      
      startWorkoutTimer()
    }else{
      print("you are already working out")
    }
  }
  
  func endWorkout(){
    if isWorkingOut {
      print("ending workout")
      isWorkingOut = false
      endWorkoutTimer()
    }else{
      print("you need to start a workout first")
    }
  }
  
  
}

extension RecordWorkoutMasterViewController : RecognizerReturnDelegate {
  
  
  func recieve(speech: String) {
    print("speech recieved: \(speech)")
    
    //if working out, check exercises first
    if isWorkingOut{
      //process for exercise data
      var exerciseModel = speechInputManager.findExercise(input: speech)
      if let exerciseModel = exerciseModel {
        print("found an exercise with the name \(exerciseModel.name)")
        createExerciseView(exerciseModel: exerciseModel)
      }
    }
    
    //then check the commands
    let cmd = speechInputManager.findCommand(inputSpeech: speech)
    
    if let cmd = cmd{
      switch (cmd){
      case .StartWorkout:
        startWorkout()
      case .EndWorkout:
        endWorkout()
      }
    }else{
      print("did not understand command")
    }
    
    
  }
  
  
}
