

import UIKit

class ExerciseSetView: UIView {
  @IBOutlet weak var labelValue: UILabel!
  
  @IBOutlet weak var labelReps: UILabel!
  @IBOutlet var contentView: UIView!
  
  required init?(coder aDecoder: NSCoder) {
    super.init(coder: aDecoder)
    commonInit()
  }
  
  private func commonInit(){
    Bundle.main.loadNibNamed("ExerciseSet", owner: self, options: nil)
    addSubview(contentView)
    contentView.frame = self.bounds
    contentView.autoresizingMask = [.flexibleWidth , .flexibleHeight]
  }
  
  func setUp(intValue:Int, numReps:Int){
    
    //TODO perhaps take out ??? is better for now to show that the label is there but the value unkown
    
    labelValue.text = intValue != -1 ? "\(intValue)" : "???"
    labelReps.text = "\(numReps)"
  }

}
