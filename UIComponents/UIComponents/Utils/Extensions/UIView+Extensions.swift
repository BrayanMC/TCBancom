//
//  UIView+Extensions.swift
//  UIComponents
//
//  Created by Brayan Munoz Campos on 31/07/23.
//

import Common
import UIKit
import SkeletonView

extension UIView {
    
    public func isShimmer(_ isActive: Bool, cornerRadius: Float = 0, lineSpacing: CGFloat = 10, multilineHeight: CGFloat = 20) {
        if isActive {
            SkeletonAppearance.default.multilineHeight = multilineHeight
            let skeletonLayer = SkeletonGradient(baseColor: ColorManager.shared.gray80)
            self.skeletonCornerRadius = cornerRadius
            self.isSkeletonable = true
            (self as? UILabel)?.skeletonLineSpacing = lineSpacing
            self.showAnimatedGradientSkeleton(usingGradient: skeletonLayer)
        } else {
            self.hideSkeleton()
        }
    }
}

