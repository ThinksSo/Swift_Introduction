//
//  GroupsViewController.swift
//  GB_HW_OL_S1_3
//
//  Created by OL on 12.08.2023.
//

import UIKit

final class GroupsViewController: UITableViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad ()
        title = "Groups"
        view.backgroundColor = .white
        tableView.backgroundColor = .white
        navigationController?.navigationBar.tintColor = .black
        navigationController?.navigationBar.barTintColor = .black
    }


    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        20
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        GroupCell ()
    }
}
