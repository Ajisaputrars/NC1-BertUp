//
//  MainView.swift
//  NanoChallenge1
//
//  Created by Aji Saputra Raka Siwi on 11/04/20.
//  Copyright © 2020 Aji Saputra Raka Siwi. All rights reserved.
//

import UIKit

class MainScreenView: BaseView {
    
    let cityAndDateLabel: UILabel = {
        let label = UILabel()
        label.text = "Minggu, 20 September 2020"
        label.font = UIFont.systemFont(ofSize: 14, weight: .medium)
        return label
    }()
    
    let weatherImageView: UIImageView = {
        let imageView = UIImageView(image: UIImage(named: "sampleweatherimage"))
        return imageView
    }()
    
    let weatherDescriptionLabel: UILabel = {
        let label = UILabel()
        label.text = "25°C"
        label.font = UIFont.systemFont(ofSize: 14, weight: .medium)
        return label
    }()
    
    let illustrationImageView: UIImageView = {
        let imageView = UIImageView(image: UIImage(named: "sampleillustrationpurple"))
        imageView.contentMode = .scaleAspectFit
        return imageView
    }()
    
    let greetingLabel: UILabel = {
       let label = UILabel()
        label.text = "Selamat Pagi, Alberta"
        label.font = UIFont.systemFont(ofSize: 17, weight: .semibold)
        label.textAlignment = .center
        return label
    }()
    
    let motivationLabel: UILabel = {
       let label = UILabel()
        label.font = UIFont(name: "AvenirNext-Italic", size: 13)
        label.text = "Jarang orang mau mengakui, kesederhanaan adalah kekayaan yang terbesar di dunia ini: suatu karunia alam. Dan yang terpenting di atas segala-galanya ialah keberaniannya. Kesederhaan adalah kejujuran, dan keberanian adalah ketulusan."
        label.textAlignment = .center
        label.numberOfLines = 0
        label.minimumScaleFactor = 0.5
        label.adjustsFontSizeToFitWidth = true
        return label
    }()
    
    let toDoButton: UIButton = {
        let button = UIButton(type: UIButton.ButtonType.system)
        button.setImage(UIImage(named: "todoicon"), for: .normal)
        button.tintColor = BTUColor.purple
        return button
    }()
    
    let rewardButton: UIButton = {
        let button = UIButton(type: UIButton.ButtonType.system)
        button.setImage(UIImage(named: "rewardicon"), for: .normal)
        button.tintColor = BTUColor.purple
        return button
    }()
    
    let shuffleButton: UIButton = {
        let button = UIButton(type: UIButton.ButtonType.system)
        button.setImage(UIImage(named: "shuffleicon"), for: .normal)
        button.tintColor = BTUColor.purple
        return button
    }()
    
    override func setupView() {
        self.backgroundColor = .white
        
        self.addSubview(cityAndDateLabel)
        self.addSubview(weatherImageView)
        self.addSubview(weatherDescriptionLabel)
        self.addSubview(illustrationImageView)
        self.addSubview(greetingLabel)
        self.addSubview(motivationLabel)
        self.addSubview(toDoButton)
        self.addSubview(shuffleButton)
        self.addSubview(rewardButton)
        
        self.cityAndDateLabel.snp.makeConstraints { (make) in
            make.top.equalTo(self.safeAreaLayoutGuide).offset(16)
            make.left.equalTo(self).offset(16)
            make.right.equalTo(self).offset(-16)
            make.bottom.equalTo(weatherImageView.snp.top).offset(-8)
            make.height.equalTo(15)
        }
        
        self.weatherImageView.snp.makeConstraints { (make) in
            make.top.equalTo(cityAndDateLabel.snp.bottom).offset(8)
            make.left.equalTo(self).offset(16)
            make.right.equalTo(weatherDescriptionLabel.snp.left).offset(-8)
            make.bottom.equalTo(illustrationImageView.snp.top).offset(-16)
            make.size.equalTo(CGSize(width: 25, height: 25))
        }
        
        self.weatherDescriptionLabel.snp.makeConstraints { (make) in
            make.top.equalTo(cityAndDateLabel.snp.bottom).offset(10)
            make.left.equalTo(weatherImageView.snp.right).offset(8)
            make.height.equalTo(15)
        }
        
        self.illustrationImageView.snp.makeConstraints { (make) in
            make.top.equalTo(self.weatherImageView.snp.bottom).offset(16)
            make.left.equalTo(self).offset(8)
            make.right.equalTo(self).offset(-8)
            make.bottom.equalTo(greetingLabel.snp.top).offset(-16)
            make.height.equalTo(self.frame.size.height / 3.5)
        }
        
        self.greetingLabel.snp.makeConstraints { (make) in
            make.top.equalTo(illustrationImageView.snp.bottom).offset(16)
            make.left.equalTo(self).offset(16)
            make.right.equalTo(self).offset(-16)
            make.bottom.equalTo(motivationLabel.snp.top).offset(-8)
        }
        
        self.motivationLabel.snp.makeConstraints { (make) in
            make.top.equalTo(greetingLabel.snp.bottom).offset(8)
            make.left.equalTo(self).offset(16)
            make.right.equalTo(self).offset(-16)
            make.bottom.lessThanOrEqualTo(shuffleButton.snp.top).offset(-32)
        }
        
        self.toDoButton.snp.makeConstraints { (make) in
            make.left.equalTo(self).offset(16)
            make.bottom.equalTo(self.safeAreaLayoutGuide).offset(-16)
            make.size.equalTo(CGSize(width: self.frame.size.width / 4.5, height: self.frame.size.width / 4.5))
        }
        
        self.rewardButton.snp.makeConstraints { (make) in
            make.right.equalTo(self).offset(-16)
            make.bottom.equalTo(self.safeAreaLayoutGuide).offset(-16)
            make.size.equalTo(CGSize(width: self.frame.size.width / 4.5, height: self.frame.size.width / 4.5))
        }
        
        self.shuffleButton.snp.makeConstraints { (make) in
            make.bottom.equalTo(self.safeAreaLayoutGuide).offset(-24)
            make.centerX.equalTo(self)
            make.size.equalTo(CGSize(width: self.frame.size.width / 4, height: self.frame.size.width / 4))
        }
    }
}
