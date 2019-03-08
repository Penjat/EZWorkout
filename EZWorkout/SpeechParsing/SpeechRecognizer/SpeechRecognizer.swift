

import Foundation
import Speech

class SpeechRecognizer{
  
  let delegate :RecognizerReturnDelegate
  
  
  
  
  let audioEngine = AVAudioEngine()
  let speechRecognizer: SFSpeechRecognizer? = SFSpeechRecognizer()
  var request = SFSpeechAudioBufferRecognitionRequest()
  var recognitionTask: SFSpeechRecognitionTask?
  
  //TODO replace with hold and release button
  var isRecording = false
  
  var lastText = ""
  
  init(delegate: RecognizerReturnDelegate ) {
    self.delegate = delegate
  }
  
  func toggleRecording(){
    isRecording = !isRecording
    
    if isRecording {
      startRecognizing()
      return
    }
    stopRecognizing()
    
  }
  
  func startRecognizing(){
    
    print("start recognizing")
    recordAndRecognizeSpeech()
  }
  func stopRecognizing(){
    print("stop recognizing")
    
    
    audioEngine.stop()
    
    
    audioEngine.inputNode.removeTap(onBus: 0)
    
    recognitionTask?.cancel()
    
    //pass the results to the delegate
    delegate.recieve(speech: lastText)
    
  }
  
  func recordAndRecognizeSpeech(){
    let node = audioEngine.inputNode
    let recordingFormat = node.outputFormat(forBus: 0)
    node.installTap(onBus: 0, bufferSize: 1024, format: recordingFormat, block: {buffer, _ in self.request.append(buffer)
      
    })
    
    audioEngine.prepare()
    
    do {
      try audioEngine.start()
    } catch {
      return print("there was an error: \(error)")
    }
    
    guard let myRecognizer = SFSpeechRecognizer() else{
      return
    }
    
    if !myRecognizer.isAvailable{
      return
    }
    
    recognitionTask = speechRecognizer?.recognitionTask(with: request, resultHandler: {result ,error in
      if let result = result{
        let bestString = result.bestTranscription.formattedString
        
        self.lastText = bestString.lowercased()
        //self.results = result.bestTranscription.segments
        
        //self.speechLabel.text = bestString.lowercased()
        self.delegate.recieveInProgress(speech: bestString.lowercased())
      }else if let error = error {
        print(error)
      }
    })
    
    
  }
  

}


