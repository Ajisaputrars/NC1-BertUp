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
    internal var weatherResponse: WeatherResponse!
    private var presenter: WeatherPresenter!
    
    var delegate: ToDoDelegate!

    override func viewDidLoad() {
        super.viewDidLoad()
        self.toDoScreenView = ToDoScreenView(frame: self.view.frame)
        self.view = self.toDoScreenView

        self.title = "To Do Today"
        
        setupNavigationBar()
        
        self.toDoScreenView.toDoListTableView.delegate = self
        self.toDoScreenView.toDoListTableView.dataSource = self
        
        self.toDoScreenView.doneButton.addTarget(self, action: #selector(doneButtonPressed), for: .touchUpInside)
        
        overrideUserInterfaceStyle = .light
        
        if self.weatherResponse != nil {
            self.toDoScreenView.weatherImageView.kf.setImage(with: URL(string: "http://openweathermap.org/img/wn/\(self.weatherResponse.weather[0].icon)@2x.png"))
            self.toDoScreenView.weatherDescription.text = "\(Utils.kelvinToCelcius(self.weatherResponse.main.temp))°C"
        } else {
            self.presenter = WeatherPresenter()
            self.presenter.getWeatherResponse(controller: self, service: BTUService(), url: BTUUrl.BASE_URL + BTUUrl.WEATHER_URL + APIKey.LOCATION + BTUUrl.WEATHER_APPID + APIKey.API_KEY)
        }
        
        self.toDoScreenView.briefLabel.text = Utils.getBriefText()
        self.toDoScreenView.tipsListsLabel.text = Utils.getTipsText(Utils.getTimeStatus())
        self.toDoScreenView.greetingLabel.text = "Selamat \(Utils.getTimeString(Utils.getTimeStatus())), Alberta"
        
        if let toDoString = UserDefaults.standard.string(forKey: "todo") {
            if toDoString == Utils.getTimeString(Utils.getTimeStatus()) {
                self.toDoScreenView.disableDoneButton()
            } else {
                UserDefaults.standard.removeObject(forKey: "todo")
            }
        }
    }
    
    private func setupNavigationBar(){
        let textAttributes = [NSAttributedString.Key.foregroundColor:UIColor.white]
        self.navigationController?.navigationBar.titleTextAttributes = textAttributes
        self.navigationController?.navigationBar.isTranslucent = false
        self.navigationController?.navigationBar.barTintColor = BTUColor.purple
        self.navigationController?.navigationBar.tintColor = .white
        
        self.navigationItem.rightBarButtonItem = UIBarButtonItem(image: UIImage(named: "closeicon"), style: UIBarButtonItem.Style.plain, target: self, action: #selector(dismissToDoController))
    }
    
    @objc private func dismissToDoController(){
        self.dismiss(animated: true, completion: nil)
    }
    
    @objc private func doneButtonPressed(){
        for i in 0..<Utils.getToDoList(Utils.getTimeStatus()).count {
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
            self.delegate.setToDoDone()
            self.dismiss(animated: true, completion: nil)
        }))
        
        self.present(alert, animated: true, completion: nil)
    }
}

//MARK: Table View Delegate and Data Source
extension ToDoScreenController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return Utils.getToDoList(Utils.getTimeStatus()).count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "ToDo", for: indexPath) as! ToDoListTableViewCell
        cell.toDoListLabel.text = Utils.getToDoList(Utils.getTimeStatus())[indexPath.row]
        setupToDoTableViewHeight()
        
        if let toDoString = UserDefaults.standard.string(forKey: "todo") {
            if toDoString == Utils.getTimeString(Utils.getTimeStatus()) {
                print("Sama")
                cell.checkBox.isEnabled = false
                cell.checkBox.on = true
            }
        }
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

extension ToDoScreenController: GetWeatherProtocol {    
    func setWeather(weatherResponse: WeatherResponse) {
        DispatchQueue.main.async {
            self.weatherResponse = weatherResponse
            self.toDoScreenView.weatherImageView.kf.setImage(with: URL(string: "http://openweathermap.org/img/wn/\(self.weatherResponse.weather[0].icon)@2x.png"))
            self.toDoScreenView.weatherDescription.text = "\(Utils.kelvinToCelcius(self.weatherResponse.main.temp))°C"
        }
    }
    
    func error(error: Error) {
        DispatchQueue.main.async {
            Utils.createAlert(controller: self, title: "Error", message: error.localizedDescription, style: .alert)
        }
    }
}
