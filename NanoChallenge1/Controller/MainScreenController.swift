//
//  ViewController.swift
//  NanoChallenge1
//
//  Created by Aji Saputra Raka Siwi on 11/04/20.
//  Copyright © 2020 Aji Saputra Raka Siwi. All rights reserved.
//

import UIKit

class MainScreenController: UIViewController {
    
    private var mainScreenView: MainScreenView!

    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.mainScreenView = MainScreenView(frame: self.view.frame)
        self.view = self.mainScreenView
        
        
        NotificationCenter.default.addObserver(forName: UIApplication.userDidTakeScreenshotNotification, object: nil, queue: OperationQueue.main) { notification in
            print("Screenshot taken!")
        }
    }
    
    deinit {
        NotificationCenter.default.removeObserver(self)
    }
}

