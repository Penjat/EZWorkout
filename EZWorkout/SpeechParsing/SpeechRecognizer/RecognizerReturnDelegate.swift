

import Foundation

protocol RecognizerReturnDelegate {
  
  func recieve(speech:String)
  
  //returns while the speech is processing
  func recieveInProgress(speech:String)
}
