//
//  Protocols.swift
//  Common
//
//  Created by Brayan Munoz Campos on 30/07/23.
//

import UIKit

public protocol NibLoadableView: AnyObject { }

extension NibLoadableView where Self: UIView {

    public static var nibName: String {
        return String(describing: self)
    }
}

extension UIView: NibLoadableView { }

protocol ReusableView: AnyObject { }

extension ReusableView where Self: UIView {
    
    static var reuseIdentifier: String {
        return String(describing: self)
    }
}

extension UITableViewCell: ReusableView { }
