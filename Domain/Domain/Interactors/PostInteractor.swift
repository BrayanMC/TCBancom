//
//  PostInteractor.swift
//  Domain
//
//  Created by Brayan Munoz Campos on 31/07/23.
//

import PromiseKit

public protocol PostInteractorProtocol {
    func getPosts(params: PostModel.GetPostsByUserIdParams) -> Promise<[PostModel.Post]>
    func createPost(params: PostModel.CreatePostParams) -> Promise<PostModel.Post>
}

public class PostInteractor: Interactor, PostInteractorProtocol {
    
    var postRepository: PostRepository!
    
    public override init(repository: Any) {
        super.init(repository: repository)
        
        self.postRepository = self.repository as? PostRepository
    }
    
    public func getPosts(params: PostModel.GetPostsByUserIdParams) -> Promise<[PostModel.Post]> {
        self.postRepository.getPosts(params: params)
    }
    
    public func createPost(params: PostModel.CreatePostParams) -> Promise<PostModel.Post> {
        self.postRepository.createPost(params: params)
    }
}

