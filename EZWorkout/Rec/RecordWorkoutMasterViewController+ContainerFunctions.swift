

import Foundation

extension RecordWorkoutMasterViewController : CenterViewProtocol  {
 
  
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
    feedbackVisualizer.isHidden = false
    feebBackLabel.text = "recording"
    speechRecognizer.startRecognizing()
    centerController?.startRec()
    startVisualization()
    animateRecPressed()
  }
  func recReleased() {
    //speechRecognizer.stopRecognizing()
    //TODO check if all button press cases are covered
    feebBackLabel.isHidden = true
    feedbackVisualizer.isHidden = true
    speechRecognizer.stopRecognizing()
    centerController?.stopRec()
    stopVisualization()
    if isWorkingOut {
      startAnimatingGradient()
    }
  }
  
}
