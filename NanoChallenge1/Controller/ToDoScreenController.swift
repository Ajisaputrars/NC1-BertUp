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
        
        self.toDoScreenView.toDoListTableView.delegate = self
        self.toDoScreenView.toDoListTableView.dataSource = self
        
        self.toDoScreenView.doneButton.addTarget(self, action: #selector(doneButtonPressed), for: .touchUpInside)
    }
    
    private func setupNavigationBar(){
        let textAttributes = [NSAttributedString.Key.foregroundColor:UIColor.white]
        self.navigationController?.navigationBar.titleTextAttributes = textAttributes
        self.navigationController?.navigationBar.isTranslucent = false
        self.navigationController?.navigationBar.barTintColor = BTUColor.red
        self.navigationController?.navigationBar.tintColor = .white
        
        self.navigationItem.rightBarButtonItem = UIBarButtonItem(image: UIImage(named: "closeicon"), style: UIBarButtonItem.Style.plain, target: self, action: #selector(dismissToDoController))
    }
    
    @objc private func dismissToDoController(){
        self.dismiss(animated: true, completion: nil)
    }
    
    @objc private func doneButtonPressed(){
        for i in 0..<ToDoList.sampleToDoLists.count {
            let cell = self.toDoScreenView.toDoListTableView.cellForRow(at: IndexPath(row: i, section: 0)) as! ToDoListTableViewCell
            if cell.checkBox.on == false {
                let alert = UIAlertController(title: "Belum Selesai", message: "Masih ada yang belum dikerjakan nih. Coba cek lagi", preferredStyle: .alert)
                alert.addAction(UIAlertAction(title: NSLocalizedString("OK", comment: "Default action"), style: .default, handler: { _ in
                    
                }))
                self.present(alert, animated: true, completion: nil)
                
                return
            }
        }
        
        let alert = UIAlertController(title: "Yakin Sudah Semua?", message: "Benarkah sudah dikerjakan semua?", preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: NSLocalizedString("Tapi Boong!", comment: "Default action"), style: .destructive, handler: { _ in
            
        }))
        
        alert.addAction(UIAlertAction(title: NSLocalizedString("Sudah dong!", comment: "Default action"), style: .default, handler: { _ in
            self.dismiss(animated: true, completion: nil)
        }))
        
        self.present(alert, animated: true, completion: nil)
    }
}

//MARK: Table View Delegate and Data Source
extension ToDoScreenController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return ToDoList.sampleToDoLists.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "ToDo", for: indexPath) as! ToDoListTableViewCell
        cell.toDoListLabel.text = ToDoList.sampleToDoLists[indexPath.row]
        setupToDoTableViewHeight()
        return cell
    }
    
    
    private func setupToDoTableViewHeight(){
        var frame = self.toDoScreenView.toDoListTableView.frame
        frame.size.height = self.toDoScreenView.toDoListTableView.contentSize.height
        self.toDoScreenView.toDoListTableView.snp.updateConstraints { (update) in
            update.height.equalTo(frame.size.height)
        }
    }
}
