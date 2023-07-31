//
//  ImageManager.swift
//  Common
//
//  Created by Brayan Munoz Campos on 30/07/23.
//

import UIKit

public final class ImageManager {
    
    public static let shared: ImageManager = ImageManager()

    private init() { }
    
    public var icCheckOn: UIImage = UIImage(named: "ic-check-on", in: Bundle.main, compatibleWith: nil) ?? UIImage()
    public var icCheckOff: UIImage = UIImage(named: "ic-check-off", in: Bundle.main, compatibleWith: nil) ?? UIImage()
}

