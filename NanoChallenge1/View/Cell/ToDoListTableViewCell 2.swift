//
//  ToDoListTableViewCell.swift
//  NanoChallenge1
//
//  Created by Aji Saputra Raka Siwi on 13/04/20.
//  Copyright © 2020 Aji Saputra Raka Siwi. All rights reserved.
//

import UIKit
import BEMCheckBox

class ToDoListTableViewCell: BaseTableViewCell {
    
    let checkBox: BEMCheckBox = {
        let checkBox = BEMCheckBox()
        checkBox.onTintColor = BTUColor.purple //Border color
        checkBox.onCheckColor = BTUColor.purple //Checked color
        checkBox.onAnimationType = .bounce
        checkBox.offAnimationType = .bounce
        return checkBox
    }()
    
    let toDoListLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 14, weight: .regular)
        label.numberOfLines = 0
        return label
    }()
    
    override func setupView() {
        self.backgroundColor = .white
        
        self.addSubview(checkBox)
        self.addSubview(toDoListLabel)
        
        self.checkBox.snp.makeConstraints { (make) in
            make.top.equalTo(self).offset(8)
            make.left.equalTo(self).offset(16)
            make.right.equalTo(toDoListLabel.snp.left).offset(-8)
            make.bottom.equalTo(self).offset(-8)
            make.size.equalTo(CGSize(width: 30, height: 30)).priority(999)
        }
        
        self.toDoListLabel.snp.makeConstraints { (make) in
            make.top.equalTo(self)//.offset(8)
            make.left.equalTo(checkBox.snp.right).offset(8)
            make.right.equalTo(self).offset(-8)
            make.bottom.equalTo(self)//.offset(-8)
        }
    }
}
