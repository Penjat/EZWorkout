

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
    //TODO add modifiers
    labelExerciseName.text = exerciseRealm.name
    
    labelExerciseReps.text = "\(exerciseRealm.reps) reps"
    
    //TODO check the exercise type for correct data
    let weightString = exerciseRealm.weight.value != nil ?  "\(exerciseRealm.weight.value!) lbs" : ""
    labelExerciseWeight.text = weightString

  }

}
