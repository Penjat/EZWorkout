
import UIKit

extension RecordWorkoutMasterViewController : UIScrollViewDelegate{
  
  func scrollViewDidScroll(_ scrollView: UIScrollView) {
    //find out what page the scroll view is on
    
    let pageFloat =  round(centerScrollView.contentOffset.x / centerScrollView.frame.size.width)
    let page = Int(pageFloat)
    if page != curPage {
      print("changing page \(page)")
      curPage = page
      setStatBarPos(pageNum: curPage)
      
      //centerController.pageAnimation(page: curPage)
    }
  }
  func setStatBarPos(pageNum: Int){
    let offest = -view.frame.width/2  + topBarController.getButtonXPos(atIndex: pageNum)
    
    
    topBarScrollView.setContentOffset(CGPoint(x: offest, y: 0), animated: true)
  }
  
}
