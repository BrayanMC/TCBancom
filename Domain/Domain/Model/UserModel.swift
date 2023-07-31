//
//  UserModel.swift
//  Domain
//
//  Created by Brayan Munoz Campos on 31/07/23.
//

public enum UserModel {}

// MARK: - Requests

extension UserModel {
}

// MARK: - Responses

extension UserModel {
    
    public struct GetUsers {
        public var users: [User]
        
        public init(users: [User]) {
            self.users = users
        }
        
        public struct User {
            public var id: Int
            public var name: String
            public var username: String
            public var email: String
            public var address: Address?
            
            public init(id: Int, name: String, username: String, email: String, address: Address?) {
                self.id = id
                self.name = name
                self.username = username
                self.email = email
                self.address = address
            }
            
            public struct Address {
                public var street: String
                public var suite: String
                public var city: String
                public var zipcode: String
                
                public init(street: String, suite: String, city: String, zipcode: String) {
                    self.street = street
                    self.suite = suite
                    self.city = city
                    self.zipcode = zipcode
                }
            }
        }
    }
}

