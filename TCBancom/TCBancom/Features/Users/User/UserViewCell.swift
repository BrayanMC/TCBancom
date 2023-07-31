//
//  UserViewCell.swift
//  TCBancom
//
//  Created by Brayan Munoz Campos on 31/07/23.
//

import UIKit
import UIComponents
import Domain
import Common

class UserViewCell: UITableViewHeaderFooterView {
    
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var usernameLabel: UILabel!
    @IBOutlet weak var addressLabel: UILabel!
    @IBOutlet weak var emailLabel: UILabel!
    @IBOutlet weak var phoneNumberLabel: UILabel!
    @IBOutlet weak var loadingView: UIView!
    @IBOutlet weak var indicatorImageView: UIImageView!
    @IBOutlet weak var indicatorView: UIView!
    @IBOutlet weak var plusView: UIView!
    
    private var userId: Int = 0
    
    public static var identifier: String {
        return String(describing: UserViewCell.self)
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }
    
    var createPost: ((Int) -> Void)?
    var toggleSection: ((Int) -> Void)?
    
    private func setLoadingView(showShimmer: Bool) {
        self.nameLabel.isShimmer(showShimmer)
        self.loadingView.isShimmer(showShimmer)
        self.loadingView.isHidden = !showShimmer
        self.indicatorView.isHidden = showShimmer
        self.plusView.isHidden = showShimmer
        self.contentView.backgroundColor = showShimmer ? ColorManager.shared.gray0 : ColorManager.shared.gray30
     }
    
    func displayShimmers() {
        self.setLoadingView(showShimmer: true)
    }
    
    func setUpCell(userSection: UserSection) {
        self.setLoadingView(showShimmer: false)
        self.userId = userSection.id
        self.nameLabel.text = userSection.name
        self.usernameLabel.text = userSection.username
        self.addressLabel.text = "\(userSection.street), \(userSection.suite), \(userSection.city)"
        self.emailLabel.text = userSection.email
        self.phoneNumberLabel.text = userSection.phone
        self.indicatorImageView.image = userSection.isExpand ? ImageManager.shared.icArrowUp : ImageManager.shared.icArrowDown
    }
    
    @IBAction func handleSectionButtonTapped(_ sender: Any) {
        self.toggleSection?(self.userId)
    }
    
    @IBAction func createPostButtonTapped(_ sender: Any) {
        self.createPost?(self.userId)
    }
}
