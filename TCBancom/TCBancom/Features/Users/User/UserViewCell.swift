//
//  UserViewCell.swift
//  TCBancom
//
//  Created by Brayan Munoz Campos on 31/07/23.
//

import UIKit
import UIComponents
import Domain

class UserViewCell: UITableViewCell {
    
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var createPostButton: UIButton!
    @IBOutlet weak var arrowImageView: UIView!
    //@IBOutlet weak var transactionsTableView: UITableView!
    //@IBOutlet weak var transactionsHeightConstraint: NSLayoutConstraint!
    
    /*
     private var transactions: [Transaction.GetLastTransactionsResponse.ResultResponse.TransactionResponse] = [Transaction.GetLastTransactionsResponse.ResultResponse.TransactionResponse]()
     */
    
    var tapped: ((UserModel.GetUsers.User) -> Void)?
    
    override func awakeFromNib() {
        super.awakeFromNib()
        self.setUpView()
        //self.setDelegates()
        //self.updateMonthTransactions()
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        //self.setTransactionsHeightConstraint()
    }
    
    private func setUpView() {
    }
    
    private func setDelegates() {
        /*
         self.transactionsTableView.dataSource = self
         self.transactionsTableView.register(TransactionViewCell.self)
         self.transactionsTableView.rowHeight = UITableView.automaticDimension
         self.transactionsTableView.estimatedRowHeight = UITableView.automaticDimension
         */
    }
    
     private func setLoadingView(showShimmer: Bool) {
         //self.updateMonthTransactions()
         self.nameLabel.isShimmer(showShimmer)
         self.createPostButton.isHidden = showShimmer
         self.arrowImageView.isHidden = showShimmer
     }
    
    func displayShimmers() {
        self.setLoadingView(showShimmer: true)
    }
    
    func setUpCell(user: UserModel.GetUsers.User) {
        self.setLoadingView(showShimmer: false)
        self.nameLabel.text = user.name
    }
    
    /*
     
     func updateMonthTransactions() {
         self.transactions.removeAll()
         self.transactionsTableView.reloadData()
         self.setTransactionsHeightConstraint()
     }
     
     private func setTransactionsHeightConstraint() {
         self.transactionsHeightConstraint.constant = self.transactionsTableView.intrinsicContentSize.height
     }
     */
    
    @IBAction func createPostButtonTapped(_ sender: Any) {
    }
}

/*
 extension MonthTransactionViewCell: UITableViewDataSource {
     
     func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
         return self.transactions.isEmpty ? 2 : self.transactions.count
     }
     
     func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
         let cell: TransactionViewCell = tableView.dequeueCell(forIndexPath: indexPath)
         if (self.transactions.isEmpty) {
             cell.displayShimmers()
         } else {
             let transaction = self.transactions[indexPath.row]
             cell.setUpCell(transaction: transaction)
             cell.tapped = { [weak self] () -> Void in
                 guard self != nil else { return }
                 self?.tapped?(transaction)
             }
         }
         return cell
     }
 }
 */
