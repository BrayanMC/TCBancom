//
//  PostModel.swift
//  Domain
//
//  Created by Brayan Munoz Campos on 31/07/23.
//

public enum PostModel {}

// MARK: - Requests

extension PostModel {
    
    public struct GetPostsByUserIdParams {
        public var id: Int
        
        public init(id: Int) {
            self.id = id
        }
    }
    
    public struct CreatePostParams {
        public var userId: Int
        public var title: String
        public var body: String
        
        public init(userId: Int, title: String, body: String) {
            self.userId = userId
            self.title = title
            self.body = body
        }
    }
}

// MARK: - Responses

extension PostModel {
    
    public struct GetPosts {
        public var posts: [Post]
        
        public init(posts: [Post]) {
            self.posts = posts
        }
    }
    
    public struct Post {
        public var userId: Int
        public var Int: Int
        public var title: String
        public var body: String
        
        public init(userId: Int, Int: Int, title: String, body: String) {
            self.userId = userId
            self.Int = Int
            self.title = title
            self.body = body
        }
    }
}
