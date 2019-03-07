
import UIKit

extension HistoryViewController : UIPickerViewDataSource , UIPickerViewDelegate{
  
  func numberOfComponents(in pickerView: UIPickerView) -> Int {
    //Month Year
    return 2
  }
  
  func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
    if component == 0{
      return months.count
    }else if component == 1{
      return years.count
    }
    return 0
  }
  
  func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
    if component == 0{
      return months[row]
    }else if component == 1{
      return years[row]
    }
    return ""
  }
  
  
  
}
