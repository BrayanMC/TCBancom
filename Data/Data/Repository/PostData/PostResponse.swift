//
//  PostResponse.swift
//  Data
//
//  Created by Brayan Munoz Campos on 31/07/23.
//

import Domain

public enum PostResponse {
}

extension PostResponse {
    
    public class GetPostsResponse: Decodable {
        public var posts: [Post]?
        
        private enum CodingKeys: String, CodingKey {
            case posts
        }
        
        required public init(from decoder: Decoder) throws {
            let container = try decoder.container(keyedBy: CodingKeys.self)
            self.posts = try container.decodeIfPresent([Post].self, forKey: .posts)
        }
        
        public func mapper() -> PostModel.GetPosts {
            return PostModel.GetPosts.init(posts: self.posts.map { $0.map { $0.mapper() } } ?? [])
        }
    }
    
    public class Post: Decodable {
        public var userId: Int?
        public var id: Int?
        public var title: String?
        public var body: String?
        
        private enum CodingKeys: String, CodingKey {
            case userId, id, title, body
        }
        
        required public init(from decoder: Decoder) throws {
            let container = try decoder.container(keyedBy: CodingKeys.self)
            self.userId = try container.decodeIfPresent(Int.self, forKey: .userId)
            self.id = try container.decodeIfPresent(Int.self, forKey: .id)
            self.title = try container.decodeIfPresent(String.self, forKey: .title)
            self.body = try container.decodeIfPresent(String.self, forKey: .body)
        }
        
        public func mapper() -> PostModel.Post {
            return PostModel.Post.init(userId: self.userId ?? 0, Int: self.id ?? 0, title: self.title ?? "", body: self.body ?? "")
        }
    }
}
