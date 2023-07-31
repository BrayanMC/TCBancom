//
//  TimerApplication.swift
//  TCBancom
//
//  Created by Brayan Munoz Campos on 31/07/23.
//

import Common
import UIKit

@objc(TimerApplication) class TimerApplication: UIApplication {
    
    deinit {
        NotificationCenter.default.removeObserver(self, name: .logOut, object: nil)
    }

    /// the timeout in seconds, after which should perform custom actions
    /// such as disconnecting the user
    private var timeoutInSeconds: TimeInterval {
        TimeInterval(GlobalConstants.timeoutInSeconds)
    }

    private var idleTimer: Timer?

    /// resent the timer because there was user interaction
    private func resetIdleTimer() {
        if let _idleTimer = self.idleTimer {
            _idleTimer.invalidate()
        }

        self.idleTimer = Timer.scheduledTimer(timeInterval: self.timeoutInSeconds, target: self, selector: #selector(TimerApplication.timeHasExceeded), userInfo: nil, repeats: false)
    }

    /// if the timer reaches the limit as defined in timeoutInSeconds, post this notification
    @objc private func timeHasExceeded() {
        NotificationCenter.default.post(name: .logOut, object: nil)
    }

    override func sendEvent(_ event: UIEvent) {
        super.sendEvent(event)

        if self.idleTimer != nil {
            self.resetIdleTimer()
        }

        if let touches = event.allTouches {
            for touch in touches where touch.phase == UITouch.Phase.began {
                self.resetIdleTimer()
            }
        }
    }
}

