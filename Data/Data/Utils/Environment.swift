//
//  Environment.swift
//  Data
//
//  Created by Brayan Munoz Campos on 31/07/23.
//

public struct Environment {
    
    private static let production: Bool = {
        #if Dev || QA || DEBUG
            return false
        #else
            return true
        #endif
    }()
    
    public static func isProduction() -> Bool {
        return self.production
    }
}
