

import Foundation


extension StatsMasterController : TopBarDelegate {
  func scrollTo(pageNum: Int) {
    curPage = pageNum
    setStatBarPos(pageNum: curPage)
    setCenterPos(pageNum: curPage)
  }
}
