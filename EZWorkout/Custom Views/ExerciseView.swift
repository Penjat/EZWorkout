

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
    
    //TODO adjust text presentation
    infoContainer.layer.cornerRadius = 12
    exerciseImage.layer.cornerRadius = exerciseImage.frame.size.width / 2
    labelExerciseName.text = exerciseModel.name
    if let reps = exerciseModel.reps {
      labelExerciseReps.text = "\(reps) reps"
    }
    if let weight = exerciseModel.value {
      labelExerciseWeight.text = "\(weight) lbs"
    }
    
    
  }
  
  func setUp(exerciseRealm:ExcerciseRealm){
    
    
    
    //TODO adjust text presentation
    infoContainer.layer.cornerRadius = 12
    exerciseImage.layer.cornerRadius = exerciseImage.frame.size.width / 2
    
    exerciseImage.layer.borderColor = UIColor.black.cgColor
    exerciseImage.layer.borderWidth = 3.0
    
    infoContainer.layer.borderColor = UIColor.black.cgColor
    infoContainer.layer.borderWidth = 2.0
    
    
    
    //TODO add modifiers
    //TODO take out weight and rep postfixes
    
    let nameString = exerciseRealm.name
    var weightString = ""
    var repsString = ""
    
    let exerciseType = ExerciseType.exerciseType(string: exerciseRealm.type)
    switch (exerciseType){
    case .BodyWeight:
      //only track reps
      repsString = "\(exerciseRealm.reps) reps"
      
    case .Weight:
      //track weight and reps
      repsString = "\(exerciseRealm.reps) reps"
      weightString = exerciseRealm.weight.value != nil ?  "\(exerciseRealm.weight.value!) lbs" : "???"
      
    case .Timed:
      repsString = "\(exerciseRealm.reps) min"
      
    case .Distance:
      weightString = "\(exerciseRealm.weight) km"
      
    case .TimedDistance:
      weightString = "\(exerciseRealm.weight) km"
      repsString = "\(exerciseRealm.reps) min"
    }
    
    
    
    
    
    labelExerciseName.text = nameString
    labelExerciseReps.text = repsString
    labelExerciseWeight.text = weightString
    
    
    
    
    
    
    

  }

}
