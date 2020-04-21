//
//  RewardScreenView.swift
//  NanoChallenge1
//
//  Created by Aji Saputra Raka Siwi on 12/04/20.
//  Copyright © 2020 Aji Saputra Raka Siwi. All rights reserved.
//

import UIKit

class RewardScreenView: BaseView {
    
    let rewardTableView: UITableView = {
        let tableView = UITableView()
        tableView.register(RewardTableViewCell.self, forCellReuseIdentifier: "Reward")
        return tableView
    }()
    
    override func setupView() {
        self.backgroundColor = .white
        
        self.addSubview(rewardTableView)
        
        rewardTableView.snp.makeConstraints { (make) in
            make.top.left.right.bottom.equalTo(self.safeAreaLayoutGuide)
        }
    }
}
