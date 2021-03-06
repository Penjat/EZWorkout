

import UIKit

class ExerciseView: UIView {
  
  @IBOutlet var contentView: UIView!
  
  //Labels
  @IBOutlet weak var labelExerciseName: UILabel!
  @IBOutlet weak var labelExerciseWeight: UILabel!
  @IBOutlet weak var labelExerciseReps: UILabel!
  @IBOutlet weak var exerciseImage: UIImageView!
  @IBOutlet weak var infoContainer: UIView!
  
  override init(frame: CGRect) {
    super.init(frame: frame)
    commonInit()
  }
  
  required init?(coder aDecoder: NSCoder) {
    super.init(coder: aDecoder)
    commonInit()
  }
  
  private func commonInit(){
    Bundle.main.loadNibNamed("Exercise", owner: self, options: nil)
    addSubview(contentView)
    contentView.frame = self.bounds
    contentView.autoresizingMask = [.flexibleWidth , .flexibleHeight]
  }
  
  func setUp(exerciseModel:ExerciseModel){
    
    setUpDisplay()
    
    
    let nameString = exerciseModel.name
    var weightString = ""
    var repsString = ""
    
    let reps = exerciseModel.reps != nil ? exerciseModel.reps! : -1
    let value = exerciseModel.value != nil ? exerciseModel.value! : -1
    
    let exerciseType = exerciseModel.exerciseRef!.exerciseType
    
    switch (exerciseType){
    case .BodyWeight:
      //only track reps
      if reps < 0 {
        repsString = ""
      }else{
        repsString = "\(reps) reps"
      }
      
      
    case .Weight:
      //track weight and reps
      if reps < 0 {
        repsString = ""
      }else{
        repsString = "\(reps) reps"
      }
      
      
      if value < 0 {
        weightString = ""
      }else{
        weightString = "\(value) lbs"
      }
      
      
    case .Timed:
      if reps < 0 {
        repsString = ""
      }else{
        repsString = "\(reps) min"
      }
     
      
    case .Distance:
      if value < 0 {
        weightString = ""
      }else{
        weightString = "\(value) km"
      }
      
      
    case .TimedDistance:
      if reps < 0 {
        repsString = ""
      }else{
        repsString = "\(reps) min"
      }
      if value < 0 {
        weightString = ""
      }else{
        weightString = "\(value) km"
      }
      
    }
    
    
    
    
    
    labelExerciseName.text = nameString
    labelExerciseReps.text = repsString
    labelExerciseWeight.text = weightString
    
    
  }
  
  func setUp(exerciseRealm:ExcerciseRealm){
    
    
    
    setUpDisplay()
    
    
    
    //TODO add modifiers
    //TODO take out weight and rep postfixes
    
    let nameString = exerciseRealm.name
    var weightString = ""
    var repsString = ""
    
    let reps : Int = exerciseRealm.reps != nil ? exerciseRealm.reps : -1
    let value :Int = exerciseRealm.weight != nil ? exerciseRealm.weight.value! : -1
    
    let exerciseType = ExerciseType.exerciseType(string: exerciseRealm.type)
    
    switch (exerciseType){
    case .BodyWeight:
      //only track reps
      if reps < 0 {
        repsString = ""
      }else{
        repsString = "\(reps) reps"
      }
      
      
    case .Weight:
      //track weight and reps
      if reps < 0 {
        repsString = ""
      }else{
        repsString = "\(reps) reps"
      }
      
      
      if value < 0 {
        weightString = ""
      }else{
        weightString = "\(value) lbs"
      }
      
      
    case .Timed:
      if reps < 0 {
        repsString = ""
      }else{
        repsString = "\(reps) min"
      }
      
      
    case .Distance:
      if value < 0 {
        weightString = ""
      }else{
        weightString = "\(value) km"
      }
      
      
    case .TimedDistance:
      if reps < 0 {
        repsString = ""
      }else{
        repsString = "\(reps) min"
      }
      if value < 0 {
        weightString = ""
      }else{
        weightString = "\(value) km"
      }
      
    }
    
    
    
    
    
    labelExerciseName.text = nameString
    labelExerciseReps.text = repsString
    labelExerciseWeight.text = weightString
    


  }
 
  func setUpDisplay(){
    //TODO adjust text presentation
    infoContainer.layer.cornerRadius = 12
    exerciseImage.layer.cornerRadius = exerciseImage.frame.size.width / 2
    
    exerciseImage.layer.borderColor = UIColor.black.cgColor
    exerciseImage.layer.borderWidth = 3.0
    
    infoContainer.layer.borderColor = UIColor.black.cgColor
    infoContainer.layer.borderWidth = 2.0
  }

}
