

import Foundation
import AVFoundation

extension RecordWorkoutMasterViewController {
  func prepareVisualizer(){
    
    feedbackVisualizer.setUpBars()
    
    let url:NSURL = NSURL(fileURLWithPath: "/dev/null")
    let settings:NSDictionary = [
      AVSampleRateKey: 44100.0,
      AVFormatIDKey: kAudioFormatAppleLossless,
      AVNumberOfChannelsKey: 2,
      AVEncoderAudioQualityKey: AVAudioQuality.min.rawValue
    ]
    
    //var error:NSErrorPointer = NSErrorPointer()
    do {
      try recorder = AVAudioRecorder(url: url as URL, settings: settings as! [String : Any])
      try AVAudioSession.sharedInstance().setCategory(.playAndRecord, mode: .default, options: [])
    } catch  {
      print("there was an error")
    }
  }
  
  func startVisualization(){
    recorder.prepareToRecord()
    recorder.isMeteringEnabled = true
    recorder.record()

    var gameTimer: Timer!
    
    gameTimer = Timer.scheduledTimer(timeInterval: 0.1, target: self, selector: #selector(printMeterValue), userInfo: nil, repeats: true)
  }
  
  func stopVisualization(){
    //TODO stop the recorder
    
  }
  @objc func printMeterValue(){
    
    recorder.updateMeters()
    let normalizedValue:CGFloat = pow(10, CGFloat(recorder.averagePower(forChannel: 0))/20)
    feedbackVisualizer.setBarBasedOn(vol:normalizedValue)
    
  }
}
