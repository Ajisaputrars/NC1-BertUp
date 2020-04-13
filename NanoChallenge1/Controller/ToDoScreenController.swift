//
//  ToDoScreenController.swift
//  NanoChallenge1
//
//  Created by Aji Saputra Raka Siwi on 13/04/20.
//  Copyright © 2020 Aji Saputra Raka Siwi. All rights reserved.
//

import UIKit

class ToDoScreenController: UIViewController {
    
    private var toDoScreenView: ToDoScreenView!

    override func viewDidLoad() {
        super.viewDidLoad()
        self.toDoScreenView = ToDoScreenView(frame: self.view.frame)
        self.view = self.toDoScreenView

        self.title = "To Do Today"
        
        setupNavigationBar()
    }
    
    private func setupNavigationBar(){
        let textAttributes = [NSAttributedString.Key.foregroundColor:UIColor.white]
        self.navigationController?.navigationBar.titleTextAttributes = textAttributes
        self.navigationController?.navigationBar.isTranslucent = false
        self.navigationController?.navigationBar.barTintColor = BTUColor.red
        self.navigationController?.navigationBar.tintColor = .white
//        self.navigationItem.rightBarButtonItem = UIBarButtonItem(image: UIImage(named: "helpicon"), style: .plain, target: nil, action: nil)
//        self.navigationItem.backBarButtonItem = UIBarButtonItem(title: "", style: .plain, target: nil, action: nil)
    }
}
