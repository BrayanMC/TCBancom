//
//  CustomTextFieldProtocols.swift
//  UIComponents
//
//  Created by Brayan Munoz Campos on 30/07/23.
//

import UIKit

public protocol CustomTextFieldToolTipProtocol: AnyObject {
    func toolTipTapped(id: Int)
}

public protocol CustomTextFieldValidTextProtocol: AnyObject {
    func returnValue(valueReal: String, id: Int)
}

public protocol CustomTextFieldShouldChangeCharactersInProtocol: AnyObject {
    func returnValue(text: String, id: Int)
}

