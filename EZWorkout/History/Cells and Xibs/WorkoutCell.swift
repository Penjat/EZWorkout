

import UIKit

class WorkoutCell: UITableViewCell {
  
  @IBOutlet weak var dateLabel: UILabel!
  @IBOutlet weak var timeLabel: UILabel!
  
    override func awakeFromNib() {
        super.awakeFromNib()
      
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

    }
  func setUp(dateString:String , timeString:String){
    dateLabel.text = dateString
    timeLabel.text = timeString
  }

}
