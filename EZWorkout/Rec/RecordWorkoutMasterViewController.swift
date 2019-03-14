
import AVFoundation
import UIKit

class RecordWorkoutMasterViewController: UIViewController {
  
  @IBOutlet weak var sectionTitle: UILabel!
  
  var recorder:AVAudioRecorder!
  
  @IBOutlet weak var centerScrollView: UIScrollView!
  @IBOutlet weak var centerContainerView: UIView!
  @IBOutlet weak var feebBackLabel: UILabel!
  @IBOutlet weak var feedbackVisualizer: SpeechVisulizerView!
  
  @IBOutlet weak var topBarScrollView: UIScrollView!
  
  var topBarController : RecTopBarVC!
  
  var curPage = 1
  var idleColor1: UIColor!
  var idleColor2: UIColor!
  var activeColor1: UIColor!
  var activeColor2: UIColor!
  
  var centerController: CenterViewController?
  
  let speechInputManager = SpeechInputManager()
  var startDate: Date?
  
  var workoutModel: WorkoutModel?
  var exercises: [ExerciseModel]?
  var lastExercise: ExerciseModel?
  
  var isWorkingOut = false
  
  var speechRecognizer: SpeechRecognizer!
  
  var moveColor1 :UIColor!
  var moveColor2 :UIColor!
  
  var gradient: CAGradientLayer!
  
  
  override func viewDidLoad() {
    super.viewDidLoad()
    
    
    speechRecognizer = SpeechRecognizer(delegate: self)
    
    DataManager.dataManager.testSingelton()
    //feebBackLabel
    feedbackVisualizer.alpha = 0.0
    
    //timerLabel.alpha = 0.0
    topBarController.animateTopBars(page: curPage)
    
    idleColor1 = #colorLiteral(red: 0.2392156869, green: 0.6745098233, blue: 0.9686274529, alpha: 1)
    idleColor2 = #colorLiteral(red: 0.1411764771, green: 0.3960784376, blue: 0.5647059083, alpha: 1)
    
    moveColor1 = #colorLiteral(red: 0.5706557631, green: 0.8416675329, blue: 0.9755091071, alpha: 1)
    moveColor2 = #colorLiteral(red: 0.5306761861, green: 0.0978826955, blue: 0.9567930102, alpha: 1)
    //TODO put in animation extention
    gradient = CAGradientLayer()
    //startGradient()
  
    gradient.colors = [idleColor1.cgColor, idleColor2.cgColor]
    gradient.locations = [0.0 , 1.0]
    gradient.startPoint = CGPoint(x: 0.0, y: 0.0)
    gradient.endPoint = CGPoint(x: 1.0, y: 0.0)
    
    gradient.frame = CGRect(x: 0.0, y: 0.0, width: self.view.frame.size.width, height: self.view.frame.size.height)
    self.view.layer.insertSublayer(gradient, at: 0)
    
    
    
    
    prepareVisualizer()
  }
  func animateRecPressed(){
    
    let fromAnimation = CABasicAnimation(keyPath: "colors")
    fromAnimation.duration = 2.0
    fromAnimation.toValue = [UIColor.white.cgColor,UIColor.white.cgColor]
    fromAnimation.fillMode = CAMediaTimingFillMode.forwards
    fromAnimation.isRemovedOnCompletion = false
    //fromAnimation.repeatCount = HUGE
    //fromAnimation.autoreverses = true
    gradient.add(fromAnimation, forKey: "colorChange")
    
  }
  func startAnimatingGradient(){
   
    //animate from old colors to new
    CATransaction.begin()
    CATransaction.setCompletionBlock {
      // This is called when all the animations in the transaction has completed
      print("Finished animating layer two assmass")
      self.startLoopingAnimation()
    }
    
    let fromAnimation = CABasicAnimation(keyPath: "colors")
    fromAnimation.duration = 2.0
    fromAnimation.toValue = [moveColor1.cgColor,moveColor2.cgColor]
    fromAnimation.fillMode = CAMediaTimingFillMode.forwards
    fromAnimation.isRemovedOnCompletion = false
    //fromAnimation.repeatCount = HUGE
    //fromAnimation.autoreverses = true
    gradient.add(fromAnimation, forKey: "colorChange")
    
    CATransaction.commit()
    
    
    
  }
  func backToIdle(){
    let fromAnimation = CABasicAnimation(keyPath: "colors")
    fromAnimation.duration = 2.0
    fromAnimation.toValue = [#colorLiteral(red: 0.2392156869, green: 0.6745098233, blue: 0.9686274529, alpha: 1).cgColor
      ,#colorLiteral(red: 0.1411764771, green: 0.3960784376, blue: 0.5647059083, alpha: 1).cgColor]
    fromAnimation.fillMode = CAMediaTimingFillMode.forwards
    fromAnimation.isRemovedOnCompletion = false
    //fromAnimation.repeatCount = HUGE
    //fromAnimation.autoreverses = true
    gradient.add(fromAnimation, forKey: "colorChange")
  }
  
  func startLoopingAnimation(){
    
    gradient.colors = [moveColor1.cgColor, moveColor2.cgColor]
        let loopAnimation = CABasicAnimation(keyPath: "colors")
        loopAnimation.duration = 2.0
        loopAnimation.toValue = [moveColor2.cgColor,moveColor1.cgColor]
        loopAnimation.fillMode = CAMediaTimingFillMode.forwards
        loopAnimation.isRemovedOnCompletion = false
        loopAnimation.repeatCount = HUGE
        loopAnimation.autoreverses = true
        gradient.add(loopAnimation, forKey: "colorChange")
    
    
  }
  override func viewDidAppear(_ animated: Bool) {
    super.viewDidAppear(animated)
    centerScrollView.setContentOffset(CGPoint(x:view.frame.width, y:0), animated: false)
    centerScrollView.delegate = self
    
    sectionTitle.alpha = 0.3
    sectionTitle.transform = CGAffineTransform(scaleX: 1.4, y: 1.4)
    UIView.animate(withDuration: 1.0, animations: {
      self.sectionTitle.alpha = 1.0
      self.sectionTitle.transform = CGAffineTransform(scaleX: 1, y: 1)
      })
    
  }
  override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
    if segue.identifier == "toCenterController"{
      centerController = segue.destination as! CenterViewController
      centerController!.delegate = self
      
      print("setting the content offset \(view.frame.width)")
      
    }else if segue.identifier == "embedTopBar"{
      //get the scroll view controller
      topBarController = segue.destination as! RecTopBarVC
      topBarController.delegate = self
    }
  }
  
  @IBAction func recPressedDown(_ sender: Any) {
    
  }
  @IBAction func recReleasedInside(_ sender: Any) {
    //TODO animate in and out
    
  }
  @IBAction func recReleasedOutside(_ sender: Any) {
    
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
  
  
  
  
  
}


