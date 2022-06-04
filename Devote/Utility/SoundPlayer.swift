//
//  SoundPlayer.swift
//  Devote
//
//  Created by Ezequiel Rasgido on 28/09/2021.
//

import AVFoundation

var audioPlayer: AVAudioPlayer?

func playSound(sound: String, type: String) {
    if let path = Bundle.main.path(forResource: sound, ofType: type) {
        do {
            audioPlayer = try AVAudioPlayer(contentsOf: URL(fileURLWithPath: path))
            audioPlayer?.play()
        } catch {
            fatalError("Could not find and play the sound file.")
        }
    }
}
