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
    private var rewards = [RewardResponse]()

    override func viewDidLoad() {
        super.viewDidLoad()
        self.rewardScreenView = RewardScreenView(frame: self.view.frame)
        self.view = self.rewardScreenView
        
        self.title = "Rewards"
        
        self.rewardScreenView.rewardTableView.delegate = self
        self.rewardScreenView.rewardTableView.dataSource = self
        
        overrideUserInterfaceStyle = .light
        setupRewards()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(true)
        
        Utils.lockOrientation(.portrait)
    }
    
    private func setupRewards(){
        if let path = Bundle.main.path(forResource: "Reward", ofType: "json") {
            do {
                let data = try Data(contentsOf: URL(fileURLWithPath: path), options: .mappedIfSafe)
                let response = try Utils.getRewardResponseParser(data: data)
                self.rewards = response
            } catch let error {
                print(error.localizedDescription)
            }
        }
    }
}

//MARK: Table View Delegate and Data Source
extension RewardScreenController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.rewards.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Reward", for: indexPath) as! RewardTableViewCell
        
        if indexPath.row == 0 {
            if let _ = UserDefaults.standard.string(forKey: BTUString.reward0) {
                cell.rewardImageView.image = UIImage(named: self.rewards[indexPath.row].imageString)
                cell.rewardTitleLabel.text = self.rewards[indexPath.row].title
                cell.rewardDescriptionLabel.text = self.rewards[indexPath.row].description
            } else {
                cell.rewardImageView.image = UIImage(named: "lockedimageplaceholder")
                cell.rewardTitleLabel.text = "This item is still locked"
                cell.rewardDescriptionLabel.text = "This item is still locked"
            }
        } else if indexPath.row == 1 {
            if let _ = UserDefaults.standard.string(forKey: BTUString.reward1) {
                cell.rewardImageView.image = UIImage(named: self.rewards[indexPath.row].imageString)
                cell.rewardTitleLabel.text = self.rewards[indexPath.row].title
                cell.rewardDescriptionLabel.text = self.rewards[indexPath.row].description
            } else {
                cell.rewardImageView.image = UIImage(named: "lockedimageplaceholder")
                cell.rewardTitleLabel.text = "This item is still locked"
                cell.rewardDescriptionLabel.text = "This item is still locked"
            }
        } else if indexPath.row == 2 {
            if let _ = UserDefaults.standard.string(forKey: BTUString.reward2) {
                cell.rewardImageView.image = UIImage(named: self.rewards[indexPath.row].imageString)
                cell.rewardTitleLabel.text = self.rewards[indexPath.row].title
                cell.rewardDescriptionLabel.text = self.rewards[indexPath.row].description
            } else {
                cell.rewardImageView.image = UIImage(named: "lockedimageplaceholder")
                cell.rewardTitleLabel.text = "This item is still locked"
                cell.rewardDescriptionLabel.text = "This item is still locked"
            }
        } else if indexPath.row == 3 {
            if let _ = UserDefaults.standard.string(forKey: BTUString.reward3) {
                cell.rewardImageView.image = UIImage(named: self.rewards[indexPath.row].imageString)
                cell.rewardTitleLabel.text = self.rewards[indexPath.row].title
                cell.rewardDescriptionLabel.text = self.rewards[indexPath.row].description
            } else {
                cell.rewardImageView.image = UIImage(named: "lockedimageplaceholder")
                cell.rewardTitleLabel.text = "This item is still locked"
                cell.rewardDescriptionLabel.text = "This item is still locked"
            }
        } else if indexPath.row == 4 {
            if let _ = UserDefaults.standard.string(forKey: BTUString.reward4) {
                cell.rewardImageView.image = UIImage(named: self.rewards[indexPath.row].imageString)
                cell.rewardTitleLabel.text = self.rewards[indexPath.row].title
                cell.rewardDescriptionLabel.text = self.rewards[indexPath.row].description
            } else {
                cell.rewardImageView.image = UIImage(named: "lockedimageplaceholder")
                cell.rewardTitleLabel.text = "This item is still locked"
                cell.rewardDescriptionLabel.text = "This item is still locked"
            }
        }
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let cell = tableView.cellForRow(at: indexPath) as! RewardTableViewCell
        if cell.rewardTitleLabel.text == "This item is still locked" {
            Utils.createAlert(controller: self, title: "Locked Item", message: "Kamu belum bisa akses reward ini.", style: .alert)
        } else {
            let experienceView = ExperienceController()
            experienceView.modalPresentationStyle = .fullScreen
            experienceView.videoUrl = self.rewards[indexPath.row].fileBundleString
            Utils.lockOrientation(.all)
            self.navigationItem.backBarButtonItem = UIBarButtonItem(title: "", style: UIBarButtonItem.Style.plain, target: nil, action: nil)
            self.navigationController?.pushViewController(experienceView, animated: true)
        }
        tableView.deselectRow(at: indexPath, animated: true)
    }
}
