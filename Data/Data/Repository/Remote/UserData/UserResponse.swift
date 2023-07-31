//
//  UserResponse.swift
//  Data
//
//  Created by Brayan Munoz Campos on 31/07/23.
//

import Domain

public enum UserResponse {
}

extension UserResponse {
    
    public class GetUsers: Decodable {
        public var users: [User]?
        
        private enum CodingKeys: String, CodingKey {
            case users
        }
        
        required public init(from decoder: Decoder) throws {
            let container = try decoder.container(keyedBy: CodingKeys.self)
            self.users = try container.decodeIfPresent([User].self, forKey: .users)
        }
        
        public func mapper() -> UserModel.GetUsers {
            return UserModel.GetUsers.init(users: self.users.map { $0.map { $0.mapper() } } ?? [])
        }
        
        public class User: Decodable {
            public var id: Int?
            public var name: String?
            public var username: String?
            public var email: String?
            public var phone: String?
            public var address: Address?
            
            private enum CodingKeys: String, CodingKey {
                case id, name, username, email, phone, address
            }
            
            required public init(from decoder: Decoder) throws {
                let container = try decoder.container(keyedBy: CodingKeys.self)
                self.id = try container.decodeIfPresent(Int.self, forKey: .id)
                self.name = try container.decodeIfPresent(String.self, forKey: .name)
                self.username = try container.decodeIfPresent(String.self, forKey: .username)
                self.email = try container.decodeIfPresent(String.self, forKey: .email)
                self.phone = try container.decodeIfPresent(String.self, forKey: .phone)
                self.address = try container.decodeIfPresent(Address.self, forKey: .address)
            }
            
            public func mapper() -> UserModel.GetUsers.User {
                return UserModel.GetUsers.User.init(id: self.id ?? 0, name: self.name ?? "", username: self.username ?? "", email: self.email ?? "", phone: self.phone ?? "", address: self.address?.mapper() ?? nil)
            }
            
            public class Address: Decodable {
                public var street: String?
                public var suite: String?
                public var city: String?
                public var zipcode: String?
                
                private enum CodingKeys: String, CodingKey {
                    case street, suite, city, zipcode
                }
                
                required public init(from decoder: Decoder) throws {
                    let container = try decoder.container(keyedBy: CodingKeys.self)
                    self.street = try container.decodeIfPresent(String.self, forKey: .street)
                    self.suite = try container.decodeIfPresent(String.self, forKey: .suite)
                    self.city = try container.decodeIfPresent(String.self, forKey: .city)
                    self.zipcode = try container.decodeIfPresent(String.self, forKey: .zipcode)
                }
                
                public func mapper() -> UserModel.GetUsers.User.Address {
                    return UserModel.GetUsers.User.Address.init(street: self.street ?? "", suite: self.suite ?? "", city: self.city ?? "", zipcode: self.zipcode ?? "")
                }
            }
        }
    }
}
