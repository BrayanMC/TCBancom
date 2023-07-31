//
//  RepositoryRemote.swift
//  Domain
//
//  Created by Brayan Munoz Campos on 31/07/23.
//

import Alamofire
import PromiseKit
import Reachability

let queue = DispatchQueue(label: "requests.queue", qos: .utility)

enum HttpStatus: Int {
    case OK = 200
    case CREATE = 201
    case ACCEPTED = 202
    case BAD_REQUEST = 400
    case SESSION_EXPIRED = 401
    case FORBIDDEN = 403
    case NOT_FOUND = 404
    case INTERNAL_SERVER_ERROR = 500
}

class SessionManager {
    
    static let sharedService = SessionManager()
    
    func request() -> Session {
        let configuration = URLSessionConfiguration.af.default
        configuration.timeoutIntervalForResource = 30
        let apiLogger = APIEventLogger()
        return Session(configuration: configuration, eventMonitors: [apiLogger])
    }
}

public class RepositoryRemote: RestApi {
    
    public static let sharedInstance = RepositoryRemote()
    public let alamofireRequest = SessionManager.sharedService.request()
    var reachability = Reachability()
    
    public func hasNetworkConnection() -> Bool {
        do {
            try self.reachability?.startNotifier()
        } catch {
            LogUtil.saveLogError(error)
        }
        return !(self.reachability?.connection == Reachability.Connection.none)
    }
}
