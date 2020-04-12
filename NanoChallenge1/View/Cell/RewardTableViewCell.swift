//
//  RewardTableViewCell.swift
//  NanoChallenge1
//
//  Created by Aji Saputra Raka Siwi on 12/04/20.
//  Copyright © 2020 Aji Saputra Raka Siwi. All rights reserved.
//

import UIKit

class RewardTableViewCell: BaseTableViewCell {
    
    let rewardImageView: UIImageView = {
       let imageView = UIImageView()
        imageView.backgroundColor = .blue
        return imageView
    }()
    
    let rewardTitleLabel: UILabel = {
        let label = UILabel()
        label.text = "Sample Title"
        return label
    }()
    
    let rewardDescriptionLabel: UILabel = {
        let label = UILabel()
        label.text = "Sample Description"
        return label
    }()
    
    override func setupView() {
        self.backgroundColor = .white
        
        self.addSubview(rewardImageView)
        self.addSubview(rewardTitleLabel)
        self.addSubview(rewardDescriptionLabel)
        
        rewardImageView.snp.makeConstraints { (make) in
            make.top.equalTo(self).offset(12)
            make.left.equalTo(self).offset(16)
            make.bottom.equalTo(self).offset(-12)
            make.size.equalTo(CGSize(width: self.frame.size.width / 3.5, height: 70)).priority(999)
            make.centerY.equalTo(self)
        }
        
        rewardTitleLabel.snp.makeConstraints { (make) in
            make.top.equalTo(self).offset(12)
            make.left.equalTo(rewardImageView.snp.right).offset(16)
            make.right.equalTo(self).offset(-8)
            make.bottom.equalTo(rewardDescriptionLabel.snp.top).offset(-8)
            make.height.equalTo(17)
        }
        
        rewardDescriptionLabel.snp.makeConstraints { (make) in
            make.top.equalTo(rewardTitleLabel.snp.bottom).offset(8)
            make.left.equalTo(rewardImageView.snp.right).offset(16)
            make.right.equalTo(self).offset(-8)
            make.bottom.lessThanOrEqualTo(self).offset(-12)
        }
    }
}
