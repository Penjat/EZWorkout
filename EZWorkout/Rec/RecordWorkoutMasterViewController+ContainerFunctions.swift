

import Foundation

extension RecordWorkoutMasterViewController : CenterViewProtocol  {
  func getStartDate() -> Date {
    return startDate!// != nil ? startDate! : Date()
  }
  
 
  
  func getExerciseArray() -> [ExerciseModel]{
    
    if let exercises = exercises{
      return exercises
    }
    return []
    
    
  }
  
  func getExercise(atIndex index:Int) -> ExerciseModel?{
    if let exercises = exercises {
      return exercises[index]
    }
    return nil
  }
  func recPressed() {
    //TODO animate in and out
    feebBackLabel.isHidden = false
    //feedbackVisualizer.isHidden = false
    visulizerIn()
    feebBackLabel.text = "recording"
    speechRecognizer.startRecognizing()
    centerController?.startRec()
    startVisualization()
    //animateRecPressed()
    feedbackVisualizer.setBarBasedOn(vol:0.4)
  }
  func recReleased() {
    //speechRecognizer.stopRecognizing()
    //TODO check if all button press cases are covered
    feebBackLabel.isHidden = true
    //feedbackVisualizer.isHidden = true
    visulizerOut()
    speechRecognizer.stopRecognizing()
    centerController?.stopRec()
    stopVisualization()
    if isWorkingOut {
      //startAnimatingGradient()
    }
  }
  
}
