//
//  UsersViewController.swift
//  TCBancom
//
//  Created by Brayan Munoz Campos on 31/07/23.
//

import UIKit
import Common
import UIComponents
import Domain

protocol UsersViewControllerProtocol: ViewProtocol {
    var presenter: UsersPresenter? { get }
    func showAlert(title: String, message: String, actionTitle: String, completion: (() -> Void)?)
    func showUsers(data: [UserModel.GetUsers.User])
    func showPosts(data: [PostModel.Post])
    func refreshPosts()
}

extension UsersViewController {
    
    static func build(router: UsersRouterProtocol) -> UIViewController {
        let vc = UsersViewController(nibName: "UsersViewController", bundle: nil)
        vc.presenter = UsersPresenter(view: vc, router: router)
        return vc
    }
}

class UsersViewController: BaseViewController {
    
    @IBOutlet weak var postsTableView: UITableView!
    @IBOutlet weak var postsHeightConstraint: NSLayoutConstraint!
    @IBOutlet weak var screenScrollView: UIScrollView!
    
    private let refreshControl = UIRefreshControl()
    
    private var userSections: [UserSection] = []
    private var posts: [PostModel.Post] = []
    
    internal var presenter: UsersPresenter?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.setDelegates()
        self.presenter?.getUsers()
    }
    
    override func viewWillLayoutSubviews() {
        super.updateViewConstraints()
        self.setPostsHeightConstraint()
    }
    
    private func setDelegates() {
        self.postsTableView.delegate = self
        self.postsTableView.dataSource = self
        self.postsTableView.register(UserViewCell.self)
        self.postsTableView.register(PostViewCell.self)
        self.postsTableView.rowHeight = UITableView.automaticDimension
        self.postsTableView.estimatedRowHeight = UITableView.automaticDimension
        self.screenScrollView.refreshControl = self.refreshControl
        self.screenScrollView.refreshControl?.addTarget(self, action: #selector(self.refreshTransactions(_:)), for: .valueChanged)
    }
    
    @objc private func refreshTransactions(_ sender: Any) {
        self.userSections.removeAll()
        self.postsTableView.reloadData()
        self.setPostsHeightConstraint()
        self.presenter?.getUsers()
    }
    
    private func setPostsHeightConstraint() {
        self.postsHeightConstraint.constant = self.postsTableView.intrinsicContentSize.height
    }
}

extension UsersViewController: UsersViewControllerProtocol {
    
    func startLoading() {
        ProgressView.showSpinner(inView: self.view)
    }
    
    func finishedLoading() {
        ProgressView.hideSpinner(inView: self.view)
    }
    
    func showAlert(title: String, message: String, actionTitle: String, completion: (() -> Void)? = nil) {
        self.showOneButtonAlert(title: title, message: message, actionTitle: actionTitle) {
            completion?()
        }
    }
    
    func showUsers(data: [UserModel.GetUsers.User]) {
        self.refreshControl.endRefreshing()
        data.forEach { user in
            let userSection = UserSection(
                id: user.id,
                name: user.name,
                username: user.username,
                email: user.email,
                phone: user.phone,
                street: user.address?.street ?? "",
                suite: user.address?.suite ?? "",
                city: user.address?.city ?? "",
                zipcode: user.address?.zipcode ?? ""
            )
            self.userSections.append(userSection)
        }
        if (!self.userSections.isEmpty) {
            self.postsTableView.reloadData()
            self.setPostsHeightConstraint()
        }
    }
    
    func showPosts(data: [PostModel.Post]) {
        self.posts = data
        if (!self.posts.isEmpty) {
            self.postsTableView.reloadData()
            self.setPostsHeightConstraint()
        }
    }
    
    func refreshPosts() {
        self.userSections.removeAll()
        self.postsTableView.reloadData()
        self.setPostsHeightConstraint()
        self.presenter?.getUsers()
    }
}

extension UsersViewController: UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        94
    }
}

extension UsersViewController: UITableViewDataSource {
    
    func numberOfSections(in tableView: UITableView) -> Int {
        if (self.userSections.isEmpty) {
            return 4
        } else {
            return self.userSections.count
        }
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if (!self.posts.isEmpty) {
            let userSection = self.userSections[section]
            if (!userSection.isExpand) {
                return 0
            }
            return self.posts.count
        }
        return 0
    }
    
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        let cell: UserViewCell = tableView.dequeueReusableHeaderFooterView()
        if (self.userSections.isEmpty) {
            cell.displayShimmers()
        } else {
            let userSection = self.userSections[section]
            cell.setUpCell(userSection: userSection)
            cell.tapped = { [weak self] (user) -> Void in
                guard self != nil else { return }
            }
            cell.toggleSection = { [weak self] (userId) -> Void in
                guard self != nil else { return }
                self?.userSections[section].isExpand = !(self?.userSections[section].isExpand ?? true)
                if (self?.userSections[section].isExpand ?? false) {
                    self?.presenter?.getPosts(userId: userId)
                } else {
                    tableView.reloadSections(NSIndexSet(index: section) as IndexSet, with: .automatic)
                    self?.setPostsHeightConstraint()
                }
            }
        }
        return cell
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell: PostViewCell = tableView.dequeueCell(forIndexPath: indexPath)
        if (self.posts.isEmpty) {
            cell.displayShimmers()
        } else {
            let post: PostModel.Post = self.posts[indexPath.row]
            cell.setUpCell(post: post)
        }
        return cell
    }
}
