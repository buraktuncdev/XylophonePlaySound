//
//  PlaySoundDelegate.swift
//  Xylophone
//
//  Created by Burak Tunc on 2.07.2020.
//  Copyright © 2020 The App Brewery. All rights reserved.
//

import Foundation
import AVFoundation

class PlaySoundDelegate: NSObject, PlaySoundProtocol {
    
    var player: AVAudioPlayer?
    
    static let sharedInstance = PlaySoundDelegate()
    
    func playSound(title:String) {
        guard let url = Bundle.main.url(forResource: title, withExtension: "wav")
            else { return }
        
        do {
            try AVAudioSession.sharedInstance().setCategory(.playback, mode: .default)
            try AVAudioSession.sharedInstance().setActive(true)
            
            player = try AVAudioPlayer(contentsOf: url, fileTypeHint: AVFileType.wav.rawValue)
            guard let player = player else {return}
            player.volume = 0.8  // volume down
            player.prepareToPlay()
            
            
        } catch let error{
            print(error.localizedDescription)
        }
        

        let seconds = 0.2 // Time To Delay
        let when = DispatchTime.now() + seconds

        DispatchQueue.main.asyncAfter(deadline: when) {
            self.play()
        }
    }
    
    func play() {
        if player?.isPlaying == false {
            player?.play()
        }
    }
    
    
}
