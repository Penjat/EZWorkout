

import UIKit
import Charts

class StatsCenterVC: UIViewController {
  @IBOutlet weak var chart1: BarChartView!
    
    
    var userVC = StatUserVC()
    var totalVC = StatTotalVC()
    
    override func viewDidLoad() {
    super.viewDidLoad()
    
    print(UserRealm.curUser.name)
    let exerciseDict = StaticDataManager.getRealmData(type: .numberOfTimes)
    print("this  is a dictionary of  \(exerciseDict.count) ")
    let topSevenDict = StaticDataManager.sortRealmDict(Dict: exerciseDict)
    print("this is top 7 sport \(topSevenDict)")
    StaticDataManager.setUpTestData(chart: chart1 , chartLabels: topSevenDict.map{$0.0} , chartValues: topSevenDict.map{$0.1})

    
  }

  
  override func viewDidAppear(_ animated: Bool) {
    super.viewDidAppear(animated)
    pageAnimation(page: 0)
   
    
  }
    func pageAnimation(page:Int){
        switch page {
        case 0:
            chart1.animate(xAxisDuration: 2.0, yAxisDuration: 2.0)
        case 1:
            totalVC.animateGraph()
       // case 2:
           // TypePieChartView.animate(yAxisDuration: 1)
       case 3:
            userVC.animateCircular()
        default:
            return
        }
    }
    
    
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if (segue.identifier == "goUser"){
            userVC = segue.destination as! StatUserVC
           // viewController.animateCircular()
            
        }else if (segue.identifier == "goTotal"){
            totalVC = segue.destination as! StatTotalVC
        }
    }
  
 
    
    func hexStringToUIColor (hex:String) -> UIColor {
        var cString:String = hex.trimmingCharacters(in: .whitespacesAndNewlines).uppercased()
        
        if (cString.hasPrefix("#")) {
            cString.remove(at: cString.startIndex)
        }
        
        if ((cString.count) != 6) {
            return UIColor.gray
        }
        
        var rgbValue:UInt32 = 0
        Scanner(string: cString).scanHexInt32(&rgbValue)
        
        return UIColor(
            red: CGFloat((rgbValue & 0xFF0000) >> 16) / 255.0,
            green: CGFloat((rgbValue & 0x00FF00) >> 8) / 255.0,
            blue: CGFloat(rgbValue & 0x0000FF) / 255.0,
            alpha: CGFloat(1.0)
        )
    }
   
  
  
  
}




