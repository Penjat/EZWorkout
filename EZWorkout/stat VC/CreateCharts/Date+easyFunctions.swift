

import Foundation

extension Date{
  
  func plusOneDay() -> Date{
    
    let selectedDate = self//date//Calendar.current.startOfDay(for: Date())
    let selectedDateEnd: Date = {
      let components = DateComponents(day: 1, second: -1)
      return Calendar.current.date(byAdding: components, to: selectedDate)!
    }()
    
    return selectedDate
  }
}
