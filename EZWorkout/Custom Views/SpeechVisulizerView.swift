

import UIKit

class SpeechVisulizerView: UIView {
  var barArray = [CALayer]()
  func setUpBars(){
    
    var i : CGFloat = 0.0
    for index in 0...40{
      let newLayer = CALayer()
      barArray.append(newLayer)
      newLayer.frame = CGRect(x:i*10.0,y: frame.height/2.0, width:8, height:1)
      newLayer.backgroundColor = UIColor.red.cgColor
      
      // Animate y position
      let moveAnim = CABasicAnimation(keyPath: "bounds.size.height")
      moveAnim.fromValue = 1
      moveAnim.toValue = 100
      moveAnim.duration = 0.5
      moveAnim.beginTime = CACurrentMediaTime() + Double(0.01*i);
      //moveAnim.repeatCount = HUGE
      moveAnim.autoreverses = true
      //newLayer.add(moveAnim, forKey: nil)
      
      layer.insertSublayer(newLayer ,at:0 )
      i += 1.0
    }
  }
  
  func setBarBasedOn(vol:CGFloat){
    
    
    //barArray[0].frame = CGRect(x:10.0,y: frame.height-100, width:8, height:1)
    //barArray[0].backgroundColor = UIColor.red.cgColor
    
    // Animate y position
    var i : CGFloat = 0.0
    for index in 0..<barArray.count{
      let indexFromCenter = abs(i-CGFloat( barArray.count/2))
      let moveAnim = CAKeyframeAnimation(keyPath: "bounds.size.height")
      //moveAnim.fromValue =
      //moveAnim.toValue = 300*vol
      let curValue = (barArray[index].bounds.size.height) as NSNumber
      let newValue = 300*vol*(1/(indexFromCenter*0.4+1.0)) as NSNumber
      let endValue = (3/(indexFromCenter*0.4+1.0)) as NSNumber
      
      
      if newValue.doubleValue < curValue.doubleValue{
        
        return
      }
      moveAnim.values = [curValue,newValue ,endValue]
      
      
      moveAnim.keyTimes = [0.0,0.1, 1.0]
      moveAnim.duration = 2.0
      moveAnim.beginTime = CACurrentMediaTime() + Double(0.02*indexFromCenter);
      moveAnim.calculationMode = .cubic
      //moveAnim.repeatCount = HUGE
      //moveAnim.autoreverses = true
      barArray[index].add(moveAnim, forKey: nil)
      
      //layer.addSublayer(barArray[0])
      i += 1.0
    }
  }
  
}
