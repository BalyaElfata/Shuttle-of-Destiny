//
//  Helper.swift
//  Shuttle of Destiny
//
//  Created by Lonard Steven on 12/06/24.
//

import Foundation
import AVFoundation

class Helper {
    static let sharedHelper = Helper()
    private var audioPlayer: AVAudioPlayer!
    private var sfxPlayer: AVAudioPlayer!
    
    func playMenuMusic() {
        let sound = NSURL(fileURLWithPath: Bundle.main.path(forResource: "music/menu_audio", ofType: "mp3")!)
        
        do {
            audioPlayer = try AVAudioPlayer(contentsOf: sound as URL)
            audioPlayer?.numberOfLoops = -1
            audioPlayer?.prepareToPlay()
            audioPlayer?.setVolume(0.65, fadeDuration: 5)
            audioPlayer?.play()
        } catch {
            print("The audio file for the menu music part couldn't be played, due to error: \(error).")
        }
    }
    
    func playGameplayMusic() {
        let sound = NSURL(fileURLWithPath: Bundle.main.path(forResource: "music/game_audio", ofType: "mp3")!)
        
        do {
            audioPlayer = try AVAudioPlayer(contentsOf: sound as URL)
            audioPlayer?.numberOfLoops = -1
            audioPlayer?.setVolume(0.8, fadeDuration: 5)
            audioPlayer?.play()
        } catch {
            print("The audio file for the gameplay music part couldn't be played, due to error: \(error).")
        }
    }
    
    func playClickSfx() {
        let sound = NSURL(fileURLWithPath: Bundle.main.path(forResource: "sfx/click_sfx", ofType: "mp3")!)
        
        do {
            sfxPlayer = try AVAudioPlayer(contentsOf: sound as URL)
            sfxPlayer?.setVolume(0.5, fadeDuration: 2)
            sfxPlayer?.play()
        } catch {
            print("The audio file for the Click SFX part couldn't be played, due to error: \(error).")
        }
    }
    
    func playEODSfx() {
        let sound = NSURL(fileURLWithPath: Bundle.main.path(forResource: "sfx/end_of_day_sfx", ofType: "mp3")!)
        
        do {
            sfxPlayer = try AVAudioPlayer(contentsOf: sound as URL)
            sfxPlayer?.setVolume(0.5, fadeDuration: 2)
            sfxPlayer?.play()
        } catch {
            print("The audio file for the End of Day SFX part couldn't be played, due to error: \(error).")
        }
    }
    
    func playSODSfx() {
        let sound = NSURL(fileURLWithPath: Bundle.main.path(forResource: "sfx/start_of_day_sfx", ofType: "mp3")!)
        
        do {
            sfxPlayer = try AVAudioPlayer(contentsOf: sound as URL)
            sfxPlayer?.setVolume(0.5, fadeDuration: 2)
            sfxPlayer?.play()
        } catch {
            print("The audio file for the Start of Day SFX part couldn't be played, due to error: \(error).")
        }
    }
}

