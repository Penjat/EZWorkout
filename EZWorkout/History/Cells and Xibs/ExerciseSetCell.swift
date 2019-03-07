
import UIKit

class ExerciseSetCell: UITableViewCell {
  @IBOutlet weak var exerciseSetView: ExerciseSetView!
  
  override func awakeFromNib() {
    super.awakeFromNib()
    // Initialization code
  }
  
  override func setSelected(_ selected: Bool, animated: Bool) {
    super.setSelected(selected, animated: animated)
    
    
  }
  func setUp(intValue:Int, numReps:Int){
    exerciseSetView.setUp(intValue: intValue, numReps: numReps)
  }
  
}
