//
//  UITapGestureRecognizer+Extensions.swift
//  Common
//
//  Created by Brayan Munoz Campos on 31/07/23.
//

import UIKit

extension UITapGestureRecognizer {
    
    public func didTapAttributedTextInLabel(label: UILabel, inRange targetRange: NSRange) -> Bool {
        /// Create instances of NSLayoutManager, NSTextContainer and NSTextStorage
        let layoutManager = NSLayoutManager()
        let textContainer = NSTextContainer(size: CGSize.zero)
        
        guard let attributedText = label.attributedText else { return false }
        let mutableStr = NSMutableAttributedString.init(attributedString: attributedText)
        let style = NSMutableParagraphStyle()
        style.alignment = label.textAlignment
        mutableStr.addAttribute(NSAttributedString.Key.paragraphStyle, value: style, range: NSRange.init(location: 0, length: attributedText.length))
        mutableStr.addAttributes([NSAttributedString.Key.font: label.font!], range: NSRange.init(location: 0, length: attributedText.length))
        let textStorage = NSTextStorage(attributedString: label.attributedText!)
        
        /// Configure layoutManager and textStorage
        layoutManager.addTextContainer(textContainer)
        textStorage.addLayoutManager(layoutManager)
        
        /// Configure textContainer
        textContainer.lineFragmentPadding = 0.0
        textContainer.lineBreakMode = NSLineBreakMode.byWordWrapping
        textContainer.maximumNumberOfLines = label.numberOfLines
        let labelSize = label.bounds.size
        textContainer.size = labelSize
        
        /// Find the tapped character location and compare it to the specified range
        let locationOfTouchInLabel = self.location(in: label)
        let textBoundingBox = layoutManager.usedRect(for: textContainer)
        let textContainerOffset = CGPoint(
            x: (labelSize.width - textBoundingBox.size.width) * 0.5 - textBoundingBox.origin.x,
            y: (labelSize.height - textBoundingBox.size.height) * 0.5 - textBoundingBox.origin.y
        )
        let locationOfTouchInTextContainer = CGPoint(
            x: locationOfTouchInLabel.x - textContainerOffset.x,
            y: locationOfTouchInLabel.y - textContainerOffset.y
        )
        
        /// Adjust for multiple lines of text
        let lineModifier = Int(ceil(locationOfTouchInLabel.y / label.font.lineHeight)) - 1
        let rightMostFirstLinePoint = CGPoint(x: labelSize.width, y: 0)
        let charsPerLine = layoutManager.characterIndex(for: rightMostFirstLinePoint, in: textContainer, fractionOfDistanceBetweenInsertionPoints: nil)

        let indexOfCharacter = layoutManager.characterIndex(for: locationOfTouchInTextContainer, in: textContainer, fractionOfDistanceBetweenInsertionPoints: nil)
        let adjustedRange = indexOfCharacter + (lineModifier * charsPerLine)
        return NSLocationInRange(adjustedRange, targetRange)
    }
}
