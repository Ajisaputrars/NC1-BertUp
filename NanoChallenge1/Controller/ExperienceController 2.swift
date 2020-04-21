//
//  ExperienceController.swift
//  NanoChallenge1
//
//  Created by Aji Saputra Raka Siwi on 14/04/20.
//  Copyright © 2020 Aji Saputra Raka Siwi. All rights reserved.
//

import UIKit
import AVKit

class ExperienceController: UIViewController {
    
    var videoUrl: String!
    var alreadyPlayVideo = false
    var videoPlayerView = VideoPlayerView()
    var videoExperienceView: VideoExperienceView!
    var duration: Double?
    var progressTime: Double?
    var playingVideo:Bool = false
    
    lazy var closeButton: UIButton = {
        let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        let image = UIImage(named: "Back")?.withRenderingMode(.alwaysTemplate)
        button.tintColor = .gray
        button.titleLabel?.font = UIFont.boldSystemFont(ofSize: 16)
        button.alpha = 0.4
        button.setImage(image, for: UIControl.State.normal)
        button.contentMode = .scaleAspectFit
        button.imageView?.contentMode = .scaleAspectFit
        button.imageEdgeInsets = UIEdgeInsets(top:0, left: 0, bottom:0, right: 0)
        button.addTarget(self, action:#selector(onClickClose), for: .touchUpInside)
        
        return button
    }()
    
    lazy var videoSlider: UISlider = {
        let slider = UISlider()
        slider.translatesAutoresizingMaskIntoConstraints = false
        slider.minimumTrackTintColor = .red
        slider.alpha = 0.5
        slider.setThumbImage(UIImage(), for: .normal)
        slider.setValue(0, animated: false)
        
        return slider
    }()
    
    @objc func onClickClose() {
        playingVideo = false
        navigationController?.popViewController(animated: true)
//        Utils.lockOrientation(.portrait)
        let value = UIInterfaceOrientation.portrait.rawValue
        UIDevice.current.setValue(value, forKey: "orientation")
        UINavigationController.attemptRotationToDeviceOrientation()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.videoExperienceView = VideoExperienceView(videoUrl: self.videoUrl)
        
        view.backgroundColor = .black
        
        self.navigationItem.largeTitleDisplayMode = .never
        self.navigationController?.navigationBar.isHidden = true
        self.navigationController?.isToolbarHidden = true
        
        view.addSubview(videoExperienceView)
        view.addSubview(closeButton)
        
        videoExperienceView.translatesAutoresizingMaskIntoConstraints = false
        videoExperienceView.topAnchor.constraint(equalTo: view.topAnchor).isActive = true
        videoExperienceView.leadingAnchor.constraint(equalTo: view.leadingAnchor).isActive = true
        videoExperienceView.trailingAnchor.constraint(equalTo: view.trailingAnchor).isActive = true
        videoExperienceView.bottomAnchor.constraint(equalTo: view.bottomAnchor).isActive = true
        
        closeButton.topAnchor.constraint(equalTo: view.topAnchor, constant: 16).isActive = true
        closeButton.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 16).isActive = true
        closeButton.widthAnchor.constraint(equalToConstant: 40).isActive = true
        closeButton.heightAnchor.constraint(equalToConstant: 40).isActive = true
        closeButton.layer.cornerRadius = 20
        
        view.addSubview(videoSlider)
        videoSlider.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 35).isActive = true
        videoSlider.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -35).isActive = true
        videoSlider.centerXAnchor.constraint(equalTo: view.safeAreaLayoutGuide.centerXAnchor).isActive = true
        videoSlider.bottomAnchor.constraint(equalTo: view.bottomAnchor).isActive = true
        
        playingVideo = true


        NotificationCenter.default.addObserver(self, selector: #selector(onDidReceiveProgressData), name: NSNotification.Name(rawValue: "progress"), object: .none)
        
        NotificationCenter.default.addObserver(self, selector: #selector(onDidReceiveDurationData), name: NSNotification.Name(rawValue: "duration"), object: .none)
    }
    
    deinit {
        NotificationCenter.default.removeObserver(self, name: Notification.Name("progress"), object: nil)
        NotificationCenter.default.removeObserver(self, name: Notification.Name("duration"), object: nil)
    }
    
    @objc func onDidReceiveDurationData(_ notification: Notification) {
        let userInfo = notification.userInfo
        duration = userInfo?["duration"] as? Double
        print(duration ?? 0.0)
        let durationFloat = duration ?? 0.0
        videoSlider.maximumValue = Float(durationFloat)           //can be tested once maximumvalue of 10 works with progress
        //videoSlider.maximumValue = 10                               //test value
    }
    
    @objc func onDidReceiveProgressData(_ notification: Notification) {
        let userInfo = notification.userInfo
        progressTime = userInfo?["progress"] as? Double
        print(progressTime ?? 0.0)
        let progressFloat = progressTime ?? 0.0
        videoSlider.value = Float(progressFloat)
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        //? Start the looping video player when the view appears
        let value = UIInterfaceOrientation.landscapeLeft.rawValue
        UIDevice.current.setValue(value, forKey: "orientation")
        videoExperienceView.play()
        alreadyPlayVideo = true
//        Utils.lockOrientation(.landscape)
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        if alreadyPlayVideo == true {
            let value = UIInterfaceOrientation.portrait.rawValue
            UIDevice.current.setValue(value, forKey: "orientation")
            videoExperienceView.pause()
        }
        self.navigationController?.navigationBar.isHidden = false
    }
    
    override var prefersHomeIndicatorAutoHidden: Bool {
        if (playingVideo) {
            return true
        }
        else {
            return false
        }
    }
}




