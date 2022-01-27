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
        
//        interfaceBehavior = .hidden
        
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
    
    func makeErrorString(_ code: UInt,_ message: String) -> String {
        "code: \(code)\nmessage: \(message)"
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
    
    
    // MARK: JWPlayerDelegate
    override func jwplayerIsReady(_ player: JWPlayer) {
        super.jwplayerIsReady(player)
        
        print("onReady", "")
    }
    
    override func jwplayer(_ player: JWPlayer, airPlayStatusChanged status: JWAirPlayStatus) {
        super.jwplayer(player, airPlayStatusChanged: status)
        var statusString: String!
        if status == .connected {
            statusString = "connected"
        } else {
            statusString = "disconnected"
        }
        print("onAirPlayStatusChanged", "\"status\": \(statusString ?? "")")
        
    }
    
   
    // MARK: - FullScreen
    func playerViewControllerDidGoFullScreen(_ controller: JWPlayerViewController) {
    }
    
    func playerViewControllerWillDismissFullScreen(_ controller: JWPlayerViewController) {
    }
    
    func playerViewControllerDidDismissFullScreen(_ controller: JWPlayerViewController) {
    }
    
    func playerViewController(_ controller: JWPlayerViewController, sizeChangedFrom oldSize: CGSize, to newSize: CGSize) {
        
    }
  
    override func jwplayer(_ player: JWPlayer, captionPresented caption: [String], at time: JWTimeData) {
        super.jwplayer(player, captionPresented: caption, at: time)
        
    }
    
    // MARK: - JWPlayerViewDelegate
    override func playerView(_ view: JWPlayerView, sizeChangedFrom oldSize: CGSize, to newSize: CGSize) {
        super.playerView(view, sizeChangedFrom: oldSize, to: newSize)
        print("onSizeChanged", " from: \(oldSize)}, to: \(newSize)")
    }
    
    // MARK: - JWPlayerStateDelegate
    override func jwplayerContentWillComplete(_ player: JWPlayer) {
        super.jwplayerContentWillComplete(player)
        print("onBeforeComplete", "")
    }
    
    override func jwplayer(_ player: JWPlayer, willPlayWithReason reason: JWPlayReason) {
        super.jwplayer(player, willPlayWithReason: reason)
        print("onBeforePlay", "reason: \(reason)")
    }
    
    override func jwplayer(_ player: JWPlayer, updatedBuffer percent: Double, position time: JWTimeData) {
        super.jwplayer(player, updatedBuffer: percent, position: time)
        print(#function)
    }
    
    override func jwplayerContentDidComplete(_ player: JWPlayer) {
        super.jwplayerContentDidComplete(player)
        print(#function)
        
    }
    
    override func jwplayer(_ player: JWPlayer, didFinishLoadingWithTime loadTime: TimeInterval) {
        super.jwplayer(player, didFinishLoadingWithTime: loadTime)
        print("onFinishedLoading", "loadTime: \(loadTime)")
    }
    
    override func jwplayer(_ player: JWPlayer, isPlayingWithReason reason: JWPlayReason) {
        super.jwplayer(player, isPlayingWithReason: reason)
        
        print("onPlay", " reason: \(reason.description)")
    }
    
    override func jwplayer(_ player: JWPlayer, isAttemptingToPlay playlistItem: JWPlayerItem, reason: JWPlayReason) {
        super.jwplayer(player, isAttemptingToPlay: playlistItem, reason: reason)
        print("onPlayAttempt", " reason: \(reason.description)")
    }
    
    override func jwplayer(_ player: JWPlayer, didPauseWithReason reason: JWPauseReason) {
        super.jwplayer(player, didPauseWithReason: reason)
        
        print("onPause", " reason: \(reason.description)")
    }
    
    override func jwplayer(_ player: JWPlayer, didBecomeIdleWithReason reason: JWIdleReason) {
        super.jwplayer(player, didBecomeIdleWithReason: reason)
        
        print("onIdle", " reason: \(reason.description)")
    }
    
    override func jwplayer(_ player: JWPlayer, usesMediaType type: JWMediaType) {
        super.jwplayer(player, usesMediaType: type)
        print("onMediaType", " mediaType: \(type.description) ")
    }
    
    override func jwplayer(_ player: JWPlayer, isVisible: Bool) {
        super.jwplayer(player, isVisible: isVisible)
        print("onViewable", " \(isVisible) ")
    }
    
    override func jwplayer(_ player: JWPlayer, didLoadPlaylist playlist: [JWPlayerItem]) {
        super.jwplayer(player, didLoadPlaylist: playlist)
        print("onPlaylist", "\(playlist)")
    }
    
    override func jwplayer(_ player: JWPlayer, didLoadPlaylistItem item: JWPlayerItem, at index: UInt) {
        super.jwplayer(player, didLoadPlaylistItem: item, at: index)
        print(#function)
    }
    
    override func jwplayerPlaylistHasCompleted(_ player: JWPlayer) {
        super.jwplayerPlaylistHasCompleted(player)
        print(#function)
    }
    
    override func jwplayer(_ player: JWPlayer, seekedFrom oldPosition: TimeInterval, to newPosition: TimeInterval) {
        super.jwplayer(player, seekedFrom: oldPosition, to: newPosition)
        print("onSeek", "\"from\":  \(oldPosition), \"to\":  \(newPosition)")
    }
    
    override func jwplayerHasSeeked(_ player: JWPlayer) {
        super.jwplayerHasSeeked(player)
        print(#function)
    }
    
    // MARK: - JWAVDelegate
    override func jwplayer(_ player: JWPlayer, audioTracksUpdated levels: [JWMediaSelectionOption]) {
        super.jwplayer(player, audioTracksUpdated: levels)
        let prettyTracks = levels.map { (selection) -> String in
            let trackType = (selection.trackType == .undefined) ? "N/A" : selection.trackType.description
            return "name: \(selection.name), " +
            "default: \(selection.defaultOption), " +
            "type:  \(trackType.description)"
        }
        print("onAudioTracks", " track: \(prettyTracks) ")
    }
    
    override func jwplayer(_ player: JWPlayer, audioTrackChanged currentLevel: Int) {
        super.jwplayer(player, audioTrackChanged: currentLevel)
        
        print("onAudioTrackChanged", " currentLevel: \(currentLevel) ")
    }
    
    override func jwplayer(_ player: JWPlayer, qualityLevelsUpdated levels: [JWVideoSource]) {
        super.jwplayer(player, qualityLevelsUpdated: levels)
        let prettySources = levels.map { source -> String in
            return "file: \(String(describing: source.file)), default: \(source.defaultVideo), label: \(String(describing: source.label))"
        }
        print("onQualityLevels", " sources: \(prettySources) ")
    }
    
    override func jwplayer(_ player: JWPlayer, qualityLevelChanged currentLevel: Int) {
        super.jwplayer(player, qualityLevelChanged: currentLevel)
        print("onQualityLevelChanged", " currentLevel: \(currentLevel) ")
    }
    
    override func jwplayer(_ player: JWPlayer, updatedCaptionList options: [JWMediaSelectionOption]) {
        super.jwplayer(player, updatedCaptionList: options)
        let prettyOptions = options.map { (option) -> String in
            let trackType = (option.trackType == .undefined) ? "N/A" : option.trackType.description
            return "name: \(option.name), type: \(trackType), default: \(option.defaultOption)"
        }
        print("onCaptionsList", " options: \(prettyOptions) ")
    }
    
    override func jwplayer(_ player: JWPlayer, captionTrackChanged index: Int) {
        super.jwplayer(player, captionTrackChanged: index)
        
        print("onCaptionsChanged", " index: \(index) ")
    }
    
    override func jwplayer(_ player: JWPlayer, updatedCues cues: [JWCue]) {
        super.jwplayer(player, updatedCues: cues)
        let prettyCues = cues.map { (cue) -> String in
            let text = cue.text == "" ? "" : ", text: \(cue.text)"
            return "begin: \(cue.begin.seconds)" + text
        }
        
        print("cuesUpdate", "cues: \(prettyCues)")
    }
    
    // MARK: - AdDelegate
    // swiftlint:disable:next cyclomatic_complexity
    override func jwplayer(_ player: AnyObject, adEvent event: JWAdEvent) {
        super.jwplayer(player, adEvent: event)
        guard let player = player as? JWPlayer else {
            return
        }
        switch event.type {
            case .started:
                guard let position = event[.adPosition] as? JWAdPosition else {
                    return
                }
                adStartedAt(player, adClient: event.client, adStartedAt: position)
            case .adBreakEnd:
                guard let position = event[.adPosition] as? JWAdPosition else {
                    return
                }
                adBreakEndedAt(player, adClient: event.client, adBreakEndedAt: position)
            case .adBreakStart:
                guard let position = event[.adPosition] as? JWAdPosition else {
                    return
                }
                adBreakStartedAt(player, adClient: event.client, adBreakStartedAt: position)
            case .clicked:
                guard let creative = event[.creativetype] as? String else {
                    return
                }
                let tag = event[.tag] as? URL
                tappedAdWithTag(player, adClient: event.client, withCreative: creative, tappedAdWithTag: tag)
            case .complete:
                guard let creative = event[.creativetype] as? String else {
                    return
                }
                let tag = event[.tag] as? URL
                adCompletedWithTag(player, adClient: event.client, withCreative: creative, adCompletedWithTag: tag)
            case .impression:
                guard let impression = event[.impression] as? JWAdImpression else {
                    return
                }
                receivedAdImpression(player, adClient: event.client, receivedAdImpression: impression)
            case .meta:
                guard let metadata = event[.metadata] as? JSONPayload else {
                    return
                }
                receivedAdMetadata(player, adClient: event.client, receivedAdMetadata: metadata)
            case .pause:
                guard let creative = event[.creativetype] as? String, let reason = event[.pauseReason] as? JWPauseReason else { // swiftlint:disable:this line_length
                    return
                }
                let tag = event[.tag] as? URL
                didPauseAdWithTag(player, adClient: event.client, withCreative: creative, didPauseAdWithTag: tag, withReason: reason) // swiftlint:disable:this line_length
            case .play:
                guard let creative = event[.creativetype] as? String, let reason = event[.playReason] as? JWPlayReason else { // swiftlint:disable:this line_length
                    return
                }
                let tag = event[.tag] as? URL
                didPlayAdWithTag(player, adClient: event.client, withCreative: creative, didPlayAdWithTag: tag, withReason: reason) // swiftlint:disable:this line_length
            case .request:
                guard let tag = event[.tag] as? URL, let offset = event[.adPosition] as? JWAdOffset else {
                    return
                }
                requestedAdWithTag(player, adClient: event.client, requestedAdWithTag: tag, at: offset)
            case .schedule:
                guard let schedule = event[.schedule] as? [JWAdBreak], let tag = event[.tag] as? URL else {
                    return
                }
                adScheduleLoaded(player, adClient: event.client, scheduleLoaded: schedule, forAdWithTag: tag)
            case .skipped:
                guard let creative = event[.creativetype] as? String else {
                    return
                }
                let tag = event[.tag] as? URL
                skippedAdWithTag(player, adClient: event.client, withCreative: creative, skippedAdWithTag: tag)
            case .companion:
                guard let companions = event[.companions] as? [JWAdCompanion], let tag = event[.tag] as? URL else {
                    return
                }
                receivedCompanions(player, companions: companions, forAdWithTag: tag)
            @unknown default:
                break
        }
    }
    
    private func adStartedAt(_ player: JWPlayer, adClient: JWAdClient, adStartedAt position: JWAdPosition) {
        print("onAdStarted", " position: \(position.description) ")
    }
    
    private func adBreakStartedAt(_ player: JWPlayer, adClient: JWAdClient, adBreakStartedAt position: JWAdPosition) {
        print("onAdBreakStart", " position: \(position.description) ")
    }
    
    private func adBreakEndedAt(_ player: JWPlayer, adClient: JWAdClient, adBreakEndedAt position: JWAdPosition) {
        print("onAdBreakEnd", " position: \(position.description) ")
    }
    
    private func adCompletedWithTag(_ player: JWPlayer,
                                    adClient: JWAdClient,
                                    withCreative creativeType: String,
                                    adCompletedWithTag tag: URL?) {
        let tagString = tag?.absoluteString ?? "N/A"
        print("onAdComplete", " creative: \(creativeType), tag: \(tagString) ")
    }
    
    private func didPauseAdWithTag(_ player: JWPlayer,
                                   adClient: JWAdClient,
                                   withCreative creativeType: String,
                                   didPauseAdWithTag tag: URL?,
                                   withReason reason: JWPauseReason) {
        
        let tagString = tag?.absoluteString ?? "N/A"
        print("onAdPause", " \"creative\": \"\(creativeType)\", \"tag\": \"\(tagString)\", \"reason\": \"\(reason.description))\" ")
    }
    
    private func didPlayAdWithTag(_ player: JWPlayer,
                                  adClient: JWAdClient,
                                  withCreative creativeType: String,
                                  didPlayAdWithTag tag: URL?,
                                  withReason reason: JWPlayReason) {
        
        let tagString = tag?.absoluteString ?? "N/A"
        print("onAdPlay", " \"creative\": \"\(creativeType)\", \"tag\": \"\(tagString)\", \"reason\": \"\(reason.description))\" ") // swiftlint:disable:this line_length
    }
    
    private func requestedAdWithTag(_ player: JWPlayer, adClient: JWAdClient, requestedAdWithTag tag: URL, at offset: JWAdOffset) {
        print("onAdRequest", " offset: \(offset), tag: \(tag) ")
    }
    
    private func skippedAdWithTag(_ player: JWPlayer,
                                  adClient: JWAdClient,
                                  withCreative creativeType: String,
                                  skippedAdWithTag tag: URL?) {
        let tagString = tag?.absoluteString ?? "N/A"
        print("onAdSkipped", " tag: \(tagString) ")
    }
    
    private func tappedAdWithTag(_ player: JWPlayer,
                                 adClient: JWAdClient,
                                 withCreative creativeType: String,
                                 tappedAdWithTag tag: URL?) {
        let tagString = tag?.absoluteString ?? "N/A"
        print("onAdClick", "client: \(adClient), tag: \(tagString) ")
    }
    
    // MARK: - JWAdInformationDelegate
    private func receivedCompanions(_ player: JWPlayer, companions: [JWAdCompanion], forAdWithTag tag: URL) {
        print("onAdCompanion", " companion: \(companions) ")
    }
    
    private func receivedAdMetadata(_ player: JWPlayer, adClient: JWAdClient, receivedAdMetadata metadata: JSONPayload) {
        guard let meta = metadata as? [String: Any] else {
            return
        }
        let pretty = meta.prettyPrint()
        print("onAdMeta", " metadata: \(pretty) ")
    }
    
    private func receivedAdImpression(_ player: JWPlayer,
                                      adClient: JWAdClient,
                                      receivedAdImpression impression: JWAdImpression) {
        var eventDetails = ""
        if let adId = impression.adId {
            eventDetails += " \"adId\": \"\(adId)\","
        }
        if let creativeAdId = impression.creativeAdId, creativeAdId != "" {
            eventDetails += " \"creativeAdId\": \"\(creativeAdId)\","
        }
        if let creativeId = impression.creativeId, creativeId != "" {
            eventDetails += " \"creativeId\": \"\(creativeId)\","
        }
        if let title = impression.title {
            eventDetails += " \"title\": \"\(title)\","
        }
        if impression.type != .unknown {
            eventDetails += " \"type\": \"\(impression.type)\","
        }
        if let clickThroughURL = impression.clickThroughURL {
            eventDetails += " \"clickThroughURL\": \"\(clickThroughURL)\","
        }
        eventDetails += " \"position\": \"\(impression.position.description)\","
        eventDetails.removeFirst() // removes leading space
        eventDetails.removeLast() // removes trailing ,
        print("onAdImpression", " \(eventDetails)")
    }
    
    private func adScheduleLoaded(_ player: JWPlayer, adClient: JWAdClient, scheduleLoaded schedule: [JWAdBreak], forAdWithTag tag: URL) {
        print("onAdSchedule", " schedule: \(schedule), tag: \(tag) ")
    }
            
    func playerViewController(_ controller: JWPlayerViewController, relatedMenuOpenedWithItems items: [JWPlayerItem], withMethod method: JWRelatedInteraction) {
        print("onRelatedOpen", "method: \(method.description)")
    }
    
    func playerViewController(_ controller: JWPlayerViewController, relatedMenuClosedWithMethod method: JWRelatedInteraction) {
        print("onRelatedClose", "method: \(method.description)")
    }
    
    func playerViewController(_ controller: JWPlayerViewController, relatedItemBeganPlaying item: JWPlayerItem, atIndex index: Int, withMethod method: JWRelatedInteraction) {
        print("onRelatedPlay", "method: \(method.description)")
    }

}


struct VMAP {
    static let jwp = "http://playertest.longtailvideo.com/vast3/assets/vmap_preroll.xml"
}


