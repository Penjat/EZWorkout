

import Foundation

class StatHelper{
  
  static func getLastDates(num:Int , timeInterval:Calendar.Component)->[(String,Date)]{
    var stringDateArray = [(String,Date)]()
    let dateFormatter = DateFormatter()
    dateFormatter.dateFormat = "MMM"
    //count back and get the months and the month name
    //
    for i in 0..<num {
      let previousDate = Calendar.current.date(byAdding: timeInterval, value: -i, to: Date())!
      stringDateArray.insert((dateFormatter.string(from: previousDate) ,previousDate), at: 0) 
    }
    return stringDateArray
  }
}
