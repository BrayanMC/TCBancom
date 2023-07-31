//
//  UtilJSON.swift
//  Data
//
//  Created by Brayan Munoz Campos on 31/07/23.
//

public class UtilJSON {
    
    class func toObject<T>(_ type: T.Type, json: String?) -> T? where T: Decodable {
        guard let json = json else {
            return nil
        }
        let jsonData = Data(json.utf8)
        let decoder = JSONDecoder()
        do {
            let object = try decoder.decode(T.self, from: jsonData)
            return object
        } catch {
            debugPrint(error)
            return nil
        }
    }
    
    class func toObject<T>(_ type: T.Type, data: Data) -> T? where T: Decodable {
        let decoder = JSONDecoder()
        do {
            let object = try decoder.decode(T.self, from: data)
            return object
        } catch {
            debugPrint(error)
            return nil
        }
    }
}

public struct Throwable<T: Decodable>: Decodable {
    
    public let result: Result<T, Error>

    public init(from decoder: Decoder) throws {
        let catching = { try T(from: decoder) }
        self.result = Result(catching: catching )
    }
}
