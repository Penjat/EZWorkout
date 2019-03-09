
import UIKit

extension RecordWorkoutMasterViewController{
  
  func Undo(){
    
    //TODO undo other actions?
    if exercises != nil , exercises!.count > 0{
      let exercise = exercises!.removeLast()
      createFeedbackMessage(topMsg: "removing exercise:", bottomMsg: exercise.name)
     centerController?.reloadTable()
    }else{
      createFeedbackMessage(topMsg: "nothing to undo", bottomMsg: "")
    }
  }
}
