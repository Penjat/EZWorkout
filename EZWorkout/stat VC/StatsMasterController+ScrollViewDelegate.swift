

import UIKit


extension StatsMasterController : UIScrollViewDelegate{
  
  //is the delegate of center scroll view, not the top scroll bar
  
  func scrollViewDidScroll(_ scrollView: UIScrollView) {
    
    //find out what page the scroll view is on
    
    let pageFloat =  round(centerScrollView.contentOffset.x / centerScrollView.frame.size.width)
    let page = Int(pageFloat)
    if page != curPage {
        curPage = page
        setStatBarPos(pageNum: curPage)
        centerController.pageAnimation(page: curPage)
    }
  }

}
