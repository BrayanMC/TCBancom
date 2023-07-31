//
//  URLBuilder.swift
//  Data
//
//  Created by Brayan Munoz Campos on 31/07/23.
//

struct NoReply: Decodable {}

enum ServiceVersion: String {
    case v1 = "v1"
    case v2 = "v2"
}

enum ServiceDomain: String {
    case EMPTY = ""
}

enum ServicePath: String {
    case GET_USERS = "users"
    case GET_POSTS = "users/{id}/posts"
    case CREATE_POSTS = "posts"
}

class URLBuilder {
    
    private var host: String = ""
    private var domain: String = ""
    private var version: String = ""
    private var path: String = ""
    
    func urlBase() -> URLBuilder {
        self.host = "https://jsonplaceholder.typicode.com" + "/"
        return self
    }
    
    func domain(_ domain: ServiceDomain) -> URLBuilder {
        self.domain = domain.rawValue + "/"
        return self
    }
    
    func version(_ version: ServiceVersion) -> URLBuilder {
        self.version = version.rawValue + "/"
        return self
    }
    
    func path(_ path: ServicePath) -> URLBuilder {
        self.path = path.rawValue
        return self
    }
    
    func build() -> String {
        let url = "\(self.host)\(self.domain)\(self.version)\(self.path)"
        return url
    }
    
    func param(_ key: String, value: String) -> URLBuilder {
        self.path = self.path.replacingOccurrences(of: "{\(key)}", with: value)
        return self
    }
}
