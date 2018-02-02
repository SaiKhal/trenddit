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
    }

}

extension CommentListVC: UITableViewDelegate {
    
}

extension CommentListVC: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 10
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        return UITableViewCell()
    }
}
