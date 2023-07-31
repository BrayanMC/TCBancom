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
    
    public class func isValidDocument(testStr: String) -> Bool {
        let documentRegEx = "^[0-9]{8}$"
        let phoneNumberTest = NSPredicate(format:"SELF MATCHES %@", documentRegEx)
        return phoneNumberTest.evaluate(with: testStr)
    }
    
    public class func isValidCE(testStr: String) -> Bool {
        let documentRegEx = "^[a-zA-Z0-9]{9,}$"
        let phoneNumberTest = NSPredicate(format:"SELF MATCHES %@", documentRegEx)
        return phoneNumberTest.evaluate(with: testStr)
    }
    
    public class func isValidPassword(testStr: String) -> Bool {
        let passwordRegEx = "(?=.*[a-zA-Z])(?=.*?[0-9]).{8,}"
        let passwordTest = NSPredicate(format:"SELF MATCHES %@", passwordRegEx)
        return passwordTest.evaluate(with: testStr)
    }
    
    public class func isNewValidPassword(testStr: String) -> Bool {
        let passwordRegEx = "^[0-9]{6}$"
        let passwordTest = NSPredicate(format:"SELF MATCHES %@", passwordRegEx)
        return passwordTest.evaluate(with: testStr)
    }

    public class func isValidEmail(testStr: String) -> Bool {
        let emailRegEx = "[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,}"
        let emailTest = NSPredicate(format:"SELF MATCHES %@", emailRegEx)
        return emailTest.evaluate(with: testStr)
    }
    
    public class func validateStringFromUrl(url:String) ->String{
        var allowed  = NSMutableCharacterSet.urlQueryAllowed
        allowed.remove(charactersIn: "&")
        guard let urlFormated = url.addingPercentEncoding(withAllowedCharacters:allowed)  else {
            return ""
        }
        return urlFormated
    }
}
