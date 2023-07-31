//
//  UserRepository.swift
//  Domain
//
//  Created by Brayan Munoz Campos on 31/07/23.
//

import PromiseKit

public protocol UserRepository {
    func getUsers() -> Promise<[UserModel.GetUsers.User]>
}
