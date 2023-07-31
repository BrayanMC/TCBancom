//
//  CreatePostRouter.swift
//  TCBancom
//
//  Created by Brayan Munoz Campos on 31/07/23.
//

import UIKit

protocol CreatePostRouterProtocol: AnyObject {
}

class CreatePostRouter {
    
    var navigation: UINavigationController
    
    init(navigation: UINavigationController) {
        self.navigation = navigation
    }
    
    func getViewController(viewData: CreatePostViewData) -> UIViewController {
        CreatePostViewController.build(router: self, viewData: viewData)
    }
}

extension CreatePostRouter: CreatePostRouterProtocol {
}
