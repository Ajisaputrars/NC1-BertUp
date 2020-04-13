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
        
        self.title = "Lorem Ipsum"
        
        self.setupNavigationBar()
        self.setupButtonsTarget()
        
        NotificationCenter.default.addObserver(forName: UIApplication.userDidTakeScreenshotNotification, object: nil, queue: OperationQueue.main) { notification in
            print("Screenshot taken!")
        }
    }
    
    deinit {
        NotificationCenter.default.removeObserver(self)
    }
    
    private func setupNavigationBar(){
        let textAttributes = [NSAttributedString.Key.foregroundColor:UIColor.white]
        self.navigationController?.navigationBar.titleTextAttributes = textAttributes
        self.navigationController?.navigationBar.isTranslucent = false
        self.navigationController?.navigationBar.barTintColor = BTUColor.red
        self.navigationController?.navigationBar.tintColor = .white
        self.navigationItem.rightBarButtonItem = UIBarButtonItem(image: UIImage(named: "helpicon"), style: .plain, target: nil, action: nil)
        self.navigationItem.backBarButtonItem = UIBarButtonItem(title: "", style: .plain, target: nil, action: nil)
    }
    
    private func setupButtonsTarget(){
        self.mainScreenView.rewardButton.addTarget(self, action: #selector(goToRewardScreen), for: .touchUpInside)
        self.mainScreenView.toDoButton.addTarget(self, action: #selector(goToToDoScreen), for: .touchUpInside)
    }
    
    @objc private func goToRewardScreen(){
        self.navigationController?.pushViewController(RewardScreenController(), animated: true)
    }
    
    @objc private func goToToDoScreen(){
        let controller = UINavigationController(rootViewController: ToDoScreenController())
        controller.modalPresentationStyle = .fullScreen
        self.present(controller, animated: true, completion: nil)
    }
}

