//
//  PostDataRepository.swift
//  Data
//
//  Created by Brayan Munoz Campos on 31/07/23.
//

import Alamofire
import PromiseKit
import Domain

public class PostDataRepository: PostRepository {
    
    public static let sharedInstance = PostDataRepository()
    private let restApiImpl: RepositoryRemote = RepositoryRemote.sharedInstance
    
    init() {}
    
    public func getPosts(params: PostModel.GetPostsByUserIdParams) -> Promise<[PostModel.Post]> {
        let url = URLBuilder()
            .urlBase()
            .path(.GET_POSTS)
            .param("id", value: String(params.id))
            .build()
        
        let headers = Headers.Header_Default.getHeader()
        let response: Promise<[PostResponse.Post]> = self.restApiImpl.call(url: url, method: .get, parameters: nil, headers: headers)
        return response.map { $0.map { $0.mapper() } }
    }
    
    public func createPost(params: PostModel.CreatePostParams) -> Promise<PostModel.Post> {
        let parameters: [String: Any] = [
            "userId": params.userId,
            "title": params.title,
            "body": params.body
        ]
        
        let url = URLBuilder()
            .urlBase()
            .path(.CREATE_POSTS)
            .build()
        
        let headers = Headers.Header_Default.getHeader()
        let response: Promise<PostResponse.Post> = self.restApiImpl.call(url: url, method: .post, parameters: parameters, headers: headers)
        return response.map { $0.mapper() }
    }
}
