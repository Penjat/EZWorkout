

import UIKit


extension RecordWorkoutMasterViewController{
  
  func createFeedbackMessage(topMsg:String , bottomMsg:String){
    
    let feedbackView = FeedbackMsgView()
    feedbackView.setUp(topMsg: topMsg, bottomMsg: bottomMsg)
    
    //exerciseView!.frame = CGRect(x: 100, y: 100, width: 300, height: 80)
    view.addSubview(feedbackView)
    
    feedbackView.translatesAutoresizingMaskIntoConstraints = false
    feedbackView.topAnchor.constraint(equalTo: view.centerYAnchor).isActive = true
    feedbackView.heightAnchor.constraint(equalToConstant: 100).isActive = true
    feedbackView.leadingAnchor.constraint(equalTo: view.leadingAnchor).isActive = true
    feedbackView.trailingAnchor.constraint(equalTo: view.trailingAnchor).isActive = true
    feedbackView.alpha = 0.0
    
    
    
    let translate = CGAffineTransform(translationX: 0, y: -100)
    
    let outAnimation = {
      UIView.animate(withDuration: 1.0, delay: 2.0, options: [], animations: {
        feedbackView.transform = CGAffineTransform(translationX: 0, y: -200)
        feedbackView.alpha = 0.0
      }, completion: nil)
      
    }
    
    UIView.animate(withDuration: 1.0, animations: {
      feedbackView.transform = translate
      feedbackView.alpha = 1.0
      
    }, completion: { (finished: Bool) in
      outAnimation()
    })
  }
}
