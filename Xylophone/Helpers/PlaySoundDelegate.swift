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
            
            player.play()
            
        } catch let error{
            print(error.localizedDescription)
        }
    }
    
    
}
