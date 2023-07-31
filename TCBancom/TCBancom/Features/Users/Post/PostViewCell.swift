//
//  PostViewCell.swift
//  TCBancom
//
//  Created by Brayan Munoz Campos on 31/07/23.
//

import UIKit
import UIComponents
import Common

class PostViewCell: UITableViewCell {
    
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var bodyLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }
    
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
    
    func setUpCell() {
        self.setLoadingView(showShimmer: false)
        self.titleLabel.text = "sunt aut facere repellat provident occaecati excepturi optio reprehenderit"
        self.bodyLabel.text = "est rerum tempore vitae\nsequi sint nihil reprehenderit dolor beatae ea dolores neque\nfugiat blanditiis voluptate porro vel nihil molestiae ut reiciendis\nqui aperiam non debitis possimus qui neque nisi nulla"
    }
}
