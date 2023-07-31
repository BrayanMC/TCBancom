//
//  RepositoryRemote+Extensions.swift
//  Domain
//
//  Created by Brayan Munoz Campos on 31/07/23.
//

import PromiseKit
import Alamofire

extension RepositoryRemote {
    
    public func call<T: Decodable>(url: String, method: HTTPMethod, parameters: [String: Any]?, headers: HTTPHeaders) -> Promise<T> {
        return Promise<T> { seal in
            if (self.hasNetworkConnection()) {
                self.alamofireRequest.request(url, method: method, parameters: parameters, encoding: JSONEncoding.default, headers: headers).validate().responseDecodable(of: T.self, queue: queue, completionHandler: { response in
                    debugPrint("response:", response)
                    switch response.result {
                    case .failure(let error):
                        switch error {
                        default:
                            switch response.response?.statusCode {
                            case HttpStatus.FORBIDDEN.rawValue, HttpStatus.SESSION_EXPIRED.rawValue:
                                seal.reject(expirationError)
                                break
                            case HttpStatus.INTERNAL_SERVER_ERROR.rawValue:
                                seal.reject(serverError)
                                break
                            case HttpStatus.BAD_REQUEST.rawValue, HttpStatus.NOT_FOUND.rawValue:
                                seal.reject(defaultError)
                                break
                            default:
                                seal.reject(defaultError)
                                break
                            }
                        }
                    case .success:
                        DispatchQueue.main.async {
                            switch response.response?.statusCode {
                            case HttpStatus.OK.rawValue, HttpStatus.CREATE.rawValue, HttpStatus.ACCEPTED.rawValue:
                                let data = response.data
                                do {
                                    let _response = try JSONDecoder().decode(T.self, from: data!)
                                    seal.fulfill(_response)
                                } catch DecodingError.dataCorrupted(let context) {
                                    print("error call \(String(describing: T.self)) dataCorrupted: ", context.debugDescription)
                                    seal.reject(defaultError)
                                } catch DecodingError.keyNotFound(let key, let context) {
                                    print("error call \(String(describing: T.self)) \(key.stringValue) was not found, \(context.debugDescription)")
                                    seal.reject(defaultError)
                                } catch DecodingError.typeMismatch(let type, let context) {
                                    print("error call \(String(describing: T.self)) \(type) was expected, \(context.debugDescription)")
                                    seal.reject(defaultError)
                                } catch DecodingError.valueNotFound(let type, let context) {
                                    print("error call \(String(describing: T.self)) no value was found for \(type), \(context.debugDescription)")
                                    seal.reject(defaultError)
                                } catch (let error) {
                                    print("error call \(String(describing: T.self)): ", error.localizedDescription)
                                    seal.reject(defaultError)
                                }
                            case HttpStatus.SESSION_EXPIRED.rawValue:
                                seal.reject(expirationError)
                            default:
                                seal.reject(defaultError)
                            }
                        }
                    }
                })
            } else {
                seal.reject(networkConnectionError)
            }
        }
    }
}
