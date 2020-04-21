//
//  HelpScreenController.swift
//  NanoChallenge1
//
//  Created by Aji Saputra Raka Siwi on 13/04/20.
//  Copyright © 2020 Aji Saputra Raka Siwi. All rights reserved.
//

import UIKit

class HelpScreenController: UIViewController {
    
    private var helpScreenView: HelpScreenView!

    override func viewDidLoad() {
        super.viewDidLoad()
        self.helpScreenView = HelpScreenView(frame: self.view.frame)
        self.view = self.helpScreenView
        
        self.title = "Help"

        // Do any additional setup after loading the view.
        
        overrideUserInterfaceStyle = .light
    }
}
