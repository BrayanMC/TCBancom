//
//  ProgressView.swift
//  UIComponents
//
//  Created by Brayan Munoz Campos on 31/07/23.
//

import UIKit
import ProgressHUD

public class ProgressView {

    static var backgroundView = UIView()
    
    public class func showSpinner(inView: UIView) {
        ProgressHUD.animationType = .systemActivityIndicator
        ProgressHUD.show(nil, interaction: false)
    }

    public class func hideSpinner(inView: UIView) {
        ProgressHUD.remove()
    }
}
