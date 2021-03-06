

import UIKit
import FSCalendar
import RealmSwift

extension NewHistoryViewController : FSCalendarDelegate , FSCalendarDataSource, FSCalendarDelegateAppearance{
 
  
  func calendar(_ calendar: FSCalendar, didSelect date: Date, at monthPosition: FSCalendarMonthPosition) {
    
    
   updateSelected(date: date)
    
    
    
  }
//  func calendar(_ calendar: FSCalendar, imageFor date: Date) -> UIImage? {
//    return #imageLiteral(resourceName: "Fill 136")
//  }
  func calendar(_ calendar: FSCalendar, appearance: FSCalendarAppearance, fillDefaultColorFor date: Date) -> UIColor? {
    let realm = try! Realm()
    //let predicate = NSPredicate(format: "date > %@", specificNSDate)
    
    
    let selectedDate = date//Calendar.current.startOfDay(for: Date())
    let selectedDateEnd: Date = {
      let components = DateComponents(day: 1, second: -1)
      return Calendar.current.date(byAdding: components, to: selectedDate)!
    }()
    let results = realm.objects(WorkoutRealm.self).filter("startTime BETWEEN %@", [selectedDate, selectedDateEnd])
    if results.count > 0{
      
      return #colorLiteral(red: 0.1411764771, green: 0.3960784376, blue: 0.5647059083, alpha: 1)
    }
    return #colorLiteral(red: 1, green: 1, blue: 1, alpha: 0)
    
  }
  func calendar(_ calendar: FSCalendar, appearance: FSCalendarAppearance, fillSelectionColorFor date: Date) -> UIColor? {
    
    
    
    
    return UIColor.blue
    
  }
  
  
  
}
