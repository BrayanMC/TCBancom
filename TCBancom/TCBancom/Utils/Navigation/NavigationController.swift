//
//  NavigationController.swift
//  TCBancom
//
//  Created by Brayan Munoz Campos on 27/07/23.
//

import UIKit

final class NavigationController: UINavigationController {
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        self.setup()
    }
    
    override init(nibName nibNameOrNil: String?, bundle nibBundleOrNil: Bundle?) {
        super.init(nibName: nibNameOrNil, bundle: nibBundleOrNil)
        self.setup()
    }
    
    override init(rootViewController: UIViewController) {
        super.init(rootViewController: rootViewController)
        self.setup()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.updateNavigationBarAppearance()
    }
    
    private func updateNavigationBarAppearance() {
        let navigationBarAppearance: UINavigationBarAppearance = UINavigationBarAppearance()
        navigationBarAppearance.configureWithOpaqueBackground()
        navigationBarAppearance.backgroundColor = .clear
        
        self.navigationBar.standardAppearance = navigationBarAppearance
        self.navigationBar.compactAppearance = navigationBarAppearance
        self.navigationBar.scrollEdgeAppearance = navigationBarAppearance
        
        self.navigationBar.layer.borderColor = UIColor.clear.cgColor
        self.navigationBar.clipsToBounds = true
    }
    
    private func setup() {
        self.isNavigationBarHidden = true
        self.modalPresentationStyle = .fullScreen
    }
}

