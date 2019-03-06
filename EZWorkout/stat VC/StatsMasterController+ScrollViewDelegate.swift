

import UIKit


extension StatsMasterController : UIScrollViewDelegate{
  
  //is the delegate of center scroll view, not the top scroll bar
  
  func scrollViewDidScroll(_ scrollView: UIScrollView) {
    
    //find out what page the scroll view is on
    
    let page =  Int(centerScrollView.contentOffset.x / centerScrollView.frame.size.width)
    
    
    print("page = \(page)")
    if page != curPage {
      curPage = page
      setStatBarPos(pageNum: curPage)
    }
  }
}
