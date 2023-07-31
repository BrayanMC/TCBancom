//
//  ColorManager.swift
//  Common
//
//  Created by Brayan Munoz Campos on 30/07/23.
//

import UIKit

public final class ColorManager {
    
    public static let shared: ColorManager = ColorManager()

    private init() { }
    
    public var gray0: UIColor = UIColor(named: "Gray0", in: Bundle.main, compatibleWith: nil) ?? .clear
    public var gray30: UIColor = UIColor(named: "Gray30", in: Bundle.main, compatibleWith: nil) ?? .clear
    public var gray40: UIColor = UIColor(named: "Gray40", in: Bundle.main, compatibleWith: nil) ?? .clear
    public var gray80: UIColor = UIColor(named: "Gray80", in: Bundle.main, compatibleWith: nil) ?? .clear
    public var gray100: UIColor = UIColor(named: "Gray100", in: Bundle.main, compatibleWith: nil) ?? .clear
    public var accent100: UIColor = UIColor(named: "Accent100", in: Bundle.main, compatibleWith: nil) ?? .clear
    public var accent110: UIColor = UIColor(named: "Accent110", in: Bundle.main, compatibleWith: nil) ?? .clear
    public var red100: UIColor = UIColor(named: "Red100", in: Bundle.main, compatibleWith: nil) ?? .clear
    public var purple100: UIColor = UIColor(named: "Purple100", in: Bundle.main, compatibleWith: nil) ?? .clear
}
