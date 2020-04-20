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
    private var presenter: WeatherPresenter!
    private var greetingWithTime: String!
    private var weatherResponse: WeatherResponse!
    private var motivationResponse: [MotivationResponse]!

    override func viewDidLoad() {
        super.viewDidLoad()
        self.mainScreenView = MainScreenView(frame: self.view.frame)
        self.view = self.mainScreenView
        
        self.title = "BertUp!"
        
        self.setupNavigationBar()
        self.setupButtonsTarget()
        
        overrideUserInterfaceStyle = .light

        NotificationCenter.default.addObserver(forName: UIApplication.userDidTakeScreenshotNotification, object: nil, queue: OperationQueue.main) { notification in
            print("Screenshot taken!")
            UserDefaults.standard.set("Hhh", forKey: BTUString.reward2)
        }
        
        self.getDate()
        
        self.presenter = WeatherPresenter()
        self.presenter.getWeatherResponse(controller: self, service: BTUService(), url: BTUUrl.BASE_URL + BTUUrl.WEATHER_URL + APIKey.LOCATION + BTUUrl.WEATHER_APPID + APIKey.API_KEY)
        
        self.greetingWithTime = Utils.getTimeString(Utils.getTimeStatus())
        self.mainScreenView.greetingLabel.text = "Selamat \(self.greetingWithTime!), Alberta"
        
        self.setMotivationResponse()
        self.shuffleButtonPressed()

        Utils.lockOrientation(.portrait)
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(true)
        
        Utils.lockOrientation(.portrait)
    }
    
    deinit {
        NotificationCenter.default.removeObserver(self)
    }
    
    private func setupNavigationBar(){
        let textAttributes = [NSAttributedString.Key.foregroundColor:UIColor.white]
        self.navigationController?.navigationBar.titleTextAttributes = textAttributes
        self.navigationController?.navigationBar.isTranslucent = false
        self.navigationController?.navigationBar.barTintColor = BTUColor.purple
        self.navigationController?.navigationBar.tintColor = .white
        self.navigationItem.rightBarButtonItem = UIBarButtonItem(image: UIImage(named: "helpicon"), style: .plain, target: self, action: #selector(helpButtonPressed))
        self.navigationItem.backBarButtonItem = UIBarButtonItem(title: "", style: .plain, target: nil, action: nil)
    }
    
    private func setupButtonsTarget(){
        self.mainScreenView.rewardButton.addTarget(self, action: #selector(goToRewardScreen), for: .touchUpInside)
        self.mainScreenView.toDoButton.addTarget(self, action: #selector(goToToDoScreen), for: .touchUpInside)
        self.mainScreenView.shuffleButton.addTarget(self, action: #selector(shuffleButtonPressed), for: .touchUpInside)
    }
    
    @objc private func shuffleButtonPressed(){
        let i = Int.random(in: 0..<self.motivationResponse.count)
        self.mainScreenView.illustrationImageView.image = UIImage(named: self.motivationResponse[i].imageString)
        self.mainScreenView.motivationLabel.text = self.motivationResponse[i].motivation
    }
    
    @objc private func goToRewardScreen(){
        self.navigationController?.pushViewController(RewardScreenController(), animated: true)
    }
    
    @objc private func goToToDoScreen(){
        let toDoScreenController = ToDoScreenController()
        toDoScreenController.weatherResponse = self.weatherResponse
        toDoScreenController.delegate = self
        
        let controller = UINavigationController(rootViewController: toDoScreenController)
        controller.modalPresentationStyle = .fullScreen
        self.present(controller, animated: true, completion: nil)
    }
    
    @objc private func helpButtonPressed(){
        self.navigationController?.pushViewController(HelpScreenController(), animated: true)
    }
    
    private func getDate(){
        self.mainScreenView.cityAndDateLabel.text = "\(Utils.getDay()), \(Utils.getCalendar().date) \(Utils.getMonth()) \(Utils.getCalendar().year)"
    }
    
    private func setMotivationResponse(){
        if let path = Bundle.main.path(forResource: "Motivation", ofType: "json") {
            do {
                let data = try Data(contentsOf: URL(fileURLWithPath: path), options: .mappedIfSafe)
                let response = try Utils.getMotivationResponseParser(data: data)
                self.motivationResponse = response
            } catch let error {
                print(error.localizedDescription)
            }
        }
    }
}

extension MainScreenController: GetWeatherProtocol {    
    func setWeather(weatherResponse: WeatherResponse) {
        DispatchQueue.main.async {
            self.weatherResponse = weatherResponse
            self.mainScreenView.weatherImageView.kf.setImage(with: URL(string: "http://openweathermap.org/img/wn/\(weatherResponse.weather[0].icon)@2x.png"))
            self.mainScreenView.weatherDescriptionLabel.text = "\(Utils.kelvinToCelcius(weatherResponse.main.temp))°C"
        }
    }
    
    func error(error: Error) {
        DispatchQueue.main.async {
            Utils.createAlert(controller: self, title: "Error", message: error.localizedDescription, style: .alert)
        }
    }
}

extension MainScreenController: ToDoDelegate {
    func setToDoDone() {
        UserDefaults.standard.set(Utils.getTimeString(Utils.getTimeStatus()), forKey: "todo")
        UserDefaults.standard.set("Hhh", forKey: BTUString.reward0)
        print(UserDefaults.standard.string(forKey: "todo")!)
        
        DispatchQueue.global().async {
            Thread.sleep(forTimeInterval: 0.2)
            
            DispatchQueue.main.async {
                Utils.createAlert(controller: self, title: "Reward Unlocked", message: "Selamat! Kamu sudah mengerjakan semua to-do list hari ini. Ada reward baru yang aktif. Cek di halaman reward.", style: .alert)
            }
        }
    }
}
