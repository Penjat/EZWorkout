
import AVFoundation
import UIKit

class RecordWorkoutMasterViewController: UIViewController {
  
  var recorder:AVAudioRecorder!
  
  @IBOutlet weak var centerScrollView: UIScrollView!
  @IBOutlet weak var centerContainerView: UIView!
  @IBOutlet weak var timerLabel: UILabel!
  @IBOutlet weak var feebBackLabel: UILabel!
  @IBOutlet weak var feedbackVisualizer: SpeechVisulizerView!
  
  
  
  var centerController: CenterViewController?
  
  let speechInputManager = SpeechInputManager()
  var startDate: Date?
  
  var workoutModel: WorkoutModel?
  var exercises: [ExerciseModel]?
  var lastExercise: ExerciseModel?
  
  var isWorkingOut = false
  
  var speechRecognizer: SpeechRecognizer!
  
  var timer = Timer()
  
  
  override func viewDidLoad() {
    super.viewDidLoad()
 
    speechRecognizer = SpeechRecognizer(delegate: self)
    
    DataManager.dataManager.testSingelton()
    feebBackLabel.isHidden = true
    feedbackVisualizer.isHidden = true
    
    prepareVisualizer()
  }
  override func viewDidAppear(_ animated: Bool) {
    super.viewDidAppear(animated)
    centerScrollView.setContentOffset(CGPoint(x:view.frame.width, y:0), animated: false)
  }
  override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
    if segue.identifier == "toCenterController"{
      centerController = segue.destination as! CenterViewController
      centerController!.delegate = self
      
      print("setting the content offset \(view.frame.width)")
      
    }
  }
  
  @IBAction func recPressedDown(_ sender: Any) {
    //TODO animate in and out
    feebBackLabel.isHidden = false
    feedbackVisualizer.isHidden = false
    feebBackLabel.text = "recording"
    speechRecognizer.startRecognizing()
    centerController?.startRec()
    startVisualization()
    
  }
  @IBAction func recReleasedInside(_ sender: Any) {
    //TODO animate in and out
    feebBackLabel.isHidden = true
    feedbackVisualizer.isHidden = true
    speechRecognizer.stopRecognizing()
    centerController?.stopRec()
    stopVisualization()
  }
  @IBAction func recReleasedOutside(_ sender: Any) {
    //speechRecognizer.stopRecognizing()
    //TODO check if all button press cases are covered
  }
  
  
  func createExerciseView(exerciseModel: ExerciseModel){
    
    print("creating exercise view")
    
    //add to exercise list
    exercises?.append(exerciseModel)
    //reload table
    centerController?.reloadTable()
    
    
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
  
  
  
  
}


