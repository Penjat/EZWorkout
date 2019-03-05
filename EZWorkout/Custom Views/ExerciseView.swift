

import UIKit

class ExerciseView: UIView {
  
  @IBOutlet var contentView: UIView!
  
  //Labels
  @IBOutlet weak var labelExerciseName: UILabel!
  @IBOutlet weak var labelExerciseWeight: UILabel!
  @IBOutlet weak var labelExerciseReps: UILabel!
  
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
    labelExerciseName.text = exerciseModel.name
    if let reps = exerciseModel.reps {
      labelExerciseReps.text = "\(reps) reps"
    }
    if let weight = exerciseModel.value {
      labelExerciseWeight.text = "\(weight) lbs"
    }
    
    
  }

}
