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
    
    private var users: [UserModel.GetUsers.User] = []
    
    internal var presenter: UsersPresenter?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.setUpView()
        self.setDelegates()
        self.presenter?.getUsers()
    }
    
    override func viewWillLayoutSubviews() {
        super.updateViewConstraints()
        self.setPostsHeightConstraint()
    }
    
    private func setUpView() {
    }
    
    private func setDelegates() {
        self.postsTableView.dataSource = self
        self.postsTableView.register(UserViewCell.self)
        self.postsTableView.rowHeight = UITableView.automaticDimension
        self.postsTableView.estimatedRowHeight = UITableView.automaticDimension
        self.screenScrollView.refreshControl = self.refreshControl
        self.screenScrollView.refreshControl?.addTarget(self, action: #selector(self.refreshTransactions(_:)), for: .valueChanged)
    }
    
    @objc private func refreshTransactions(_ sender: Any) {
        self.users.removeAll()
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
        self.users = data
        if (!self.users.isEmpty) {
            self.postsTableView.reloadData()
            self.setPostsHeightConstraint()
        }
    }
}

extension UsersViewController: UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if (self.users.isEmpty) {
            return 2
        } else {
            return self.users.count
        }
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell: UserViewCell = tableView.dequeueCell(forIndexPath: indexPath)
        if (self.users.isEmpty) {
            cell.displayShimmers()
        } else {
            let user: UserModel.GetUsers.User = self.users[indexPath.row]
            cell.setUpCell(user: user)
            cell.tapped = { [weak self] (user) -> Void in
                guard self != nil else { return }
            }
        }
        return cell
    }
}
