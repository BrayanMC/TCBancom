//
//  Protocols.swift
//  Common
//
//  Created by Brayan Munoz Campos on 30/07/23.
//

import UIKit

// MARK: - NibLoadableView

public protocol NibLoadableView: AnyObject { }

extension NibLoadableView where Self: UIView {
    
    public static var nibName: String {
        return String(describing: self)
    }
}

extension UIView: NibLoadableView { }

// MARK: - ReusableView

protocol ReusableView: AnyObject { }

extension ReusableView where Self: UIView {

    static var reuseIdentifier: String {
        return String(describing: self)
    }
}

extension UITableViewCell: ReusableView { }
extension UITableViewHeaderFooterView: ReusableView { }

// MARK: - Global protocols

public protocol ViewProtocol: AnyObject {
    func startLoading()
    func finishedLoading()
}

public protocol PresenterProtocol: AnyObject {
    func showConfirmPasswordPopUp()
    func hideBalance()
}

