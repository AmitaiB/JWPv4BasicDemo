//
//  JWPlayerKit+Extensions.swift
//  JWPlayerKit-IssueReproduction
//
//  Created by Amitai Blickstein on 8/5/21.
//

import Foundation
import JWPlayerKit

extension JWPauseReason: CustomStringConvertible {
    public var description: String {
        switch self {
            case .clickthrough:         return "clickthrough"
            case .external:             return "external"
            case .interaction:          return "interaction"
            case .unknown:              return "unknown"
            case .settingsInteraction:  return "settingsInteraction"
            case .relatedInteraction:   return "relatedInteraction"
            @unknown default:           return "undetected"
                
        }
    }
}

extension JWPlayReason: CustomStringConvertible {
    public var description: String {
        switch self {
            case .external:         return "external"
            case .interaction:      return "interaction"
            case .playlist:         return "playlist"
            case .viewable:         return "viewable"
            case .repeatContent:    return "repeatContent"
            case .relatedInteraction: return "relatedInteraction"
            case .relatedAuto:      return "relatedAuto"
            case .unknown:          return "unknown"
            case .autostart:        return "autostart"
            case .settingsInteraction: return "settingsInteraction"
            @unknown default:       return "undetected"
        }
    }
}

extension JWIdleReason: CustomStringConvertible {
    public var description: String {
        switch self {
            case .complete:   return "complete"
            case .idle:       return "idle"
            case .unknown:    return "unknown"
            @unknown default: return "undetected"
        }
    }
}

extension JWRelatedInteraction: CustomStringConvertible {
    public var description: String {
        switch self {
            case .user:             return "user"
            case .contentComplete:  return "contentComplete"
            case .autostart:        return "autostart"
            @unknown default:       return "undetected"
        }
    }
}

extension JWAdCompanionType: CustomStringConvertible {
    public var description: String {
        switch self {
            case .iframe: return "iframe"
            case .static: return "static"
            case .html:   return "html"
            @unknown default: return "undetected"
        }
    }
}

extension JWAdPosition: CustomStringConvertible {
    public var description: String {
        switch self {
            case .pre:  return "pre"
            case .post: return "post"
            case .mid:  return "mid"
            case .unknown: return "unknown"
            @unknown default: return "undetected"
        }
    }
}

extension JWPlayerState: CustomStringConvertible {
    public var description: String {
        switch self {
            case .unknown:      return "unknown"
            case .idle:         return "idle"
            case .buffering:    return "buffering"
            case .playing:      return "playing"
            case .paused:       return "paused"
            case .complete:     return "complete"
            case .error:        return "error"
            @unknown default:   return "undetected"
        }
    }
}

extension JWTrackType: CustomStringConvertible {
    public var description: String {
        switch self {
            case .undefined:    return "undefined"
            case .audio:        return "audio"
            case .closedCaption:return "closedCaption"
            case .subtitle:     return "subtitle"
            @unknown default:   return "undetected"
        }
    }
}

extension JWMediaType: CustomStringConvertible {
    public var description: String {
        switch self {
            case .unknown:  return "unknown"
            case .audio:    return "audio"
            case .video:    return "video"
            @unknown default:   return "default"
        }
    }
}
