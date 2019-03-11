
import Foundation

struct CommandModel{
  let keyWords : [String]
  let speechCommand : SpeechCommand
  
  func checkMatch(input:String)->Bool{
    
    //check all the key words
    for word in keyWords{
      //if contains it return true
      if input.contains(word){
        return true
      }
    }
    //doesn't contain keyword
    return false
  }
}
