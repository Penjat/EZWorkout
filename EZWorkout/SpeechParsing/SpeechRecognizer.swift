

import Foundation
import Speech

class SpeechRecognizer{
  
  let delegate :RecognizerReturnDelegate
  
  let audioEngine = AVAudioEngine()
  let speechRecognizer: SFSpeechRecognizer? = SFSpeechRecognizer()
  var request = SFSpeechAudioBufferRecognitionRequest()
  var recognitionTask: SFSpeechRecognitionTask?
  
  var isRecording = false
  
  var lastText = ""
  
  init(delegate: RecognizerReturnDelegate ) {
    self.delegate = delegate
  }
  
  func startRecognizing(){
    print("start recognizing")
  }
  func stopRecognizing(){
    print("stop recognizing")
  }
}
