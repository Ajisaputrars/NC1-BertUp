//
//  ToDoScreenView.swift
//  NanoChallenge1
//
//  Created by Aji Saputra Raka Siwi on 13/04/20.
//  Copyright © 2020 Aji Saputra Raka Siwi. All rights reserved.
//

import UIKit

class ToDoScreenView: BaseView {
    
    let scrollView: UIScrollView = {
        let scrollView = UIScrollView()
        return scrollView
    }()
    
    let photoImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.backgroundColor = .lightGray
        return imageView
    }()
    
    let greetingLabel: UILabel = {
        let label = UILabel()
        label.text = "Selamat Pagi, Alberta"
        label.font = UIFont(name: "AvenirNext-DemiBold", size: 19)
        label.textAlignment = .center
        return label
    }()
    
    let briefLabel: UILabel = {
        let label = UILabel()
        label.numberOfLines = 0
        label.textAlignment = .center
        label.font = UIFont(name: "AvenirNext-Italic", size: 12)
        label.text = "Hari libur gak pergi ke luar rumah kan, Alberta? Yuk kumpul bersama keluarga. Ini adalah saat yang tepat. Luangkan waktu bersama mereka."
        return label
    }()
    
    let weatherImageView: UIImageView = {
        let imageView = UIImageView(image: UIImage(named: "sampleweatherimage"))
        return imageView
    }()
    
    let weatherDescription: UILabel = {
        let label = UILabel()
        label.text = "25°C"
        return label
    }()
    
    lazy var weatherStackView: UIStackView = {
        let stackView = UIStackView(arrangedSubviews: [weatherImageView, weatherDescription])
        stackView.alignment = .center
        stackView.distribution = .fill
        stackView.axis = .horizontal
        stackView.spacing = 5
        stackView.translatesAutoresizingMaskIntoConstraints = false
        return stackView
    }()
    
    let tipsTitleLabel: UILabel = {
        let label = UILabel()
        label.text = "Tips buat Alberta biar makin semangat :"
        label.font = UIFont(name: "AvenirNext-DemiBold", size: 16)
        label.adjustsFontSizeToFitWidth = true
        return label
    }()
    
    let tipsListsLabel: UILabel = {
        let label = UILabel()
        label.numberOfLines = 0
        label.text = "•Sample 1\n•Sample 2\n•Sample 3\n "
        label.font = UIFont.systemFont(ofSize: 14, weight: .regular)
        return label
    }()
    
    let toDoListTitleLabel: UILabel = {
        let label = UILabel()
        label.text = "To-do list hari ini: "
        label.font = UIFont(name: "AvenirNext-DemiBold", size: 16)
        return label
    }()
    
    let toDoListDescriptionLabel: UILabel = {
        let label = UILabel()
        label.text = "Pastikan kamu sudah lakukan hal-hal ini di pagi ini biar lebih semangat : "
        label.numberOfLines = 0
        label.font = UIFont.systemFont(ofSize: 14, weight: .regular)
        return label
    }()
    
    let toDoListTableView: UITableView = {
        let tableView = UITableView()
        return tableView
    }()
    
    let doneButton: UIButton = {
        let button = UIButton(type: UIButton.ButtonType.system)
        return button
    }()
    
    override func setupView() {
        self.backgroundColor = .white
        
        self.addSubview(scrollView)
        scrollView.addSubview(photoImageView)
        scrollView.addSubview(greetingLabel)
        scrollView.addSubview(briefLabel)
        scrollView.addSubview(weatherStackView)
        scrollView.addSubview(tipsTitleLabel)
        scrollView.addSubview(tipsListsLabel)
        scrollView.addSubview(toDoListTitleLabel)
        scrollView.addSubview(toDoListDescriptionLabel)
        scrollView.addSubview(toDoListTableView)
        scrollView.addSubview(doneButton)

        self.scrollView.snp.makeConstraints { (make) in
            make.top.left.right.bottom.equalTo(self)
        }
        
        self.photoImageView.snp.makeConstraints { (make) in
            make.top.equalTo(scrollView).offset(32)
            make.centerX.equalTo(scrollView)
            make.size.equalTo(CGSize(width: self.frame.size.width / 2.5, height: self.frame.size.width / 2.5))
        }
        
        self.greetingLabel.snp.makeConstraints { (make) in
            make.top.equalTo(photoImageView.snp.bottom).offset(16)
            make.left.right.equalTo(scrollView)
            make.bottom.equalTo(briefLabel.snp.top).offset(-8)
            make.centerX.equalTo(scrollView)
        }
        
        self.briefLabel.snp.makeConstraints { (make) in
            make.top.equalTo(greetingLabel.snp.bottom).offset(8)
            make.left.equalTo(scrollView).offset(32)
            make.right.equalTo(scrollView).offset(-32)
            make.bottom.equalTo(weatherStackView.snp.top).offset(-16)
        }
        
        self.weatherStackView.snp.makeConstraints { (make) in
            make.top.equalTo(briefLabel.snp.bottom).offset(16)
            make.centerX.equalTo(scrollView)
        }
        
        self.weatherImageView.snp.makeConstraints { (make) in
            make.size.equalTo(CGSize(width: self.frame.size.width / 8, height: self.frame.size.width / 8))
        }
        
        self.tipsTitleLabel.snp.makeConstraints { (make) in
            make.top.equalTo(weatherImageView.snp.bottom).offset(8)
            make.left.equalTo(scrollView).offset(16)
            make.right.equalTo(scrollView).offset(-16)
            make.bottom.equalTo(tipsListsLabel.snp.top).offset(-8)
        }
        
        self.tipsListsLabel.snp.makeConstraints { (make) in
            make.top.equalTo(tipsTitleLabel.snp.bottom).offset(8)
            make.left.equalTo(scrollView).offset(16)
            make.right.equalTo(scrollView).offset(-16)
            make.bottom.equalTo(toDoListTitleLabel.snp.top).offset(-8)
        }
        
        self.toDoListTitleLabel.snp.makeConstraints { (make) in
            make.top.equalTo(tipsListsLabel.snp.bottom).offset(8)
            make.left.equalTo(scrollView).offset(16)
            make.right.equalTo(scrollView).offset(-16)
            make.bottom.equalTo(toDoListDescriptionLabel.snp.top).offset(-8)
        }
        
        self.toDoListDescriptionLabel.snp.makeConstraints { (make) in
            make.top.equalTo(toDoListTitleLabel.snp.bottom).offset(8)
            make.left.equalTo(scrollView).offset(16)
            make.right.equalTo(scrollView).offset(-16)
            
        }
    }
}
