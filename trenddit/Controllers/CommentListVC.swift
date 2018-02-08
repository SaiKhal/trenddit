//
//  CommentListVC.swift
//  trenddit
//
//  Created by Ashlee Krammer on 2/1/18.
//  Copyright © 2018 C4Q. All rights reserved.
//

import UIKit

class CommentListVC: UIViewController{
    
    //Purpose: (Controls Comment View)
    var commentListView = CommentListView()
    
    //View Did Load
    override func viewDidLoad() {
        super.viewDidLoad()
        view.addSubview(commentListView)
        commentListView.tableView.delegate = self
        commentListView.tableView.dataSource = self
        commentListView.tableView.register(DisplayPostCell.self, forCellReuseIdentifier: "DisplayPostCell")
        commentListView.tableView.register(CommentListCell.self, forCellReuseIdentifier: "CommentListCell")
        commentListView.commentTextField.delegate = self
    }

}

extension CommentListVC: UITableViewDelegate {
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        switch indexPath.row {
        case 0:
            return 350
        default:
            return 150
            
        }
    }
}

extension CommentListVC: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 10
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        switch indexPath.row {
        case 0:
            let cell = tableView.dequeueReusableCell(withIdentifier: "DisplayPostCell", for: indexPath)
            cell.selectionStyle = .none
            cell.layer.borderColor = UIColor.lightText.cgColor
            cell.layer.borderWidth = 1.0
            cell.layer.cornerRadius = 5
            cell.clipsToBounds = true
            return cell
        default:
            let cell = tableView.dequeueReusableCell(withIdentifier: "CommentListCell", for: indexPath)
            cell.selectionStyle = .none
            return cell
        }
    }
}

extension CommentListVC: UITextFieldDelegate {
    
    func textFieldDidBeginEditing(_ textField: UITextField) {
    //when clicked, display comment input view
    }
    
    func textFieldShouldEndEditing(_ textField: UITextField) -> Bool {
        //if you reach max characters for comment input view 
        return true
    }
    
}
