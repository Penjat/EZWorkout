

import UIKit
import FSCalendar
import RealmSwift

class NewHistoryViewController: UIViewController {
  
  @IBOutlet weak var calendar: FSCalendar!
  @IBOutlet weak var selectedDateLabel: UILabel!
  @IBOutlet weak var exerciseTableView: UITableView!
  
  let dateFormater = DateFormatter()
  let timeFormater = DateFormatter()
  
  var exercises = [ExcerciseRealm]()
  
  override func viewDidLoad() {
    super.viewDidLoad()
    
    calendar.dataSource = self
    calendar.delegate = self
    
    
    exerciseTableView.dataSource = self
    exerciseTableView.delegate = self
    
    //Date formatters
    //TODO maybe create when needed
    //dateFormater.dateFormat = "d"
    dateFormater.dateStyle = .medium
    timeFormater.dateFormat = "h:mm"
    //timeFormater.timeStyle = .short
    updateSelected(date: Date())
    
    let idleColor1 = #colorLiteral(red: 0.9764705896, green: 0.850980401, blue: 0.5490196347, alpha: 1)
    let idleColor2 = #colorLiteral(red: 0.9529411793, green: 0.7047749625, blue: 0.1462456667, alpha: 1)
    //TODO put in animation extention
    let gradient = CAGradientLayer()
    //startGradient()
    
    gradient.colors = [idleColor1.cgColor, idleColor2.cgColor]
    gradient.locations = [0.0 , 1.0]
    gradient.startPoint = CGPoint(x: 0.0, y: 1.0)
    gradient.endPoint = CGPoint(x: 1.0, y: 0.0)
    
    gradient.frame = CGRect(x: 0.0, y: 0.0, width: self.view.frame.size.width, height: self.view.frame.size.height)
    self.view.layer.insertSublayer(gradient, at: 0)
  }
  
  func updateSelected(date:Date){
    let selectedDateString = dateFormater.string(from: date)
    selectedDateLabel.text = "\(selectedDateString)"
    //TODO update table view
    let realm = try! Realm()
    //let predicate = NSPredicate(format: "date > %@", specificNSDate)
    
    
    let selectedDate = date//Calendar.current.startOfDay(for: Date())
    let selectedDateEnd: Date = {
      let components = DateComponents(day: 1, second: -1)
      return Calendar.current.date(byAdding: components, to: selectedDate)!
    }()
    let results = realm.objects(WorkoutRealm.self).filter("startTime BETWEEN %@", [selectedDate, selectedDateEnd])
    
    //let results = realm.objects(WorkoutRealm.self).filter("startTime >= $0", Date())
    //print("realm results = \(results)")
//      realm.objects(UserRealm.self).filter(“name = ‘Joe’ AND calory = 10”)
    
    if results.count > 0{
      exercises = results[0].excerciseArray.map{$0}
    }else{
      exercises = []
    }
    exerciseTableView.reloadData()
  }
  
  
  
  
  
  
}
