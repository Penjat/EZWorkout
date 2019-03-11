
import UIKit

extension CenterViewController {
  
  @objc func tick() {
    let ti = Int(Date().timeIntervalSince((delegate?.getStartDate())!))
    let seconds = ti % 60
    let minutes = (ti / 60) % 60
    let hours = (ti / 3600)
    let hoursString = hours > 0 ?  "\(hours):" : ""
    
    timerLabel.text = NSString(format: "%@%0.2d:%0.2d",hoursString,minutes,seconds) as String
  }
  func startWorkoutTimer(){
    //start a workout timer
    
    UIView.animate(withDuration: 0.4, animations: {
      self.timerLabel.transform = CGAffineTransform(scaleX: 1.1, y: 1.1)
    }, completion: {_ in
      UIView.animate(withDuration: 0.4, animations: {
        self.timerLabel.transform = CGAffineTransform(scaleX: 1.0, y: 1.0)
      })
    })
    
    timer = Timer.scheduledTimer(timeInterval: 1.0, target: self, selector:#selector(self.tick) , userInfo: nil, repeats: true)
  }
  func endWorkoutTimer(){
    timer.invalidate()
  }
}
