//
//  UserSection.swift
//  TCBancom
//
//  Created by Brayan Munoz Campos on 31/07/23.
//

public struct UserSection {
    public var id: Int
    public var name: String
    public var username: String
    public var email: String
    public var phone: String
    public var street: String
    public var suite: String
    public var city: String
    public var zipcode: String
    public var isExpand: Bool
    
    public init(id: Int, name: String, username: String, email: String, phone: String, street: String, suite: String, city: String, zipcode: String) {
        self.id = id
        self.name = name
        self.username = username
        self.email = email
        self.phone = phone
        self.street = street
        self.suite = suite
        self.city = city
        self.zipcode = zipcode
        self.isExpand = false
    }
}
