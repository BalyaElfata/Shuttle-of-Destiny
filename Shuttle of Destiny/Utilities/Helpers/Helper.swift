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
        let sound = NSURL(fileURLWithPath: Bundle.main.path(forResource: "menu_audio", ofType: "mp3")!)
    
        do {
            audioPlayer = try AVAudioPlayer(contentsOf: sound as URL)
            audioPlayer?.numberOfLoops = -1
            
            audioPlayer?.setVolume(0.5, fadeDuration: 5)
            
            if !audioPlayer.isPlaying {
                audioPlayer?.prepareToPlay()
                audioPlayer?.play()
            }
            
        } catch {
            print("The audio file for the menu music part couldn't be played, due to error: \(error).")
        }

    }
    
    func playPrologueMusic() {
        let sound = NSURL(fileURLWithPath: Bundle.main.path(forResource: "prologue_music", ofType: "mp3")!)
        
        do {
            audioPlayer = try AVAudioPlayer(contentsOf: sound as URL)
            audioPlayer?.numberOfLoops = -1
            audioPlayer?.setVolume(0.5, fadeDuration: 5)
            audioPlayer?.play()
        } catch {
            print("The audio file for the prologue music part couldn't be played, due to error: \(error).")
        }
    }
    
    func playGameplayMusic() {
        let sound = NSURL(fileURLWithPath: Bundle.main.path(forResource: "game_audio", ofType: "mp3")!)
        
        do {
            audioPlayer = try AVAudioPlayer(contentsOf: sound as URL)
            audioPlayer?.numberOfLoops = -1
            audioPlayer?.setVolume(0.5, fadeDuration: 5)
            if !audioPlayer.isPlaying {
                audioPlayer?.prepareToPlay()
                audioPlayer?.play()
            }
        } catch {
            print("The audio file for the gameplay music part couldn't be played, due to error: \(error).")
        }
    }
    
    func playGoodEDMusic() {
        let sound = NSURL(fileURLWithPath: Bundle.main.path(forResource: "good_ed_music", ofType: "mp3")!)
        
        do {
            audioPlayer = try AVAudioPlayer(contentsOf: sound as URL)
            audioPlayer?.numberOfLoops = -1
            audioPlayer?.setVolume(0.5, fadeDuration: 5)
            audioPlayer?.play()
        } catch {
            print("The audio file for the good ending music part couldn't be played, due to error: \(error).")
        }
    }
    
    func playBadEDMusic() {
        let sound = NSURL(fileURLWithPath: Bundle.main.path(forResource: "bad_ed_music", ofType: "mp3")!)
        
        do {
            audioPlayer = try AVAudioPlayer(contentsOf: sound as URL)
            audioPlayer?.numberOfLoops = -1
            audioPlayer?.setVolume(0.5, fadeDuration: 5)
            audioPlayer?.play()
        } catch {
            print("The audio file for the bad ending music part couldn't be played, due to error: \(error).")
        }
    }
    
    func playNeutralEDMusic() {
        let sound = NSURL(fileURLWithPath: Bundle.main.path(forResource: "neutral_ed_music", ofType: "mp3")!)
        
        do {
            audioPlayer = try AVAudioPlayer(contentsOf: sound as URL)
            audioPlayer?.numberOfLoops = -1
            audioPlayer?.setVolume(0.5, fadeDuration: 5)
            audioPlayer?.play()
        } catch {
            print("The audio file for the neutral ending music part couldn't be played, due to error: \(error).")
        }
    }
    
    func playADVMusic() {
        let sound = NSURL(fileURLWithPath: Bundle.main.path(forResource: "adv_music", ofType: "mp3")!)
        
        do {
            audioPlayer = try AVAudioPlayer(contentsOf: sound as URL)
            audioPlayer?.numberOfLoops = -1
            audioPlayer?.setVolume(0.5, fadeDuration: 5)
            audioPlayer?.play()
        } catch {
            print("The audio file for the ADV music part couldn't be played, due to error: \(error).")
        }
    }
    
    func playClickSfx() {
        let sound = NSURL(fileURLWithPath: Bundle.main.path(forResource: "click_sfx", ofType: "mp3")!)
        
        do {
            sfxPlayer = try AVAudioPlayer(contentsOf: sound as URL)
            sfxPlayer?.setVolume(0.35, fadeDuration: 2)
            sfxPlayer?.play()
        } catch {
            print("The audio file for the Click SFX part couldn't be played, due to error: \(error).")
        }
    }
    
    func playEODSfx() {
        let sound = NSURL(fileURLWithPath: Bundle.main.path(forResource: "end_of_day_sfx", ofType: "mp3")!)
        
        do {
            sfxPlayer = try AVAudioPlayer(contentsOf: sound as URL)
            sfxPlayer?.setVolume(0.35, fadeDuration: 2)
            sfxPlayer?.play()
        } catch {
            print("The audio file for the End of Day SFX part couldn't be played, due to error: \(error).")
        }
    }
    
    func playSODSfx() {
        let sound = NSURL(fileURLWithPath: Bundle.main.path(forResource: "start_of_day_sfx", ofType: "mp3")!)
        
        do {
            sfxPlayer = try AVAudioPlayer(contentsOf: sound as URL)
            sfxPlayer?.setVolume(0.35, fadeDuration: 2)
            sfxPlayer?.play()
        } catch {
            print("The audio file for the Start of Day SFX part couldn't be played, due to error: \(error).")
        }
    }
    
    func playPhoneCallSfx() {
        let sound = NSURL(fileURLWithPath: Bundle.main.path(forResource: "phone_call_sfx", ofType: "mp3")!)
        
        do {
            sfxPlayer = try AVAudioPlayer(contentsOf: sound as URL)
            sfxPlayer?.setVolume(0.5, fadeDuration: 2)
            sfxPlayer?.play()
        } catch {
            print("The audio file for the Phone calling SFX part couldn't be played, due to error: \(error).")
        }
    }
}

extension RangeExpression where Bound: FixedWidthInteger {
    func randomElementsForDays(_ n: Int) -> [Bound] {
        precondition(n > 0)
            switch self {
            case let range as Range<Bound>: return (0..<n).map {_ in
                    .random(in: range)
            }
            
            case let range as ClosedRange<Bound>: return (0..<n).map {_ in
                    .random(in: range)
            }
            
            default: return []
        }
    }
}

extension Range where Bound: FixedWidthInteger {
    var randomElement: Bound {
        .random(in: self)
    }
}

extension ClosedRange where Bound: FixedWidthInteger {
    var randomElement: Bound {
        .random(in: self)
    }
}
