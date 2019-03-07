

import UIKit

class WorkoutCell: UITableViewCell {
  
  @IBOutlet weak var dateLabel: UILabel!
  
    override func awakeFromNib() {
        super.awakeFromNib()
      
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

    }
  func setUp(dateString:String){
    dateLabel.text = dateString
  }

}
