//
//  PostViewCell.swift
//  TCBancom
//
//  Created by Brayan Munoz Campos on 31/07/23.
//

import UIKit
import UIComponents
import Common
import Domain

class PostViewCell: UITableViewCell {
    
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var bodyLabel: UILabel!
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
    
    private func setLoadingView(showShimmer: Bool) {
        self.titleLabel.isShimmer(showShimmer)
        self.bodyLabel.isShimmer(showShimmer)
    }
    
    func displayShimmers() {
        self.setLoadingView(showShimmer: true)
    }
    
    func setUpCell(post: PostModel.Post) {
        self.setLoadingView(showShimmer: false)
        self.titleLabel.text = post.title
        self.bodyLabel.text = post.body
    }
}
