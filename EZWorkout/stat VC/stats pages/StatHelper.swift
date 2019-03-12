

import Foundation

class StatHelper{
  
  static func getLastDates(num:Int , timeInterval:Calendar.Component)->[(String,Date)]{
    var stringDateArray = [(String,Date)]()
    let dateFormatter = DateFormatter()
    
    var dateType = timeInterval
    
    
    let calendar = Calendar.current
    
    
    let year = calendar.component(.year, from: Date())
    let month = calendar.component(.month, from: Date())
    var day = 0
    
    switch (timeInterval){
      
      //gets the last x days, day is relevent
    case .day:
      dateFormatter.dateFormat = "ddd"
      day = calendar.component(.day, from: Date())
      break
      
      //gets the last x months, day is irelevent
    case .month:
      dateFormatter.dateFormat = "MMM"
      break
    default:
      //default to month to avoid problems
      dateFormatter.dateFormat = "MMM"
      dateType = .month
      break
      
    }
    let components = DateComponents(year: year, month: month, day: day, hour: 0, minute: 0, second: 0)
    
    //add one of time interval to date
    let cleanDate = calendar.date(from: components)!.adding(timeInterval: dateType, amt: 1)
    
    
    
    //count back and get the months and the month name
    for i in 0..<num {
      
      let previousDate = Calendar.current.date(byAdding: dateType, value: -i, to: cleanDate)!
      stringDateArray.insert((dateFormatter.string(from: previousDate) ,previousDate), at: 0) 
    }
    return stringDateArray
  }
  
  static func createTotal(timeArray:[Date] , closure:(Date)->Int )->[Int]{
    var repArray = [Int]()
    for date in timeArray{
      repArray.append(closure(date))
    }
    return repArray
  }
  
  static func createTotalforRange(timeArray:[Date] ,timeInterval:Calendar.Component, closure:(Date,Date)->Int )->[Int]{
    
    var repArray = [Int]()
    for startDate in timeArray{
      //let endDate addingTimeInterval(<#T##Date#>)
      //repArray.append(closure(startDate,))
    }
    return repArray
  }
}
