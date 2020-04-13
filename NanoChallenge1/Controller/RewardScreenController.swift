//
//  RewardScreenController.swift
//  NanoChallenge1
//
//  Created by Aji Saputra Raka Siwi on 12/04/20.
//  Copyright © 2020 Aji Saputra Raka Siwi. All rights reserved.
//

import UIKit

class RewardScreenController: UIViewController {
    
    private var rewardScreenView: RewardScreenView!

    override func viewDidLoad() {
        super.viewDidLoad()
        self.rewardScreenView = RewardScreenView(frame: self.view.frame)
        self.view = self.rewardScreenView
        
        self.title = "Rewards"
        
        self.rewardScreenView.rewardTableView.delegate = self
        self.rewardScreenView.rewardTableView.dataSource = self
        
        overrideUserInterfaceStyle = .light
    }
}

//MARK: Table View Delegate and Data Source
extension RewardScreenController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 5
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Reward", for: indexPath) as! RewardTableViewCell
        cell.rewardTitleLabel.text = "Sample Title \(indexPath.row)"
        return cell
    }
}
