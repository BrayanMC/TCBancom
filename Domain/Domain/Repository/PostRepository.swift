//
//  PostRepository.swift
//  Domain
//
//  Created by Brayan Munoz Campos on 31/07/23.
//

import PromiseKit

public protocol PostRepository {
    func getPosts(params: PostModel.GetPostsByUserIdParams) -> Promise<[PostModel.Post]>
    func createPost(params: PostModel.CreatePostParams) -> Promise<PostModel.Post>
}
