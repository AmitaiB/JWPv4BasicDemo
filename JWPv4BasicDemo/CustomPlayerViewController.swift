//
//  PlayerViewController.swift
//  JWPv4BasicDemo
//
//  Created by Amitai Blickstein on 1/13/22.
//

import UIKit
import JWPlayerKit

class CustomPlayerViewController: JWPlayerViewController {
    /// Sintel, HLS
    let videoURL = URL(string: "https://bitdash-a.akamaihd.net/content/sintel/hls/playlist.m3u8")!
    /// VAST 3 preroll VMAP
    let vmapURL = URL(string: "http://playertest.longtailvideo.com/vast3/assets/vmap_preroll.xml")!
    
    override var prefersStatusBarHidden: Bool {true}
    override var prefersHomeIndicatorAutoHidden: Bool {true}
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        interfaceBehavior = .hidden
        
        do {
            // Create a JWPlayerItem
            let item = try JWPlayerItemBuilder()
                .file(videoURL)
                .build()
            
            // Create an adConfig to wrap the VMAP schedule
            let adConfig = try JWAdsAdvertisingConfigBuilder()
                .vmapURL(vmapURL)
                .build()
            
            // Create a config, and give it the item as a playlist.
            let config = try JWPlayerConfigurationBuilder()
                .playlist([item])
                .autostart(true)
                .advertising(adConfig)
                .build()
            
            // Set the config
            player.configurePlayer(with: config)
        }
        catch {
            print(error.localizedDescription)
        }
    }
    
    // MARK: - Error Callbacks
    override func jwplayer(_ player: JWPlayer, failedWithSetupError code: UInt, message: String) {
        super.jwplayer(player, failedWithSetupError: code, message: message)
        print(#function, "\n * code: \(code)\n * message: \(message)")
    }
    
    override func jwplayer(_ player: JWPlayer, failedWithError code: UInt, message: String) {
        super.jwplayer(player, failedWithError: code, message: message)
        print(#function, "\n * code: \(code)\n * message: \(message)")
    }
    
    override func jwplayer(_ player: JWPlayer, encounteredWarning code: UInt, message: String) {
        super.jwplayer(player, encounteredWarning: code, message: message)
        print(#function, "\n * code: \(code)\n * message: \(message)")
    }
    
    override func jwplayer(_ player: JWPlayer, encounteredAdError code: UInt, message: String) {
        super.jwplayer(player, encounteredAdError: code, message: message)
        print(#function, "\n * code: \(code)\n * message: \(message)")
    }
    
    override func jwplayer(_ player: JWPlayer, encounteredAdWarning code: UInt, message: String) {
        super.jwplayer(player, encounteredAdWarning: code, message: message)
        print(#function, "\n * code: \(code)\n * message: \(message)")
    }
}
