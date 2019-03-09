

import Foundation
import CoreLocation


class WorkoutModel{
  var startTime: Date?
  var endTime: Date?
  var location: CLLocation?
  var exercises = [ExerciseModel]()
}
