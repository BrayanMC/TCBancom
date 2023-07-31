//
//  UserDataRepository.swift
//  Data
//
//  Created by Brayan Munoz Campos on 31/07/23.
//

import Alamofire
import PromiseKit
import Domain

public class UserDataRepository: UserRepository {
    
    public static let sharedInstance = UserDataRepository()
    private let restApiImpl: RepositoryRemote = RepositoryRemote.sharedInstance
    
    init() {}
    
    public func getUsers() -> Promise<[UserModel.GetUsers.User]> {
        let url = URLBuilder()
            .urlBase()
            .path(.GET_USERS)
            .build()
        
        let headers = Headers.Header_Default.getHeader()
        let response: Promise<[UserResponse.GetUsers.User]> = self.restApiImpl.call(url: url, method: .get, parameters: nil, headers: headers)
        return response.map { $0.map { $0.mapper() } }
    }
}

