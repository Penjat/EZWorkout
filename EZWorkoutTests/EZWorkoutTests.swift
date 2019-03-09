

import XCTest
@testable import EZWorkout

class EZWorkoutTests: XCTestCase {
  var speechInputManager : SpeechInputManager!
    override func setUp() {
        speechInputManager = SpeechInputManager()
    }

    override func tearDown() {
      
    }

  func testFindNumberOrder_withOutOfOrder_ShouldPutInOrder(){
    let input = "legpress 50 reps 100 pounds"
    let expected = [100,50]
    let result = speechInputManager.findAllNumbers(inputString: input)
    
    XCTAssertEqual(result, expected)
  }

}
