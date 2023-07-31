//
//  LogUtil.swift
//  Data
//
//  Created by Brayan Munoz Campos on 31/07/23.
//

class LogUtil {
    
    class func saveLogError(_ error: Error) {
        #if Dev || DEBUG
            debugPrint(error)
        #else
        #endif
    }
    
    class func saveLogDecodingError(_ decodingError: DecodingError.Context) {
        #if Dev || DEBUG
            debugPrint(decodingError)
        #else
        #endif
    }
}
