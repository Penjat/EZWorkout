

import UIKit

class ExerciseTypeView: UIView {
  
  @IBOutlet var contentView: UIView!
  @IBOutlet weak var labelExerciseName: UILabel!
  @IBOutlet weak var labelNumSets: UILabel!
  
  override init(frame: CGRect) {
    super.init(frame: frame)
    commonInit()
  }
  
  required init?(coder aDecoder: NSCoder) {
    super.init(coder: aDecoder)
    commonInit()
  }
  
  private func commonInit(){
    Bundle.main.loadNibNamed("ExerciseType", owner: self, options: nil)
    addSubview(contentView)
    contentView.frame = self.bounds
    contentView.autoresizingMask = [.flexibleWidth , .flexibleHeight]
  }

  func setUp(name:String , numSets:String){
    labelNumSets.text = numSets
    labelExerciseName.text = name
  }
}
