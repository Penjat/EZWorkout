

import UIKit

extension RecordWorkoutMasterViewController{
  
  func timerFlash(){
    var relTime = 0.0
    //short and long blinks must add up to one
    let shortBlink = 0.1
    let longBlink = 0.15
    
    UIView.animateKeyframes(withDuration: 8.0, delay: 0.0, options: [], animations: {
      
      UIView.addKeyframe(withRelativeStartTime: relTime, relativeDuration: shortBlink, animations: {

        self.timerLabel.alpha = 0.0
      })
      
        relTime += shortBlink
      UIView.addKeyframe(withRelativeStartTime: relTime , relativeDuration:longBlink , animations: {
      
        self.timerLabel.alpha = 1.0
      })
      relTime += longBlink
      
      UIView.addKeyframe(withRelativeStartTime: relTime, relativeDuration: shortBlink, animations: {
        
        self.timerLabel.alpha = 0.0
      })
      
      relTime += shortBlink
      UIView.addKeyframe(withRelativeStartTime: relTime, relativeDuration: longBlink, animations: {
        
        self.timerLabel.alpha = 1.0
      })
      relTime += longBlink
      
      UIView.addKeyframe(withRelativeStartTime: relTime, relativeDuration: shortBlink, animations: {
        
        self.timerLabel.alpha = 0.0
      })
      
      relTime += shortBlink
      UIView.addKeyframe(withRelativeStartTime: relTime, relativeDuration: longBlink, animations: {
        
        self.timerLabel.alpha = 1.0
      })
      relTime += longBlink
      
      UIView.addKeyframe(withRelativeStartTime: relTime, relativeDuration: shortBlink, animations: {
        
        self.timerLabel.alpha = 0.0
      })
      
      relTime += shortBlink
      UIView.addKeyframe(withRelativeStartTime: relTime, relativeDuration: longBlink, animations: {
        
        self.timerLabel.alpha = 1.0
      })
      relTime += longBlink
      
      UIView.addKeyframe(withRelativeStartTime: relTime, relativeDuration: shortBlink, animations: {
        
        self.timerLabel.alpha = 0.0
      })
      
      relTime += shortBlink
      UIView.addKeyframe(withRelativeStartTime: relTime, relativeDuration: longBlink, animations: {
        
        self.timerLabel.alpha = 1.0
      })

      
      
    })
  }
}
