

import UIKit

class ExerciseCell: UITableViewCell {
  @IBOutlet weak var exerciseView: ExerciseView!
  static var delegate : RecognizerReturnDelegate?
    override func awakeFromNib() {
        super.awakeFromNib()
        
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

      
    }
  func setUp(exerciseModel:ExerciseModel){
    exerciseView.setUp(exerciseModel: exerciseModel)
  }
  func setUp(exerciseRealm:ExcerciseRealm){
    exerciseView.setUp(exerciseRealm: exerciseRealm)
  }

}
