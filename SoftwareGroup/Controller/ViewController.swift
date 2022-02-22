//
//  ViewController.swift
//  SoftwareGroup
//
//  Created by MAC on 22/02/22.
//

import UIKit

class ViewController: UIViewController {
    var weatherDetail: WeatherModel?
    var weatherTableview = UITableView() // view
    let cellId = "cell"
    let cellId1 = "cell1"

    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.view.addSubview(weatherTableview)
        weatherTableview.translatesAutoresizingMaskIntoConstraints = false
        weatherTableview.topAnchor.constraint(equalTo:view.topAnchor).isActive = true
        weatherTableview.leftAnchor.constraint(equalTo:view.leftAnchor).isActive = true
        weatherTableview.rightAnchor.constraint(equalTo:view.rightAnchor).isActive = true
        weatherTableview.bottomAnchor.constraint(equalTo:view.bottomAnchor).isActive = true
        
        weatherTableview.delegate      =   self
        weatherTableview.dataSource    =   self
        weatherTableview.register(WeatherTableViewCell.self, forCellReuseIdentifier: cellId)
        weatherTableview.register(Section2TableViewCell.self, forCellReuseIdentifier: cellId1)

        self.fetchData()
    }
    
   
    func fetchData() {
        NetworkingAPI.shared.fetchWeatherDetail {[weak self] (weatherlistArray, err) in
            if let err = err {
                print("Failed to fetch data:", err)
                return
            }
            self?.weatherDetail = weatherlistArray
            if let _ = self?.weatherDetail{
                print(self?.weatherDetail as Any)
                self?.weatherTableview.reloadData()
                
            }
        }
    }

}
extension ViewController: UITableViewDelegate,UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if section == 0{
            return 1
        }else{
            return weatherDetail?.forecast?.forecastday?.count ?? 0

        }
        return 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {

        if indexPath.section == 0 {
            let cell = tableView.dequeueReusableCell(withIdentifier: cellId, for: indexPath) as! WeatherTableViewCell
            if weatherDetail != nil {
                
                cell.weather = self.weatherDetail
                print(self.weatherDetail?.location?.country)
            }
           return cell
        }else{
            let cell = tableView.dequeueReusableCell(withIdentifier: cellId1, for: indexPath) as! Section2TableViewCell
            if weatherDetail != nil {
                //cell.weather = self.weatherDetail
                let weatherOfDay = self.weatherDetail?.forecast?.forecastday?[indexPath.row]
                print(self.weatherDetail?.location?.country)
                cell.setWeatherDetail(weatherOfDay)

            }
            return cell

        }
        
       
        return UITableViewCell()
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        if indexPath.section == 0 {
            return 100
        }else{
            return 200
        }
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 2
    }

}
