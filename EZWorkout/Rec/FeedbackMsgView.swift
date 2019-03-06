

import UIKit

class FeedbackMsgView: UIView {

  
  @IBOutlet var contentView: UIView!
  
  @IBOutlet weak var topLabel: UILabel!
  @IBOutlet weak var bottomLabel: UILabel!
  
  override init(frame: CGRect) {
    super.init(frame: frame)
    commonInit()
  }
  
  required init?(coder aDecoder: NSCoder) {
    super.init(coder: aDecoder)
    commonInit()
  }
  
  private func commonInit(){
    Bundle.main.loadNibNamed("FeedbackMsg", owner: self, options: nil)
    addSubview(contentView)
    contentView.frame = self.bounds
    contentView.autoresizingMask = [.flexibleWidth , .flexibleHeight]
  }
  
  func setUp(topMsg:String , bottomMsg:String){
    topLabel.text = topMsg
    bottomLabel.text = bottomMsg
  }
}
