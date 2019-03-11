
import UIKit

extension RecordWorkoutMasterViewController : TopBarDelegate{
  func scrollTo(pageNum: Int) {
    
    
    //curPage = pageNum
    //setStatBarPos(pageNum: pageNum)
    setCenterPos(pageNum: pageNum)
    
  }
  
  func setCenterPos(pageNum:Int){
    
    let offset = view.frame.width * CGFloat(pageNum)
    centerScrollView.setContentOffset(CGPoint(x: offset, y: 0), animated: true)
  }
  
  
}
