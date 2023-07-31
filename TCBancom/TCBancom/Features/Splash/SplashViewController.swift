//
//  SplashViewController.swift
//  TCBancom
//
//  Created by Brayan Munoz Campos on 27/07/23.
//

import UIKit
import Lottie

protocol SplashScreenViewControllerProtocol: AnyObject {
    var presenter: SplashPresenter? { get }
}

class SplashViewController: BaseViewController {
    
    @IBOutlet weak var animationGuideView: UIView!
    
    private var animationView: AnimationView!
    
    public var presenter: SplashPresenter?
    
    public override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        self.playAnimations()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.setUpView()
    }
    
    private func playAnimations() {
        self.animationView.play { _ in
            self.presenter?.goToLogIn()
        }
    }
    
    private func setUpView() {
        self.initAnimationViews()
    }
    
    private func initAnimationViews() {
        self.createAnimationView()
    }
    
    private func createAnimationView() {
        self.animationView = AnimationView(name: "animation_lkqnqixy")
        self.animationView.frame = self.animationGuideView.bounds
        self.animationView.contentMode = .scaleAspectFill
        self.animationView.isAccessibilityElement = true
        self.animationView.accessibilityLabel = "animation_lkqnqixy"
        self.animationGuideView.addSubview(self.animationView)
    }
}

extension SplashViewController: SplashScreenViewControllerProtocol {
}
