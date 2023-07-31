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
    public var icSelectedEye: UIImage = UIImage(named: "ic-selected-eye", in: Bundle.main, compatibleWith: nil) ?? UIImage()
    public var icUnselectedEye: UIImage = UIImage(named: "ic-unselected-eye", in: Bundle.main, compatibleWith: nil) ?? UIImage()
    public var icArrowUp: UIImage = UIImage(named: "ic-arrow-up", in: Bundle.main, compatibleWith: nil) ?? UIImage()
    public var icArrowDown: UIImage = UIImage(named: "ic-arrow-down", in: Bundle.main, compatibleWith: nil) ?? UIImage()
}

