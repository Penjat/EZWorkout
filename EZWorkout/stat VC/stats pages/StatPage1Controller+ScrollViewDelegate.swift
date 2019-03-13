

import UIKit

extension StatsPage1Controller : UIScrollViewDelegate{
  func scrollViewDidScroll(_ scrollView: UIScrollView) {
    
    checkShouldAnimate(scrollPos: scrollView.contentOffset.y)
  }
}
