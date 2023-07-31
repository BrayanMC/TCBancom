//
//  ValidationUtil.swift
//  Common
//
//  Created by Brayan Munoz Campos on 30/07/23.
//

public class ValidationUtil: NSObject {
    
    public class func textLimit(existingText: String?, newText: String, limit: Int = 4) -> Bool {
        let text = existingText ?? ""
        let isAtLimit = text.count + newText.count <= limit
        return isAtLimit
    }
}
